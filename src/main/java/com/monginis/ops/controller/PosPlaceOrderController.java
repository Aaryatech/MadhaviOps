package com.monginis.ops.controller;

import java.io.IOException;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.Month;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.monginis.ops.advorder.model.AdvanceOrderDetail;
import com.monginis.ops.advorder.model.AdvanceOrderHeader;
import com.monginis.ops.common.DateConvertor;
import com.monginis.ops.constant.Constant;
import com.monginis.ops.model.CategoryList;
import com.monginis.ops.model.Customer;
import com.monginis.ops.model.FrMenu;
import com.monginis.ops.model.FrSupplier;
import com.monginis.ops.model.Franchisee;
import com.monginis.ops.model.GetFrItem;
import com.monginis.ops.model.GetOrder;
import com.monginis.ops.model.Info;
import com.monginis.ops.model.Item;
import com.monginis.ops.model.ItemResponse;
import com.monginis.ops.model.ItemSup;
import com.monginis.ops.model.LoginInfo;
import com.monginis.ops.model.MCategory;
import com.monginis.ops.model.TabTitleData;
import com.monginis.ops.model.frsetting.FrSetting;
import com.monginis.ops.model.pettycash.PettyCashManagmt;
import com.monginis.ops.model.setting.NewSetting;

@Controller
@Scope("session")
public class PosPlaceOrderController {

	List<MCategory> mAllCategoryList = new ArrayList<MCategory>();

	CategoryList categoryList;

	private List<GetFrItem> frItemList = new ArrayList<>();
	private List<GetFrItem> prevFrItemList = new ArrayList<>();

	private int globalIndex = 0;
	private int currentMenuId = 0;
	List<String> catList = new ArrayList<>();
	public MultiValueMap<String, Object> map;
	public String qtyAlert = "Enter the Quantity as per the Limit.";

	@RequestMapping(value = "/showsPlaceOrder/{index}", method = RequestMethod.GET)
	public ModelAndView displaySavouries(@PathVariable("index") int index, HttpServletRequest request,
			HttpServletResponse response) throws ParseException {

		HttpSession session = request.getSession();

		ModelAndView model = new ModelAndView("POSOrder/placeOrder");

		RestTemplate restTemplate = new RestTemplate();
		ArrayList<Customer> custList = new ArrayList<>();
		try {

			categoryList = restTemplate.getForObject(Constant.URL + "showAllCategory", CategoryList.class);

			Customer[] list = restTemplate.getForObject(Constant.URL + "/getAllCustomers", Customer[].class);
			custList = new ArrayList<>(Arrays.asList(list));
			System.out.println("custlist" + custList.toString());

		} catch (Exception e) {
			System.out.println("Exception in getAllGategory" + e.getMessage());
			e.printStackTrace();

		}
		
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sf1 = new SimpleDateFormat("dd-MM-yyyy");
		Date date2 = new Date();
		
		map = new LinkedMultiValueMap<String, Object>();
		map.add("frId", frDetails.getFrId());
		PettyCashManagmt petty = restTemplate.postForObject(Constant.URL + "/getPettyCashDetails", map,
				PettyCashManagmt.class);
		
		String billDate=sf.format(date2);
		if(petty!=null) {
			
			SimpleDateFormat ymdSDF = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat ymdSDF1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			Calendar cal = Calendar.getInstance();
			cal.setTimeInMillis(Long.parseLong(petty.getDate()));
			cal.add(Calendar.DAY_OF_MONTH, 1);
		
			
			Date d1=cal.getTime();
			
			billDate=ymdSDF.format(cal.getTime());
			
			Calendar cal2 = Calendar.getInstance();
			cal2.set(Calendar.HOUR_OF_DAY, 0);
			cal2.set(Calendar.MINUTE, 0);
			cal2.set(Calendar.SECOND, 0);
			
			date2=cal2.getTime();
			
			System.err.println("DATE 1 ---------------------- "+d1);
			System.err.println("DATE 2 ---------------------- "+date2);
			
			
			System.err.println("DATE COMPARE-------------------------- "+d1.compareTo(date2));
			
			if(d1.compareTo(date2)>0) {
				System.err.println("ZERO");
				model.addObject("dispButton", 1);
			}else {
				System.err.println("NOT ZERO");
				model.addObject("dispButton", 0);
			}
			
			
			
			
		}
		
		

		mAllCategoryList = categoryList.getmCategoryList();

		// System.out.println(" All Category " + mAllCategoryList.toString());

		model.addObject("category", mAllCategoryList);
		model.addObject("custList", custList);

		// new*****************

		catList = new ArrayList<>();
		globalIndex = index;

		Date date = new Date(Calendar.getInstance().getTime().getTime());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat dfdmy = new SimpleDateFormat("dd-MM-yyyy");

		String currentDate = df.format(date);
		String currentDateFc = dfdmy.format(date);

		

		ArrayList<FrMenu> menuList = (ArrayList<FrMenu>) session.getAttribute("menuList");

		DateFormat dfReg = new SimpleDateFormat("yyyy-MM-dd");

		String todaysDate = dfReg.format(date);

		// order ,production ,delivery date logic

		int isSameDayApplicable = menuList.get(index).getIsSameDayApplicable();
		String menuTitle = menuList.get(index).getMenuTitle();

		System.out.println("Menu Title: " + menuTitle);

		String fromTime = menuList.get(index).getFromTime();
		String toTime = menuList.get(index).getToTime();

		ZoneId z = ZoneId.of("Asia/Calcutta");
		LocalTime currentTime = LocalTime.now(z); // Explicitly specify the desired/expected time zone.

		LocalTime formatedFromTime = LocalTime.parse(fromTime);
		LocalTime formatedToTime = LocalTime.parse(toTime);

		// currentTime = currentTime.plusHours(15);
		System.out.println("current time " + currentTime);
		System.out.println("from time " + formatedFromTime);

		String orderDate = "";
		String productionDate = "";
		String deliveryDate = "";

		if (formatedFromTime.isBefore(formatedToTime)) {

			orderDate = todaysDate;
			productionDate = todaysDate;

			if (isSameDayApplicable == 0 || isSameDayApplicable == 2) {

				deliveryDate = incrementDate(todaysDate, 1);
				System.out.println("inside 1.1");

			} else if (isSameDayApplicable == 1 || isSameDayApplicable == 3) {

				deliveryDate = todaysDate;

				System.out.println("inside 1.2");

			}

		} else {

			if (currentTime.isAfter(formatedFromTime)) {

				orderDate = todaysDate;
				productionDate = incrementDate(todaysDate, 1);

				deliveryDate = incrementDate(todaysDate, 2);

				System.out.println("inside 2.1");
			} else {

				orderDate = todaysDate;
				productionDate = todaysDate;
				deliveryDate = incrementDate(todaysDate, 1);
				System.out.println("inside 2.2");
			}

		}

		// System.out.println("Order date: " + orderDate);
		// System.out.println("Production date: " + productionDate);
		// System.out.println("Delivery date: " + deliveryDate);

		frItemList = new ArrayList<GetFrItem>();
		prevFrItemList = new ArrayList<GetFrItem>();
		List<GetOrder> orderList = new ArrayList<GetOrder>();
		int flagRes = 0;
		NewSetting settingValue = new NewSetting();
		try {
			RestTemplate rest = new RestTemplate();
			// new on 10 july
			// -----------------------------------------------------------------------------
			map = new LinkedMultiValueMap<String, Object>();
			map.add("settingKey", "show_prev_order");
			settingValue = rest.postForObject(Constant.URL + "/findNewSettingByKey", map, NewSetting.class);
			// ------------------------------------------------------------------------------

			System.out.println("Date is : " + currentDate);
			currentMenuId = menuList.get(index).getMenuId();
			if (currentMenuId == Integer.parseInt(settingValue.getSettingValue1())) {
				try {
					map = new LinkedMultiValueMap<String, Object>();
					map.add("frId", frDetails.getFrId());
					map.add("date", currentDateFc);
					map.add("menuId", settingValue.getSettingValue2());// new on 10 july
					orderList = rest.postForObject(Constant.URL + "/getOrdersListRes", map, List.class);
					// System.err.println("orderList:" + orderList.toString());
					model.addObject("orderList", orderList);

					flagRes = 1;
					model.addObject("flagRes", flagRes);
				} catch (Exception e) {
					flagRes = 0;
					model.addObject("flagRes", flagRes);

					e.printStackTrace();
				}
			}
			map = new LinkedMultiValueMap<String, Object>();

			map.add("items", menuList.get(index).getItemShow());
			map.add("frId", frDetails.getFrId());
			map.add("date", productionDate);
			map.add("menuId", menuList.get(index).getMenuId());
			map.add("isSameDayApplicable", isSameDayApplicable);

			restTemplate = new RestTemplate();

			ParameterizedTypeReference<List<GetFrItem>> typeRef = new ParameterizedTypeReference<List<GetFrItem>>() {
			};
			ResponseEntity<List<GetFrItem>> responseEntity = restTemplate.exchange(Constant.URL + "/getFrItems",
					HttpMethod.POST, new HttpEntity<>(map), typeRef);

			frItemList = responseEntity.getBody();
			prevFrItemList = responseEntity.getBody();
			// System.out.println("Fr Item List " + frItemList.toString());
		} catch (Exception e) {

			System.out.println("Exception Item List " + e.getMessage());
		}

		Set<String> setName = new HashSet<String>();

		double grandTotal = 0;

		for (int i = 0; i < frItemList.size(); i++) {

			if (frDetails.getFrRateCat() == 1) {
				grandTotal = grandTotal + (frItemList.get(i).getItemQty() * frItemList.get(i).getItemRate1());
			} else if (frDetails.getFrRateCat() == 2) {
				grandTotal = grandTotal + (frItemList.get(i).getItemQty() * frItemList.get(i).getItemRate2());

			} else if (frDetails.getFrRateCat() == 3) {
				grandTotal = grandTotal + (frItemList.get(i).getItemQty() * frItemList.get(i).getItemRate3());

			}
			setName.add(frItemList.get(i).getCatName());

		}

		catList.addAll(setName);

		List<TabTitleData> subCatListWithQtyTotal = new ArrayList<>();

		for (int i = 0; i < catList.size(); i++) {

			String subCat = catList.get(i);
			int qty = 0;
			double total = 0;

			for (int j = 0; j < frItemList.size(); j++) {

				if (frItemList.get(j).getCatName().equalsIgnoreCase(subCat)) {

					qty = qty + frItemList.get(j).getItemQty();

					if (frDetails.getFrRateCat() == 1) {

						total = total + (frItemList.get(j).getItemRate1() * frItemList.get(j).getItemQty());

					} else if (frDetails.getFrRateCat() == 2) {

						total = total + (frItemList.get(j).getItemRate2() * frItemList.get(j).getItemQty());

					} else if (frDetails.getFrRateCat() == 3) {

						total = total + (frItemList.get(j).getItemRate3() * frItemList.get(j).getItemQty());

					}

				}

			}

			TabTitleData tabTitleData = new TabTitleData();
			tabTitleData.setName(subCat);

			if (isSameDayApplicable != 2) {
				tabTitleData.setHeader(subCat + " (Rs." + roundUp(total) + ")" + "(Qty- " + qty + ")");
			} else if (isSameDayApplicable == 2) {
				if (subCat.equalsIgnoreCase("FRESH CREAM PASTRIES (EL)")) {
					tabTitleData.setHeader(subCat + " (Rs." + roundUp(total) + ")" + "(Qty- " + qty + ")" + "(Limit- "
							+ frDetails.getFrKg1() + ")");

				} else if (subCat.equalsIgnoreCase("FRESH CREAM SMALL GATEUX (S) (EL)")) {
					tabTitleData.setHeader(subCat + " (Rs." + roundUp(total) + ")" + "(Qty- " + qty + ")" + "(Limit- "
							+ frDetails.getFrKg2() + ")");

				} else if (subCat.equalsIgnoreCase("FRESH CREAM GATEUX (L) (EL)")) {
					tabTitleData.setHeader(subCat + " (Rs." + roundUp(total) + ")" + "(Qty- " + qty + ")" + "(Limit- "
							+ frDetails.getFrKg3() + ")");

				} else if (subCat.equalsIgnoreCase("Above 1 Kg Cake")) {
					tabTitleData.setHeader(subCat + " (Rs." + roundUp(total) + ")" + "(Qty- " + qty + ")" + "(Limit- "
							+ frDetails.getFrKg4() + ")");

				}

			}
			subCatListWithQtyTotal.add(tabTitleData);

		}

		/// System.out.println(catList);

		// toTime

		SimpleDateFormat _24HourSDF = new SimpleDateFormat("HH:mm");
		SimpleDateFormat _12HourSDF = new SimpleDateFormat("hh:mm a");
		java.util.Date toTime12Hrs = null;
		try {
			toTime12Hrs = _24HourSDF.parse(toTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		DateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
		Date itemOrderDate;
		Date itemDeliveryDate;
		String strOrderDate = null;
		String strDeliveryDate = null;
		try {
			itemOrderDate = (Date) parser.parse(orderDate);
			itemDeliveryDate = (Date) parser.parse(deliveryDate);
			DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			strOrderDate = formatter.format(itemOrderDate);
			strDeliveryDate = formatter.format(itemDeliveryDate);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addObject("menuList", menuList);

		model.addObject("subCatListTitle", subCatListWithQtyTotal);

		model.addObject("itemList", frItemList);
		model.addObject("grandTotal", grandTotal);
		model.addObject("frDetails", frDetails);
		model.addObject("delDate", dfdmy.format(date));
		model.addObject("currentDate", todaysDate);
		model.addObject("toTime", _12HourSDF.format(toTime12Hrs));
		model.addObject("orderDate", strOrderDate);
		model.addObject("productionDate", productionDate);
		model.addObject("deliveryDate", strDeliveryDate);
		model.addObject("menuTitle", menuTitle);
		model.addObject("menuIdFc", menuList.get(index).getMenuId());
		model.addObject("menuIdShow", settingValue.getSettingValue1());
		// System.out.println("isSameDayApplicable" + isSameDayApplicable);
		model.addObject("isSameDayApplicable", isSameDayApplicable);
		model.addObject("qtyMessage", qtyAlert);
		model.addObject("url", Constant.ITEM_IMAGE_URL);

		return model;
	}

	private Date yesterday() {
		final Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		return cal.getTime();
	}

	/*
	 * @RequestMapping(value = "/saveAdvanceOrder", method = RequestMethod.POST)
	 * public String saveAdvanceOrder(HttpServletRequest request,
	 * HttpServletResponse res) throws IOException {
	 */

	@RequestMapping(value = "/saveAdvanceOrder", method = RequestMethod.POST)
	@ResponseBody
	public AdvanceOrderHeader saveAdvanceOrder(HttpServletRequest request, HttpServletResponse response) {
		AdvanceOrderHeader info = null;
		try {
			RestTemplate restTemplate = new RestTemplate();
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			// LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");

			List<AdvanceOrderDetail> advDetailList = new ArrayList<AdvanceOrderDetail>();
			Date date = new Date(Calendar.getInstance().getTime().getTime());
			DateFormat dateFormat = new SimpleDateFormat("hh:mm:ss a");
			// DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			// DateFormat dfdmy = new SimpleDateFormat("dd-MM-yyyy");

			// String currentDate = df.format(date);
			// String currentDateFc = dfdmy.format(date);
			// DateFormat dfReg = new SimpleDateFormat("yyyy-MM-dd");
			DateFormat dfReg1 = new SimpleDateFormat("dd-MM-yyyy");
			String todaysDate = dfReg1.format(date);
			int menuId = Integer.parseInt(request.getParameter("menuId"));
			int custId = Integer.parseInt(request.getParameter("custId"));
			String total = request.getParameter("fintotal1");
			String devDate = request.getParameter("devDate");
			String deliveryTime = request.getParameter("delTime");
			System.err.println("devDate" + devDate);
			int rateCat = frDetails.getFrRateCat();
			Date date1 = dfReg1.parse(devDate);
			Date date2 = dfReg1.parse(todaysDate);
			String x1 = "";
			System.err.println(date1.compareTo(date2));
			if (date1.compareTo(date2) == 0) {
				x1 = incrementDate(DateConvertor.convertToYMD(devDate), 0);

			} else {
				x1 = incrementDate(DateConvertor.convertToYMD(devDate), -1);

			}

			int dm = 0;

			dm = Integer.parseInt(request.getParameter("dailyFlagMart"));
			System.err.println("Order date: " + todaysDate);
			System.err.println("Production date: " + x1);
			System.err.println("Delivery date: " + devDate);

			String advanceAmt = request.getParameter("advanceAmt");
			String remainAmt = request.getParameter("remainAmt");
			AdvanceOrderHeader advHeader = new AdvanceOrderHeader();
			advHeader.setAdvanceAmt(Float.parseFloat(advanceAmt));
			advHeader.setCustId(custId);
			advHeader.setDelStatus(0);
			advHeader.setExFloat1(0);
			advHeader.setExFloat2(0);

			int frId = frDetails.getFrId();
			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frId);
			FrSetting frSetting = restTemplate.postForObject(Constant.URL + "getFrSettingValue", map, FrSetting.class);
			int memoNo = 0;
			try {
				if (frSetting != null) {
					memoNo = Integer.parseInt(frSetting.getExVarchar());
				}
			} catch (Exception e) {
				memoNo = 0;
			}

			advHeader.setExInt1(memoNo);
			advHeader.setExInt2(1);
			// String strDelTime =
			// LocalTime.parse(deliveryTime).format(DateTimeFormatter.ofPattern("h:mm a"));
			String strDelTime = deliveryTime;

			advHeader.setExVar1(dateFormat.format(date));// Order Time
			advHeader.setExVar2(strDelTime);// Delivery Time
			//advHeader.setIsDailyMart(dm);
			advHeader.setIsDailyMart(2);
			advHeader.setRemainingAmt(Float.parseFloat(remainAmt));
			advHeader.setTotal(Float.parseFloat(total));
			advHeader.setFrId(frDetails.getFrId());
			advHeader.setOrderDate(todaysDate);
			advHeader.setDeliveryDate(devDate);
			advHeader.setProdDate(DateConvertor.convertToDMY(x1));
			advHeader.setIsBillGenerated(0);
			advHeader.setIsSellBillGenerated(0);
			float discAmt = 0.0f;
			float billTotal = 0;
			for (int i = 0; i < frItemList.size(); i++) {

				GetFrItem item = frItemList.get(i);
				String strQty = null;
				int qty = 0;
				try {

					strQty = request.getParameter(String.valueOf(item.getId()));
					System.err.println("inside det" + qty);
					qty = Integer.parseInt(strQty);

				} catch (Exception e) {
					strQty = null;
					qty = 0;

				}
				if (qty > 0) {
					AdvanceOrderDetail det = new AdvanceOrderDetail();
					det.setCatId(Integer.parseInt(item.getItemGrp1()));
					det.setDeliveryDate(devDate);
					det.setDelStatus(0);
					if (dm == 2) {
						det.setDiscPer(item.getDmDiscPer());
						if (rateCat == 1) {
							det.setMrp(Float.parseFloat(String.valueOf(item.getItemMrp1())));
							det.setRate((Float.parseFloat(String.valueOf(item.getItemMrp1()))));
							float calTotal = (Float.parseFloat(String.valueOf(item.getItemMrp1()))) * qty;
							float discountAmount = (calTotal * item.getDmDiscPer()) / 100;
							discAmt = discAmt + discountAmount;
							float subTotal = calTotal - discountAmount;
							det.setSubTotal(CustomerBillController.roundUp(subTotal));
						} else if (rateCat == 3) {
							det.setMrp(Float.parseFloat(String.valueOf(item.getItemMrp3())));
							det.setRate((Float.parseFloat(String.valueOf(item.getItemMrp3()))));
							float calTotal = (Float.parseFloat(String.valueOf(item.getItemMrp3()))) * qty;
							float discountAmount = (calTotal * item.getDmDiscPer()) / 100;
							discAmt = discAmt + discountAmount;
							float subTotal = calTotal - discountAmount;
							det.setSubTotal(CustomerBillController.roundUp(subTotal));
						}
					} else {
						det.setDiscPer(item.getDiscPer());
						if (rateCat == 1) {
							det.setMrp(Float.parseFloat(String.valueOf(item.getItemMrp1())));

							float calTotal = 0;

							if (frDetails.getFrKg1() == 1) {
								det.setRate((Float.parseFloat(String.valueOf(item.getItemMrp1()))));
								calTotal = (Float.parseFloat(String.valueOf(item.getItemMrp1()))) * qty;
							} else {
								det.setRate((Float.parseFloat(String.valueOf(item.getItemRate1()))));
								calTotal = (Float.parseFloat(String.valueOf(item.getItemRate1()))) * qty;
							}

							// det.setRate((Float.parseFloat(String.valueOf(item.getItemRate1()))));
							// float calTotal = (Float.parseFloat(String.valueOf(item.getItemRate1()))) *
							// qty;

							float discountAmount = (calTotal * item.getDiscPer()) / 100;
							float subTotal = calTotal - discountAmount;
							discAmt = discAmt + discountAmount;
							det.setSubTotal(CustomerBillController.roundUp(subTotal));

							billTotal = billTotal + calTotal;

						} else if (rateCat == 3) {
							det.setMrp(Float.parseFloat(String.valueOf(item.getItemMrp3())));

							float calTotal = 0;

							if (frDetails.getFrKg1() == 1) {
								det.setRate((Float.parseFloat(String.valueOf(item.getItemMrp3()))));
								calTotal = (Float.parseFloat(String.valueOf(item.getItemMrp3()))) * qty;
							} else {
								det.setRate((Float.parseFloat(String.valueOf(item.getItemRate3()))));
								calTotal = (Float.parseFloat(String.valueOf(item.getItemRate3()))) * qty;
							}

							// det.setRate((Float.parseFloat(String.valueOf(item.getItemRate3()))));
							// float calTotal = (Float.parseFloat(String.valueOf(item.getItemRate3()))) *
							// qty;

							float discountAmount = (calTotal * item.getDiscPer()) / 100;
							discAmt = discAmt + discountAmount;
							float subTotal = calTotal - discountAmount;
							det.setSubTotal(CustomerBillController.roundUp(subTotal));

							billTotal = billTotal + calTotal;

						}
					}
					det.setEvents("");
					det.setEventsName("");
					det.setExFloat1(0);
					det.setExFloat2(0);
					det.setExInt1(0);
					det.setExInt2(0);
					det.setExVar1("NA");
					det.setExVar2("NA");
					det.setFrId(frDetails.getFrId());
					int frGrnTwo = frDetails.getGrnTwo();
					if (frGrnTwo == 1) {
						det.setGrnType(frDetails.getGrnTwo());
					} else {

						det.setGrnType(2);
					}
					det.setIsBillGenerated(0);
					det.setItemId((item.getId()));
					det.setMenuId(menuId);
					det.setOrderDate(todaysDate);
					det.setProdDate(DateConvertor.convertToDMY(x1));
					det.setQty(qty);
					det.setIsBillGenerated(0);
					det.setIsSellBillGenerated(0);
					det.setTax1(0);
					det.setTax1Amt(0);
					det.setTax2(0);
					det.setTax2Amt(0);
					det.setSubCatId(Integer.parseInt(item.getItemGrp2()));
					advDetailList.add(det);
				}
			}

			if (dm == 1) {
				advHeader.setTotal(billTotal);

				float adv = Float.parseFloat(advanceAmt);
				float rem = billTotal - adv;

				advHeader.setRemainingAmt(rem);

			}

			if (advDetailList.size() > 0 && (date1.compareTo(date2) > 0)) {
				advHeader.setDiscAmt(discAmt);
				advHeader.setDetailList(advDetailList);

				info = restTemplate.postForObject(Constant.URL + "/saveAdvanceOrderHeadAndDetail", advHeader,
						AdvanceOrderHeader.class);
				
				if(info.getAdvHeaderId()>0) {
					
					Info updateFrSettingAdvOrderMemoSerialNo = restTemplate.postForObject(Constant.URL + "updateFrSettingAdvOrderMemoSerialNo", map, Info.class);

				}
				
			} else {
				System.err.println("inside saveAdvanceOrder");
				info = new AdvanceOrderHeader();
				info.setAdvHeaderId(0);
			}
			// System.err.println("inside saveAdvanceOrder"+info.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;

	}

	@RequestMapping(value = "/saveQuickCust", method = RequestMethod.POST)
	@ResponseBody
	public Customer editFrSupplier(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		Customer cust = new Customer();
		try {

			String custName = request.getParameter("custName");
			String phoneNum = request.getParameter("phoneNum");
			String ageGrp = request.getParameter("ageGrp");
			String dob = request.getParameter("dob");
			String gstNo = null;
			String compName = null;

			String address = null;

			int isBuiss = Integer.parseInt(request.getParameter("isBuiss"));
			int gender = Integer.parseInt(request.getParameter("gender"));

			if (isBuiss == 1) {
				gstNo = request.getParameter("gstNo");
				compName = request.getParameter("compName");
				address = request.getParameter("address");
			}

			cust.setAddress(address);
			cust.setAgeGroup(ageGrp);
			cust.setCompanyName(compName);
			cust.setCustDob(DateConvertor.convertToYMD(dob));
			cust.setCustName(custName);
			cust.setDelStatus(0);
			cust.setExInt1(1);
			cust.setExInt2(1);
			cust.setExVar1("NA");
			cust.setExVar2("NA");
			cust.setFrId(frDetails.getFrId());
			cust.setGender(1);
			cust.setIsBuissHead(1);
			cust.setPhoneNumber(phoneNum);
			cust.setGstNo(gstNo);

			RestTemplate restTemplate = new RestTemplate();

			Customer info = restTemplate.postForObject(Constant.URL + "/saveCustomer", cust, Customer.class);
			System.out.println("Response: " + info.toString());

		} catch (Exception e) {

			System.out.println("Exception In Add Other Item Process:" + e.getMessage());

		}

		return cust;
	}

	public static float roundUp(double total) {
		return BigDecimal.valueOf(total).setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();

	}

	public String incrementDate(String date, int day) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		try {
			c.setTime(sdf.parse(date));

		} catch (ParseException e) {
			System.out.println("Exception while incrementing date " + e.getMessage());
			e.printStackTrace();
		}
		c.add(Calendar.DATE, day); // number of days to add

		date = sdf.format(c.getTime());

		return date;

	}

	@RequestMapping(value = "/checkEmailText", method = RequestMethod.GET)
	@ResponseBody
	public int checkEmailText(HttpServletRequest request, HttpServletResponse response) {

		Info info = new Info();
		int res = 0;

		try {

			String phoneNo = request.getParameter("phoneNo");
			System.out.println("Info" + phoneNo);
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("phoneNo", phoneNo);
			RestTemplate restTemplate = new RestTemplate();
			info = restTemplate.postForObject(Constant.URL + "/checkCustPhone", map, Info.class);
			System.out.println("Info" + info + "info.isError()" + info.isError());
			if (info.isError() == false) {
				res = 0;// exists
				System.out.println("0s" + res);
			} else {
				try {
					res = Integer.parseInt(info.getMessage());
				} catch (Exception e) {
					res = 0;
				}

				System.out.println("1888" + res);
			}

		} catch (Exception e) {
			System.err.println("Exception in checkEmailText : " + e.getMessage());
			e.printStackTrace();
		}

		return res;

	}

}
