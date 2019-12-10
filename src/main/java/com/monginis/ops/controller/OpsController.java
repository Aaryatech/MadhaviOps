
package com.monginis.ops.controller;

import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.monginis.ops.advorder.model.AdvanceOrderHeader;
import com.monginis.ops.billing.SellBillDetail;
import com.monginis.ops.billing.SellBillHeader;
import com.monginis.ops.constant.Constant;
import com.monginis.ops.model.AddCustemerResponse;
import com.monginis.ops.model.CategoryList;
import com.monginis.ops.model.Customer;
import com.monginis.ops.model.CustomerAmounts;
import com.monginis.ops.model.FrMenu;
import com.monginis.ops.model.FranchiseSup;
import com.monginis.ops.model.Franchisee;
import com.monginis.ops.model.Info;
import com.monginis.ops.model.Item;
import com.monginis.ops.model.ItemResponse;
import com.monginis.ops.model.SubCategory;
import com.monginis.ops.model.TransactionDetail;
import com.monginis.ops.model.frsetting.FrSetting;
import com.monginis.ops.model.newpos.CustomerBillOnHold;
import com.monginis.ops.model.newpos.ItemListForCustomerBill;
import com.monginis.ops.model.newpos.SellBillHeaderAndDetail;
import com.monginis.ops.model.setting.NewSetting;
import com.steadystate.css.ParseException;

@Controller
@Scope("session")
public class OpsController {

	RestTemplate restTemplate = new RestTemplate();
	List<ItemListForCustomerBill> itemBillList = new ArrayList<>();
	LinkedHashMap<Integer, CustomerBillOnHold> hashMap = new LinkedHashMap<Integer, CustomerBillOnHold>();
	int key = 0;
	int tempBillNo = 0;

	@RequestMapping(value = "/customerBill", method = RequestMethod.GET)
	public String displayCustomerBill(HttpServletRequest request, HttpServletResponse response, Model model) {

		String mav = "customerBill/customerbilling";

		try {
			HttpSession session = request.getSession();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/printKotBill/{billNo}", method = RequestMethod.GET)
	public String printKotBill(@PathVariable int billNo, HttpServletRequest request, HttpServletResponse response,
			Model model) {

		String mav = "customerBill/printKotBill";

		try {
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			model.addAttribute("frName", frDetails.getFrName());

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("billId", billNo);
			map.add("flag", 0);
			SellBillHeaderAndDetail sellBillHeaderAndDetail = restTemplate.postForObject(
					Constant.URL + "/getSellBillHeaderAndDetailForPos", map, SellBillHeaderAndDetail.class);
			model.addAttribute("sellBillHeaderAndDetail", sellBillHeaderAndDetail);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/printBillOfSupply/{billNo}", method = RequestMethod.GET)
	public String printBillOfSupply(@PathVariable int billNo, HttpServletRequest request, HttpServletResponse response,
			Model model) {

		String mav = "customerBill/printBillOfSupply";

		try {
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			model.addAttribute("frName", frDetails.getFrName());

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("billId", billNo);
			map.add("flag", 0);
			SellBillHeaderAndDetail sellBillHeaderAndDetail = restTemplate.postForObject(
					Constant.URL + "/getSellBillHeaderAndDetailForPos", map, SellBillHeaderAndDetail.class);
			model.addAttribute("sellBillHeaderAndDetail", sellBillHeaderAndDetail);
			model.addAttribute("frDetails", frDetails);

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frDetails.getFrId());

			try {
				FranchiseSup frSup = restTemplate.postForObject(Constant.URL + "/getFrSupByFrId", map,
						FranchiseSup.class);
				model.addAttribute("frSup", frSup);
			} catch (Exception e) {

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/printBillOfInvoice/{billNo}", method = RequestMethod.GET)
	public String printBillOfInvoice(@PathVariable int billNo, HttpServletRequest request, HttpServletResponse response,
			Model model) {

		String mav = "customerBill/printBillOfInvoice";

		try {
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			model.addAttribute("frName", frDetails.getFrName());

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("billId", billNo);
			map.add("flag", 1);
			SellBillHeaderAndDetail sellBillHeaderAndDetail = restTemplate.postForObject(
					Constant.URL + "/getSellBillHeaderAndDetailForPos", map, SellBillHeaderAndDetail.class);
			model.addAttribute("sellBillHeaderAndDetail", sellBillHeaderAndDetail);
			model.addAttribute("frDetails", frDetails);

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frDetails.getFrId());

			try {
				FranchiseSup frSup = restTemplate.postForObject(Constant.URL + "/getFrSupByFrId", map,
						FranchiseSup.class);
				model.addAttribute("frSup", frSup);
			} catch (Exception e) {

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/newcustomerbill/{type}", method = RequestMethod.GET)
	public String newcustomerbill(@PathVariable int type, HttpServletRequest request, HttpServletResponse response,
			Model model) {

		String mav = "customerBill/newcustomerbill";
		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		try {
			
			SimpleDateFormat sf = new SimpleDateFormat("dd-MM-yyyy");
			Date date = new Date();
			model.addAttribute("date1", sf.format(date));
			Customer[] customer = restTemplate.getForObject(Constant.URL + "/getAllCustomers", Customer[].class);
			List<Customer> customerList = new ArrayList<>(Arrays.asList(customer));
			model.addAttribute("customerList", customerList);

			ArrayList<FrMenu> menuList = (ArrayList<FrMenu>) session.getAttribute("allMenuList");

			String items;
			StringBuilder builder = new StringBuilder();
			for (FrMenu frMenu : menuList) {

				if (frMenu.getMenuId() == 1 || frMenu.getMenuId() == 2 || frMenu.getMenuId() == 3
						|| frMenu.getMenuId() == 4 || frMenu.getMenuId() == 5 || frMenu.getMenuId() == 6
						|| frMenu.getMenuId() == 82 || frMenu.getMenuId() == 86) {

					builder.append("," + frMenu.getItemShow());

				}

			}
			items = builder.toString();
			items = items.substring(1, items.length());
			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("itemList", items);
			mvm.add("frId", frDetails.getFrId());
			ItemResponse itemsList = restTemplate.postForObject(Constant.URL + "/getItemsNameByIdWithOtherItem", mvm,
					ItemResponse.class);
			List<Item> newItemsList = itemsList.getItemList();

			model.addAttribute("newItemsList", newItemsList);

			CategoryList categoryList = restTemplate.getForObject(Constant.URL + "findAllOnlyCategory",
					CategoryList.class);
			model.addAttribute("catList", categoryList.getmCategoryList());
			model.addAttribute("frRateCat", frDetails.getFrRateCat());
			model.addAttribute("holdingList", hashMap);

			if (type == 1) {
				model.addAttribute("holdBill", hashMap.get(key));
				itemBillList = hashMap.get(key).getItemList();
				model.addAttribute("key", key);
				model.addAttribute("tempCust", 0);
				/* model.addAttribute("advKey", 0); */
			} else {

				try {
					String custId = String.valueOf(session.getAttribute("advCustId"));
					ItemListForCustomerBill[] itemBillList1 = (ItemListForCustomerBill[]) session
							.getAttribute("advItemList");
					itemBillList = new ArrayList<>();
					for (int i = 0; i < itemBillList1.length; i++) {
						itemBillList.add(itemBillList1[i]);
					}
					/*
					 * CustomerBillOnHold addNew = new CustomerBillOnHold();
					 * addNew.setCustId(Integer.parseInt(custId)); addNew.setItemList(itemBillList);
					 * addNew.setTempCustomerName("NA"); hashMap.put(tempBillNo, addNew);
					 * model.addAttribute("holdBill", hashMap.get(key));
					 */
					// System.out.println("list fro sess" + itemBillList.toString());
					CustomerBillOnHold customerBillOnHold = new CustomerBillOnHold();
					customerBillOnHold.setItemList(itemBillList);
					if (custId != null || custId != "") {
						model.addAttribute("tempCust",Integer.parseInt(custId) );
					}else {
						model.addAttribute("tempCust",0 );
					}

					model.addAttribute("holdBill", customerBillOnHold);

					model.addAttribute("key", 0);
					/* model.addAttribute("advKey", 1); */
					session.removeAttribute("advItemList");

				} catch (Exception e) {
					itemBillList = new ArrayList<>();
					model.addAttribute("key", 0);
					model.addAttribute("tempCust", 0);
					/* model.addAttribute("advKey", 0); */
					// e.printStackTrace();
				}

			}

			mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("settingKey", "DEFLTCUST");
			NewSetting settingValue = restTemplate.postForObject(Constant.URL + "/findNewSettingByKey", mvm,
					NewSetting.class);

			model.addAttribute("defaultCustomer", settingValue.getSettingValue1());

			model.addAttribute("frtype", frDetails.getFrGstType());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/getItemOfAdv", method = RequestMethod.GET)
	@ResponseBody
	public Info showCustBillForAdvOrder(HttpServletRequest request, HttpServletResponse responsel) {
		System.err.println("showCustBillForAdvOrder");
		HttpSession session = request.getSession();
		Info inf = new Info();

		try {

			int headId = Integer.parseInt(request.getParameter("headId"));
			int custId = Integer.parseInt(request.getParameter("custId"));

			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("headId", headId);
			ItemListForCustomerBill[] itemsList = restTemplate.postForObject(
					Constant.URL + "/getAdvanceOrderItemsByHeadId", mvm, ItemListForCustomerBill[].class);
			List<ItemListForCustomerBill> advHeadList = new ArrayList<ItemListForCustomerBill>(
					Arrays.asList(itemsList));
			if (itemsList != null) {
				inf.setError(false);
			} else {
				inf.setMessage("0");
				inf.setError(true);
			}

			session.setAttribute("advItemList", itemsList);
			session.setAttribute("advCustId", custId);
			session.setAttribute("advHeadId", headId);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return inf;
	}

	@RequestMapping(value = "/billOnHold", method = RequestMethod.POST)
	@ResponseBody
	public Info billOnHold(HttpServletRequest request, HttpServletResponse responsel) {

		Info info = new Info();

		try {

			int key = Integer.parseInt(request.getParameter("key"));
			int custId = Integer.parseInt(request.getParameter("custId"));
			String holdCustName = request.getParameter("holdCustName");

			if (hashMap.containsKey(key)) {
				hashMap.get(key).setCustId(custId);
				hashMap.get(key).setItemList(itemBillList);
			} else {
				CustomerBillOnHold addNew = new CustomerBillOnHold();
				tempBillNo = tempBillNo + 1;
				addNew.setCustId(custId);
				addNew.setItemList(itemBillList);
				addNew.setTempCustomerName(holdCustName);
				hashMap.put(tempBillNo, addNew);
			}
			System.out.println(hashMap);
			info.setError(false);
			info.setMessage("Successfully");
		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
			info.setMessage("failed");
		}
		return info;
	}

	@RequestMapping(value = "/revertHoldBillOnCurrent", method = RequestMethod.POST)
	@ResponseBody
	public Info revertHoldBillOnCurrent(HttpServletRequest request, HttpServletResponse responsel) {

		Info info = new Info();

		try {

			int index = Integer.parseInt(request.getParameter("key"));
			key = index;

			info.setError(false);
			info.setMessage("Successfully");
		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
			info.setMessage("failed");
		}
		return info;
	}

	@RequestMapping(value = "/cancelFromHoldBill", method = RequestMethod.POST)
	@ResponseBody
	public Info cancelFromHoldBill(HttpServletRequest request, HttpServletResponse responsel) {

		Info info = new Info();

		try {

			int index = Integer.parseInt(request.getParameter("key"));
			hashMap.remove(index);

		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
			info.setMessage("failed");
		}
		return info;
	}

	@RequestMapping(value = "/getAllItemlistForCustomerBill", method = RequestMethod.POST)
	@ResponseBody
	public List<Item> getAllItemlistForCustomerBill(HttpServletRequest request, HttpServletResponse responsel) {

		List<Item> newItemsList = new ArrayList<>();

		try {

			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

			ArrayList<FrMenu> menuList = (ArrayList<FrMenu>) session.getAttribute("allMenuList");

			String items;
			StringBuilder builder = new StringBuilder();
			for (FrMenu frMenu : menuList) {

				if (frMenu.getMenuId() == 1 || frMenu.getMenuId() == 2 || frMenu.getMenuId() == 3
						|| frMenu.getMenuId() == 4 || frMenu.getMenuId() == 5 || frMenu.getMenuId() == 6
						|| frMenu.getMenuId() == 82 || frMenu.getMenuId() == 86) {

					builder.append("," + frMenu.getItemShow());

				}

			}
			items = builder.toString();
			items = items.substring(1, items.length());
			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("itemList", items);
			mvm.add("frId", frDetails.getFrId());
			ItemResponse itemsList = restTemplate.postForObject(Constant.URL + "/getItemsNameByIdWithOtherItem", mvm,
					ItemResponse.class);
			newItemsList = itemsList.getItemList();

		} catch (Exception e) {
			e.printStackTrace();

		}
		return newItemsList;
	}

	@RequestMapping(value = "/submitBill", method = RequestMethod.POST)
	@ResponseBody
	public Info submitBill(HttpServletRequest request, HttpServletResponse responsel) {

		Info info = new Info();

		try {

			/*
			 * int index = Integer.parseInt(request.getParameter("key")); key = index;
			 * 
			 * info.setError(false); info.setMessage("Successfully");
			 */
			int index = Integer.parseInt(request.getParameter("key"));
			int custId = Integer.parseInt(request.getParameter("custId"));
			/* int advKey = Integer.parseInt(request.getParameter("advKey")); */
			String customerName = request.getParameter("selectedText");

			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

			String items = "0";
			for (int i = 0; i < itemBillList.size(); i++) {
				items = items + "," + itemBillList.get(i).getItemId();
			}

			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("itemList", items);
			ItemResponse itemResponse = restTemplate.postForObject(Constant.URL + "/getItemsById", mvm,
					ItemResponse.class);
			List<Item> itemsListByIds = itemResponse.getItemList();

			List<SellBillDetail> sellbilldetaillist = new ArrayList<>();

			float total = 0;
			float taxableAmt = 0;
			float taxAmt = 0;

			for (int i = 0; i < itemBillList.size(); i++) {

				for (int j = 0; j < itemsListByIds.size(); j++) {

					if (itemsListByIds.get(j).getId() == itemBillList.get(i).getItemId()) {

						SellBillDetail sellBillDetail = new SellBillDetail();

						sellBillDetail.setCatId(itemsListByIds.get(j).getItemGrp1());
						sellBillDetail.setSgstPer(itemsListByIds.get(j).getItemTax1());
						sellBillDetail.setSgstRs(itemBillList.get(i).getTaxAmt() / 2);
						sellBillDetail.setCgstPer(itemsListByIds.get(j).getItemTax2());
						sellBillDetail.setCgstRs(itemBillList.get(i).getTaxAmt() / 2);
						sellBillDetail.setDelStatus(0);
						sellBillDetail.setIgstPer(itemsListByIds.get(j).getItemTax3());
						sellBillDetail.setIgstRs(itemBillList.get(i).getTaxAmt());
						sellBillDetail.setItemId(itemBillList.get(i).getItemId());
						sellBillDetail.setMrp(itemBillList.get(i).getOrignalMrp());

						Float mrpBaseRate = (sellBillDetail.getMrp() * 100) / (100 + itemBillList.get(i).getTaxPer());
						sellBillDetail.setMrpBaseRate(mrpBaseRate);

						sellBillDetail.setQty(itemBillList.get(i).getQty());
						// sellBillDetail.setRemark(itemsListByIds.get(j).getHsnCode());//new for hsn
						sellBillDetail.setSellBillDetailNo(0);
						sellBillDetail.setSellBillNo(0);
						sellBillDetail.setBillStockType(0);
						sellBillDetail.setTaxableAmt(itemBillList.get(i).getTaxableAmt());
						sellBillDetail.setTotalTax(itemBillList.get(i).getTaxAmt());
						sellBillDetail.setGrandTotal(itemBillList.get(i).getTotal());
						sellBillDetail.setItemName(itemBillList.get(i).getItemName());
						sellbilldetaillist.add(sellBillDetail);
						total = total + sellBillDetail.getGrandTotal();
						taxableAmt = taxableAmt + sellBillDetail.getTaxableAmt();
						taxAmt = taxAmt + sellBillDetail.getTotalTax();

						break;
					}
				}

			}

			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();

			SellBillHeader sellBillHeader = new SellBillHeader();

			sellBillHeader.setFrId(frDetails.getFrId());
			sellBillHeader.setFrCode(frDetails.getFrCode());
			sellBillHeader.setDelStatus(0);
			sellBillHeader.setUserName(customerName);
			sellBillHeader.setBillDate(sf.format(date));
			sellBillHeader.setCustId(custId);
			sellBillHeader.setInvoiceNo(getInvoiceNo(request, responsel));
			sellBillHeader.setPaidAmt(Math.round(total));
			sellBillHeader.setPaymentMode(1);
			sellBillHeader.setSellBillNo(0);
			sellBillHeader.setUserGstNo("NA");
			sellBillHeader.setUserPhone("NA");
			sellBillHeader.setBillType('R');
			sellBillHeader.setTaxableAmt(taxableAmt);
			sellBillHeader.setDiscountPer(0);
			sellBillHeader.setDiscountAmt(0);
			sellBillHeader.setPayableAmt(Math.round(total));
			sellBillHeader.setTotalTax(taxAmt);
			sellBillHeader.setGrandTotal(Math.round(total));
			sellBillHeader.setRemainingAmt(0);
			sellBillHeader.setStatus(2);
			sellBillHeader.setSellBillDetailsList(sellbilldetaillist);

			info.setError(false);
			info.setMessage("Bill Submited");

			hashMap.remove(index);
			itemBillList = new ArrayList<>();

			RestTemplate restTemplate = new RestTemplate();
			SellBillHeader sellBillHeaderRes = restTemplate.postForObject(Constant.URL + "insertSellBillData",
					sellBillHeader, SellBillHeader.class);

			if (sellBillHeaderRes != null) {

				List<TransactionDetail> dList = new ArrayList<>();
				TransactionDetail transactionDetail = new TransactionDetail();
				transactionDetail.setCashAmt(total);
				transactionDetail.setPayMode(1);
				transactionDetail.setSellBillNo(sellBillHeaderRes.getSellBillNo());
				transactionDetail.setTransactionDate(sf.format(date));
				transactionDetail.setExVar1("1");
				dList.add(transactionDetail);

				TransactionDetail[] transactionDetailRes = restTemplate
						.postForObject(Constant.URL + "saveTransactionDetail", dList, TransactionDetail[].class);

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map = new LinkedMultiValueMap<String, Object>();

				map.add("frId", frDetails.getFrId());
				FrSetting frSetting = restTemplate.postForObject(Constant.URL + "getFrSettingValue", map,
						FrSetting.class);

				int sellBillNo = frSetting.getSellBillNo();

				sellBillNo = sellBillNo + 1;

				map = new LinkedMultiValueMap<String, Object>();

				map.add("frId", frDetails.getFrId());
				map.add("sellBillNo", sellBillNo);

				Info infores = restTemplate.postForObject(Constant.URL + "updateFrSettingBillNo", map, Info.class);

				/*
				 * if(advKey==1) {
				 * 
				 * map = new LinkedMultiValueMap<String, Object>();
				 * 
				 * map.add("advHeadId", session.getAttribute("advHeadId"));
				 * 
				 * Info infores1 = restTemplate.postForObject(Constant.URL +
				 * "updateAdvOrderHeadAndDetail", map, Info.class);
				 * 
				 * if(infores1.isError()==false) {
				 * 
				 * session.removeAttribute("advCustId"); session.removeAttribute("advHeadId"); }
				 * 
				 * 
				 * }
				 */
			}
			info.setMessage(String.valueOf(sellBillHeaderRes.getSellBillNo()));
		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
			info.setMessage("failed");
		}
		return info;
	}

	@RequestMapping(value = "/submitBillByPaymentOption", method = RequestMethod.POST)
	@ResponseBody
	public Info submitBillByPaymentOption(HttpServletRequest request, HttpServletResponse responsel) {

		Info info = new Info();

		try {

			int index = Integer.parseInt(request.getParameter("key"));
			int custId = Integer.parseInt(request.getParameter("custId"));
			int creditBill = Integer.parseInt(request.getParameter("creditBill"));
			int paymentMode = Integer.parseInt(request.getParameter("paymentMode"));
			int billType = Integer.parseInt(request.getParameter("billType"));
			int payType = Integer.parseInt(request.getParameter("payType"));
			String payTypeSplit = request.getParameter("payTypeSplit");
			float cashAmt = Float.parseFloat(request.getParameter("cashAmt"));
			float cardAmt = Float.parseFloat(request.getParameter("cardAmt"));
			float epayAmt = Float.parseFloat(request.getParameter("epayAmt"));
			float discPer = Float.parseFloat(request.getParameter("discPer"));
			float discAmt = Float.parseFloat(request.getParameter("discAmt"));
			float billAmtWtDisc = Float.parseFloat(request.getParameter("billAmtWtDisc"));//without Disc BillAmt
			String customerName = request.getParameter("selectedText");
			String payAmt = request.getParameter("payAmt");
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

			String items = "0";
			for (int i = 0; i < itemBillList.size(); i++) {
				items = items + "," + itemBillList.get(i).getItemId();
			}

			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("itemList", items);
			ItemResponse itemResponse = restTemplate.postForObject(Constant.URL + "/getItemsById", mvm,
					ItemResponse.class);
			List<Item> itemsListByIds = itemResponse.getItemList();

			List<SellBillDetail> sellbilldetaillist = new ArrayList<>();

			float total = 0;
			float taxableAmt = 0;
			float taxAmt = 0;

			for (int i = 0; i < itemBillList.size(); i++) {

				for (int j = 0; j < itemsListByIds.size(); j++) {

					if (itemsListByIds.get(j).getId() == itemBillList.get(i).getItemId()) {

						SellBillDetail sellBillDetail = new SellBillDetail();

						sellBillDetail.setCatId(itemsListByIds.get(j).getItemGrp1());
						sellBillDetail.setSgstPer(itemsListByIds.get(j).getItemTax1());
					
						sellBillDetail.setCgstPer(itemsListByIds.get(j).getItemTax2());
						
						sellBillDetail.setDelStatus(0);
						sellBillDetail.setIgstPer(itemsListByIds.get(j).getItemTax3());
					
						sellBillDetail.setItemId(itemBillList.get(i).getItemId());
						sellBillDetail.setMrp(itemBillList.get(i).getOrignalMrp());

						float mrpBaseRate = (sellBillDetail.getMrp() * 100) / (100 + itemBillList.get(i).getTaxPer());
						sellBillDetail.setMrpBaseRate(mrpBaseRate);
						
						// -----------------------------------------

						float detailDiscAmt=(itemBillList.get(i).getTotal()/(billAmtWtDisc/100)*(discAmt/100));
						float detailGrandTotal=CustomerBillController.roundUp(itemBillList.get(i).getTotal()-detailDiscAmt);

						float detailSgstRs = (detailGrandTotal * itemsListByIds.get(j).getItemTax1()) / 100;
						float detailCgstRs = (detailGrandTotal * itemsListByIds.get(j).getItemTax2()) / 100;
						float detailIgstRs = (detailGrandTotal * itemsListByIds.get(j).getItemTax3()) / 100;

						detailSgstRs = CustomerBillController.roundUp(detailSgstRs);
						detailCgstRs = CustomerBillController.roundUp(detailCgstRs);
						detailIgstRs = CustomerBillController.roundUp(detailIgstRs);

						float detailTotalTax = detailSgstRs + detailCgstRs;
						detailTotalTax = CustomerBillController.roundUp(detailTotalTax);

						float detailTaxableAmt = detailGrandTotal-detailTotalTax;
						detailTaxableAmt = CustomerBillController.roundUp(detailTaxableAmt);

						sellBillDetail.setSgstRs(detailSgstRs);
						sellBillDetail.setCgstRs(detailCgstRs);
						sellBillDetail.setIgstRs(detailIgstRs);
						
						sellBillDetail.setQty(itemBillList.get(i).getQty());
						// sellBillDetail.setRemark(itemsListByIds.get(j).getHsnCode());//new for hsn
						sellBillDetail.setSellBillDetailNo(0);
						sellBillDetail.setSellBillNo(0);
						sellBillDetail.setBillStockType(0);
						sellBillDetail.setTaxableAmt(detailTaxableAmt);//itemBillList.get(i).getTaxableAmt());
						sellBillDetail.setTotalTax(detailTotalTax);//itemBillList.get(i).getTaxAmt());
						sellBillDetail.setGrandTotal(detailGrandTotal);//'itemBillList.get(i).getTotal());
						sellBillDetail.setItemName(itemBillList.get(i).getItemName());
						sellBillDetail.setDiscAmt(detailDiscAmt);
						sellbilldetaillist.add(sellBillDetail);
						total = total +  detailGrandTotal;//sellBillDetail.getGrandTotal();
						taxableAmt = taxableAmt + detailTaxableAmt;
						taxAmt = taxAmt + detailTotalTax;

						break;
					}
				}

			}
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();

			SellBillHeader sellBillHeader = new SellBillHeader();

			sellBillHeader.setFrId(frDetails.getFrId());
			sellBillHeader.setFrCode(frDetails.getFrCode());
			sellBillHeader.setDelStatus(0);
			sellBillHeader.setUserName(customerName);
			sellBillHeader.setBillDate(sf.format(date));
			sellBillHeader.setCustId(custId);
			sellBillHeader.setInvoiceNo(getInvoiceNo(request, responsel));
			sellBillHeader.setSellBillNo(0);
			sellBillHeader.setUserGstNo("NA");
			sellBillHeader.setUserPhone("NA");
			sellBillHeader.setBillType('R');
			sellBillHeader.setTaxableAmt(taxableAmt);
			sellBillHeader.setPayableAmt(Math.round(total));
			sellBillHeader.setTotalTax(taxAmt);
			sellBillHeader.setGrandTotal(Math.round(total));
			if(discPer!=0) {
            sellBillHeader.setDiscountPer(discPer);//
			}else {
	            sellBillHeader.setDiscountPer(discAmt/(billAmtWtDisc/100));//
			}
				
            sellBillHeader.setDiscountAmt(discAmt);//
			if (creditBill == 1) {
				sellBillHeader.setStatus(3);
				sellBillHeader.setRemainingAmt(total);
				sellBillHeader.setPaidAmt(0);

				sellBillHeader.setPaymentMode(1);
			} else {
				sellBillHeader.setStatus(2);
				sellBillHeader.setRemainingAmt(0);
				sellBillHeader.setPaymentMode(paymentMode);
				sellBillHeader.setPaidAmt(Math.round(total));

			}

			sellBillHeader.setSellBillDetailsList(sellbilldetaillist);

			info.setError(false);
			info.setMessage("Bill Submited");

			hashMap.remove(index);
			itemBillList = new ArrayList<>();

			RestTemplate restTemplate = new RestTemplate();
			SellBillHeader sellBillHeaderRes = restTemplate.postForObject(Constant.URL + "insertSellBillData",
					sellBillHeader, SellBillHeader.class);

			if (sellBillHeaderRes != null) {

				List<TransactionDetail> dList = new ArrayList<>();
				TransactionDetail transactionDetail = new TransactionDetail();
				transactionDetail.setSellBillNo(sellBillHeaderRes.getSellBillNo());
				transactionDetail.setTransactionDate(sf.format(date));
			
				transactionDetail.setePayType(payType);
				if (creditBill == 1) {
					transactionDetail.setCashAmt(0);
					transactionDetail.setPayMode(1);
					transactionDetail.setExVar1("1");
				} else {
					transactionDetail.setPayMode(paymentMode);

					if (paymentMode == 1) {
						transactionDetail.setExVar1(String.valueOf(billType));

						if (billType == 1) {
							transactionDetail.setCashAmt(Float.parseFloat(payAmt));
						} else if (billType == 2) {
							transactionDetail.setCardAmt(Float.parseFloat(payAmt));
						} else if (billType == 3) {
							transactionDetail.setePayAmt(Float.parseFloat(payAmt));
						}
					} else {

						String type = payTypeSplit;
						if (cashAmt > 0) {
							transactionDetail.setCashAmt(cashAmt);
						}
						if (cardAmt > 0) {
							transactionDetail.setCardAmt(cardAmt);
							//type = type + "," + 2;
						}
						if (epayAmt > 0) {
							transactionDetail.setePayAmt(epayAmt);
							//type = type + "," + 3;
						}
						transactionDetail.setExVar1(type);
					}

				}
				
				dList.add(transactionDetail);

				TransactionDetail[] transactionDetailRes = restTemplate
						.postForObject(Constant.URL + "saveTransactionDetail", dList, TransactionDetail[].class);

				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				map = new LinkedMultiValueMap<String, Object>();

				map.add("frId", frDetails.getFrId());
				FrSetting frSetting = restTemplate.postForObject(Constant.URL + "getFrSettingValue", map,
						FrSetting.class);

				int sellBillNo = frSetting.getSellBillNo();

				sellBillNo = sellBillNo + 1;

				map = new LinkedMultiValueMap<String, Object>();

				map.add("frId", frDetails.getFrId());
				map.add("sellBillNo", sellBillNo);

				Info infores = restTemplate.postForObject(Constant.URL + "updateFrSettingBillNo", map, Info.class);

			}
			info.setMessage(String.valueOf(sellBillHeaderRes.getSellBillNo()));
		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
			info.setMessage("failed");
		}
		return info;
	}

	public String getInvoiceNo(HttpServletRequest request, HttpServletResponse response) {

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		RestTemplate restTemplate = new RestTemplate();

		HttpSession session = request.getSession();

		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

		int frId = frDetails.getFrId();

		// String frCode = frDetails.getFrCode();

		map.add("frId", frId);
		FrSetting frSetting = restTemplate.postForObject(Constant.URL + "getFrSettingValue", map, FrSetting.class);

		int billNo = frSetting.getSellBillNo();

		int settingValue = billNo;

		System.out.println("Setting Value Received " + settingValue);
		int year = Year.now().getValue();
		String curStrYear = String.valueOf(year);
		curStrYear = curStrYear.substring(2);

		int preMarchYear = Year.now().getValue() - 1;
		String preMarchStrYear = String.valueOf(preMarchYear);
		preMarchStrYear = preMarchStrYear.substring(2);

		System.out.println("Pre MArch year ===" + preMarchStrYear);

		int nextYear = Year.now().getValue() + 1;
		String nextStrYear = String.valueOf(nextYear);
		nextStrYear = nextStrYear.substring(2);

		System.out.println("Next  year ===" + nextStrYear);

		int postAprilYear = nextYear + 1;
		String postAprilStrYear = String.valueOf(postAprilYear);
		postAprilStrYear = postAprilStrYear.substring(2);

		System.out.println("Post April   year ===" + postAprilStrYear);

		java.util.Date date = new Date();
		Calendar cale = Calendar.getInstance();
		cale.setTime(date);
		int month = cale.get(Calendar.MONTH);

		month = month + 1;

		if (month <= 3) {

			curStrYear = preMarchStrYear + curStrYear;
			System.out.println("Month <= 3::Cur Str Year " + curStrYear);
		} else if (month >= 4) {

			curStrYear = curStrYear + nextStrYear;
			System.out.println("Month >=4::Cur Str Year " + curStrYear);
		}

		////

		int length = String.valueOf(settingValue).length();

		String invoiceNo = null;

		if (length == 1)

			invoiceNo = curStrYear + "-" + "0000" + settingValue;
		if (length == 2)

			invoiceNo = curStrYear + "-" + "000" + settingValue;

		if (length == 3)

			invoiceNo = curStrYear + "-" + "00" + settingValue;

		if (length == 4)

			invoiceNo = curStrYear + "-" + "0" + settingValue;

		invoiceNo = frDetails.getFrCode() + invoiceNo;
		System.out.println("*** settingValue= " + settingValue);
		return invoiceNo;

	}

	@RequestMapping(value = "/getItemListByCatSubCatForCustomerBill", method = RequestMethod.POST)
	@ResponseBody
	public List<Item> getItemListByCatSubCatForCustomerBill(HttpServletRequest request, HttpServletResponse responsel) {

		List<Item> newItemsList = new ArrayList<>();

		try {

			int searchBy = Integer.parseInt(request.getParameter("searchBy"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

			ArrayList<FrMenu> menuList = (ArrayList<FrMenu>) session.getAttribute("allMenuList");

			String items;
			StringBuilder builder = new StringBuilder();
			for (FrMenu frMenu : menuList) {

				if (frMenu.getMenuId() == 1 || frMenu.getMenuId() == 2 || frMenu.getMenuId() == 3
						|| frMenu.getMenuId() == 4 || frMenu.getMenuId() == 5 || frMenu.getMenuId() == 6
						|| frMenu.getMenuId() == 82 || frMenu.getMenuId() == 86) {

					builder.append("," + frMenu.getItemShow());

				}

			}
			items = builder.toString();
			items = items.substring(1, items.length());
			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("itemList", items);
			mvm.add("frId", frDetails.getFrId());
			mvm.add("searchBy", searchBy);
			mvm.add("catId", catId);
			ItemResponse itemsList = restTemplate.postForObject(
					Constant.URL + "/getItemsNameByIdWithOtherItemCateIdOrSubCatId", mvm, ItemResponse.class);
			newItemsList = itemsList.getItemList();

		} catch (Exception e) {
			e.printStackTrace();

		}
		return newItemsList;
	}

	@RequestMapping(value = "/getCategoryListForCustomerBill", method = RequestMethod.POST)
	@ResponseBody
	public CategoryList getCategoryListForCustomerBill(HttpServletRequest request, HttpServletResponse responsel) {

		CategoryList categoryList = new CategoryList();

		try {

			categoryList = restTemplate.getForObject(Constant.URL + "findAllOnlyCategory", CategoryList.class);

		} catch (Exception e) {
			e.printStackTrace();

		}
		return categoryList;
	}

	@RequestMapping(value = "/getSubCategoryListForCustomerBill", method = RequestMethod.POST)
	@ResponseBody
	public List<SubCategory> getSubCategoryListForCustomerBill(HttpServletRequest request,
			HttpServletResponse responsel) {

		List<SubCategory> categoryList = new ArrayList<>();

		try {

			int catId = Integer.parseInt(request.getParameter("catId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("catId", catId);
			SubCategory[] subCatList = restTemplate.postForObject(Constant.URL + "getSubCatList", map,
					SubCategory[].class);
			categoryList = new ArrayList<>(Arrays.asList(subCatList));

		} catch (Exception e) {
			e.printStackTrace();

		}
		return categoryList;
	}

	@RequestMapping(value = "/addItemInBillList", method = RequestMethod.POST)
	@ResponseBody
	public List<ItemListForCustomerBill> addItemInBillList(HttpServletRequest request, HttpServletResponse responsel) {

		try {

			float orignalrate = Float.parseFloat(request.getParameter("rateHidden"));
			float total = Float.parseFloat(request.getParameter("rate"));
			float qty = Float.parseFloat(request.getParameter("qty"));
			int itemId = Integer.parseInt(request.getParameter("itemIdHidden"));
			float taxperHidden = Float.parseFloat(request.getParameter("taxperHidden"));
			String itemNameHidden = request.getParameter("itemNameHidden");
			String uom = request.getParameter("uom");
			int isDecimal = Integer.parseInt(request.getParameter("isDecimal"));
			/*
			 * MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,
			 * Object>(); map.add("id", itemId); Item item =
			 * restTemplate.postForObject(Constant.URL + "getItem", map, Item.class);
			 */
			int flag = 0;
			for (int i = 0; i < itemBillList.size(); i++) {
				if (itemBillList.get(i).getItemId() == itemId) {
					itemBillList.get(i).setQty(qty);
					float taxableAmt = (total * 100) / (100 + taxperHidden);
					itemBillList.get(i).setTaxableAmt(taxableAmt);
					itemBillList.get(i).setTaxAmt(total - taxableAmt);
					itemBillList.get(i).setTaxPer(taxperHidden);
					itemBillList.get(i).setTotal(total);
					flag = 1;

				}
			}
			if (flag == 0) {
				ItemListForCustomerBill add = new ItemListForCustomerBill();
				add.setItemId(itemId);
				add.setItemName(itemNameHidden);
				add.setOrignalMrp(orignalrate);
				add.setUom(uom);
				add.setIsDecimal(isDecimal);
				add.setTotal(total);
				add.setQty(qty);
				add.setTaxPer(taxperHidden);
				Float taxableAmt = (total * 100) / (100 + add.getTaxPer());
				add.setTaxableAmt(taxableAmt);
				add.setTaxAmt(total - taxableAmt);
				itemBillList.add(add);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemBillList;
	}

	@RequestMapping(value = "/editItemQty", method = RequestMethod.POST)
	@ResponseBody
	public ItemListForCustomerBill editItemQty(HttpServletRequest request, HttpServletResponse responsel) {
		ItemListForCustomerBill itemListForCustomerBill = new ItemListForCustomerBill();
		try {
			int itemId = Integer.parseInt(request.getParameter("itemId"));
			for (int i = 0; i < itemBillList.size(); i++) {
				if (itemBillList.get(i).getItemId() == itemId) {
					itemListForCustomerBill = itemBillList.get(i);
					break;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemListForCustomerBill;
	}

	@RequestMapping(value = "/getCurrentItemList", method = RequestMethod.POST)
	@ResponseBody
	public List<ItemListForCustomerBill> getCurrentItemList(HttpServletRequest request, HttpServletResponse responsel) {

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemBillList;
	}

	@RequestMapping(value = "/deleteItemInBillList", method = RequestMethod.POST)
	@ResponseBody
	public List<ItemListForCustomerBill> deleteItemInBillList(HttpServletRequest request,
			HttpServletResponse responsel) {

		try {

			int index = Integer.parseInt(request.getParameter("index"));
			itemBillList.remove(index);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemBillList;
	}

	@RequestMapping(value = "/saveCustomerFromBill", method = RequestMethod.POST)
	@ResponseBody
	public AddCustemerResponse saveCustomerFromBill(HttpServletRequest request, HttpServletResponse responsel) {

		AddCustemerResponse info = new AddCustemerResponse();

		try {

			String customerName = request.getParameter("customerName");
			String mobileNo = request.getParameter("mobileNo");
			String dateOfBirth = request.getParameter("dateOfBirth");
			String buisness = request.getParameter("buisness");
			String companyName = request.getParameter("companyName");
			String gstNo = request.getParameter("gstNo");
			String custAdd = request.getParameter("custAdd");
			int custId = Integer.parseInt(request.getParameter("custId"));
			int custType = Integer.parseInt(request.getParameter("custType"));
			String ageRange = request.getParameter("ageRange");
			int gender = Integer.parseInt(request.getParameter("gender"));

			Customer save = new Customer();
			save.setCustName(customerName);
			save.setPhoneNumber(mobileNo);
			save.setIsBuissHead(Integer.parseInt(buisness));
			save.setCustDob(dateOfBirth);
			save.setCompanyName(companyName);
			save.setAddress(custAdd);
			save.setGstNo(gstNo);
			save.setDelStatus(1);
			save.setCustId(custId);
			
			save.setAgeGroup(ageRange);save.setExInt1(custType);save.setGender(gender);
			Customer res = restTemplate.postForObject(Constant.URL + "/saveCustomer", save, Customer.class);

			Customer[] customer = restTemplate.getForObject(Constant.URL + "/getAllCustomers", Customer[].class);
			List<Customer> customerList = new ArrayList<>(Arrays.asList(customer));

			if (res == null) {

				info.setError(true);
			} else {
				info.setCustomerList(customerList);
				info.setAddCustomerId(res.getCustId());
				info.setError(false);
			}

		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
		}
		return info;
	}

	Customer edit = new Customer();

	@RequestMapping(value = "/editCustomerFromBill", method = RequestMethod.POST)
	@ResponseBody
	public Customer editCustomerFromBill(HttpServletRequest request, HttpServletResponse responsel) {

		edit = new Customer();

		try {

			int custId = Integer.parseInt(request.getParameter("custId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
			map.add("custId", custId);
			edit = restTemplate.postForObject(Constant.URL + "/getCustomerByCustId", map, Customer.class);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return edit;
	}

	@RequestMapping(value = "/submitEditCustomer", method = RequestMethod.POST)
	@ResponseBody
	public AddCustemerResponse submitEditCustomer(HttpServletRequest request, HttpServletResponse responsel) {

		AddCustemerResponse info = new AddCustemerResponse();

		try {

			String customerName = request.getParameter("customerName");
			String mobileNo = request.getParameter("mobileNo");
			String dateOfBirth = request.getParameter("dateOfBirth");
			int buisness = Integer.parseInt(request.getParameter("buisness"));
			String companyName = request.getParameter("companyName");
			String gstNo = request.getParameter("gstNo");
			String custAdd = request.getParameter("custAdd");

			edit.setCustName(customerName);
			edit.setPhoneNumber(mobileNo);
			edit.setIsBuissHead(buisness);
			edit.setCustDob(dateOfBirth);
			if (buisness == 0) {
				edit.setCompanyName("");
				edit.setAddress("");
				edit.setGstNo("");
			} else {
				edit.setCompanyName(companyName);
				edit.setAddress(custAdd);
				edit.setGstNo(gstNo);
			}

			Customer res = restTemplate.postForObject(Constant.URL + "/saveCustomer", edit, Customer.class);

			Customer[] customer = restTemplate.getForObject(Constant.URL + "/getAllCustomers", Customer[].class);
			List<Customer> customerList = new ArrayList<>(Arrays.asList(customer));

			if (res == null) {

				info.setError(true);
			} else {
				info.setCustomerList(customerList);
				info.setAddCustomerId(res.getCustId());
				info.setError(false);
			}

		} catch (Exception e) {
			e.printStackTrace();
			info.setError(true);
		}
		return info;
	}

	// *****************Settle credit bills*************

	// harsha

	@RequestMapping(value = "/getCustAmts", method = RequestMethod.GET)
	@ResponseBody
	public CustomerAmounts getCustAmts(HttpServletRequest request, HttpServletResponse responsel) {
		System.err.println("showCustBillForAdvOrder");
		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

		CustomerAmounts itemsList = new CustomerAmounts();

		try {

			int custId = Integer.parseInt(request.getParameter("cust"));

			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("custId", custId);
			mvm.add("frId", frDetails.getFrId());
			itemsList = restTemplate.postForObject(Constant.URL + "/getCustomerAmounts", mvm, CustomerAmounts.class);

			System.err.println("amts*" + itemsList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemsList;
	}

	@RequestMapping(value = "/getCustCreditBills", method = RequestMethod.POST)
	@ResponseBody
	public List<SellBillHeader> getCustCreditBills(HttpServletRequest request, HttpServletResponse responsel) {
		System.err.println("showCustBillForAdvOrder");

		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

		List<SellBillHeader> itemsList = new ArrayList<SellBillHeader>();

		try {

			int custId = Integer.parseInt(request.getParameter("cust"));

			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("custId", custId);
			mvm.add("frId", frDetails.getFrId());
			SellBillHeader[] itemsList1 = restTemplate.postForObject(Constant.URL + "/getSellBillByCustId", mvm,
					SellBillHeader[].class);

			itemsList = new ArrayList<SellBillHeader>(Arrays.asList(itemsList1));

			System.err.println("getCustCreditBills*" + itemsList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return itemsList;
	}

	@RequestMapping(value = "/getCustAdvanceOrder", method = RequestMethod.GET)
	@ResponseBody
	public List<AdvanceOrderHeader> getCustAdvanceOrder(HttpServletRequest request, HttpServletResponse responsel) {
		System.err.println("showCustBillForAdvOrder");
		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

		List<AdvanceOrderHeader> itemsList = new ArrayList<AdvanceOrderHeader>();

		try {

			int custId = Integer.parseInt(request.getParameter("cust"));

			MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
			mvm.add("custId", custId);
			mvm.add("frId", frDetails.getFrId());
			AdvanceOrderHeader[] itemsList1 = restTemplate.postForObject(
					Constant.URL + "/advanceOrderHistoryHeaderByCustId", mvm, AdvanceOrderHeader[].class);

			itemsList = new ArrayList<AdvanceOrderHeader>(Arrays.asList(itemsList1));

			System.err.println("getCustCreditBills*" + itemsList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemsList;
	}

	@RequestMapping(value = "/submitResposeCredit", method = RequestMethod.POST)
	public @ResponseBody int submitResposeCredit(HttpServletRequest request, HttpServletResponse response)
			throws ParseException {
		int flag = 0;
		System.err.println("hii id list ");
		try {
			float cashAmt1 = 0;
			float cardAmt1 = 0;
			float epayAmt1 = 0;
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			List<TransactionDetail> expTransList = new ArrayList<TransactionDetail>();

			RestTemplate restTemplate = new RestTemplate();

			String[] checkedList = request.getParameterValues("chkItem");

			String frId = (request.getParameter("frId"));

			String modePay1 = request.getParameter("modePay1"); // single/split
			int modType2 = 0;
			int modType1 = 0;
			System.err.println("hii id list " + modePay1);
			modType1 = Integer.parseInt(request.getParameter("modType1"));// cash/card
			String type = "0";
			 
			System.err.println("head id list " + checkedList.toString());
			for (int i = 0; i < checkedList.length; i++) {

				System.err.println("head id " + checkedList[i]);
				int headId = Integer.parseInt(checkedList[i]);
				String invoiceNo = (request.getParameter("invoiceNo" + headId));
				float billAmt = Float.parseFloat(request.getParameter("grandTotal" + headId));
				float paidAmt = Float.parseFloat(request.getParameter("paidAmt" + headId));
				float pendingAmt = Float.parseFloat(request.getParameter("remainingAmt" + headId));
				String billDate = request.getParameter("billDate" + headId);
				float settleAmt = Float.parseFloat(request.getParameter("settleAmt" + headId));
				TransactionDetail expTrans = new TransactionDetail();
				
				if(modType1==1) {
					cashAmt1=settleAmt;
				}else if(modType1==2) {
					cardAmt1=settleAmt;
				}else {
					epayAmt1=settleAmt;
				}
				
				expTrans.setSellBillNo(headId);
				expTrans.setCardAmt(cardAmt1);
				expTrans.setCashAmt(cashAmt1);
				expTrans.setDiscType(0);
				expTrans.setePayAmt(epayAmt1);
				expTrans.setePayType(0);
				expTrans.setPayMode(modType2);
				expTrans.setTransactionDate(sf.format(date));

				expTrans.setExInt2(0);
				expTrans.setExInt1(0);
				expTrans.setExVar1(String.valueOf(modType1));// +prodMixingReqP1.get(i).getMulFactor()
				expTrans.setExVar2(String.valueOf(pendingAmt - settleAmt));
				expTrans.setExFloat1(billAmt);
				expTrans.setExFloat2(0);

				// field
				expTransList.add(expTrans);

			}

			Info errorMessage = restTemplate.postForObject(Constant.URL + "/saveBillTransDetail", expTransList,
					Info.class);
			if (errorMessage.getMessage().equals("1")) {
				flag = 2;
			} else {
				flag = 0;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}
	
	
	//**********************pos popups data*************************************************
	
	
	@RequestMapping(value = "/getCustBills", method = RequestMethod.POST)
	@ResponseBody
	public List<SellBillHeader> getCustBills(HttpServletRequest request, HttpServletResponse responsel) {
		System.err.println("showCustBillForAdvOrder");

		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

		List<SellBillHeader> itemsList = new ArrayList<SellBillHeader>();

		try {

			int custId = Integer.parseInt(request.getParameter("cust"));
			int tempType = Integer.parseInt(request.getParameter("tempType"));
			int tabType = Integer.parseInt(request.getParameter("tabType"));//cust/todays
			System.err.println("tabType*" + tabType);
			 
				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("custId", custId);
				mvm.add("frId", frDetails.getFrId());
				mvm.add("flag", tempType);
				mvm.add("tabType", tabType);
				SellBillHeader[] itemsList1 = restTemplate.postForObject(Constant.URL + "/getAllSellCustBillTodaysBill", mvm,
						SellBillHeader[].class);

				itemsList = new ArrayList<SellBillHeader>(Arrays.asList(itemsList1));

			 
			System.err.println("getCustCreditBills*" + itemsList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return itemsList;
	}
	
	
	
	@RequestMapping(value = "/getCustBillsTransaction", method = RequestMethod.POST)
	@ResponseBody
	public List<TransactionDetail> getCustBillsTransaction(HttpServletRequest request, HttpServletResponse responsel) {
		

		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");

		List<TransactionDetail> itemsList = new ArrayList<TransactionDetail>();

		try {

			int custId = Integer.parseInt(request.getParameter("cust"));
			int tempType = Integer.parseInt(request.getParameter("tempType"));
			int tabType = Integer.parseInt(request.getParameter("tabType"));//cust/todays
           
		 
				
 				MultiValueMap<String, Object> mvm = new LinkedMultiValueMap<String, Object>();
				mvm.add("custId", custId);
				mvm.add("frId", frDetails.getFrId());
				mvm.add("flag", tempType);
				mvm.add("tabType", tabType);
				TransactionDetail[] itemsList1 = restTemplate.postForObject(Constant.URL + "/getAllSellCustBillTransaction", mvm,
						TransactionDetail[].class);

				itemsList = new ArrayList<TransactionDetail>(Arrays.asList(itemsList1));

		 
			System.err.println("getCustCreditBills*" + itemsList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return itemsList;
	}
	
	
	
}
