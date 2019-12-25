package com.monginis.ops.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.monginis.ops.HomeController;
import com.monginis.ops.billing.SellBillHeader;
import com.monginis.ops.common.DateConvertor;
import com.monginis.ops.constant.Constant;
import com.monginis.ops.model.FrEmpLoginResp;
import com.monginis.ops.model.FrSupplier;
import com.monginis.ops.model.GetCurrentStockDetails;
import com.monginis.ops.model.Info;
import com.monginis.ops.model.PettyCashEmp;
import com.monginis.ops.model.PettyCashHandover;
import com.monginis.ops.model.othitemstock.OtherItemCurStock;
import com.monginis.ops.model.pettycash.FrEmpMaster;
import com.monginis.ops.model.pettycash.GetCashAdvAndExpAmt;
import com.monginis.ops.model.pettycash.PettyCashDao;
import com.monginis.ops.model.pettycash.PettyCashData;
import com.monginis.ops.model.pettycash.PettyCashManagmt;

@Controller
public class PettyCashController {
	RestTemplate rest = new RestTemplate();

	public List<PettyCashManagmt> pettyList = null;

	private static final Logger logger = LoggerFactory.getLogger(PettyCashController.class);
	SimpleDateFormat ymdSDF;
	Calendar cal;

	@RequestMapping(value = "/showPattyCashMgmnt", method = RequestMethod.GET)
	public ModelAndView showPattyCashMgmnt(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("pettycash/petty_cash_mgmnt");

		MultiValueMap<String, Object> map = null;

		PettyCashManagmt pettycash = new PettyCashManagmt();

		PettyCashData pettyCash = new PettyCashData();

		SimpleDateFormat dmySDF = new SimpleDateFormat("dd-MM-yyyy");
		Calendar calendar = Calendar.getInstance();
		try {

			HttpSession session = request.getSession();
			int frid = (int) session.getAttribute("frId");

			DateFormat DF = new SimpleDateFormat("dd-MM-yyyy");
			String currntDat = DF.format(new java.util.Date());
			System.out.println("ToDay Date-----" + currntDat);

			model.addObject("currentDate", currntDat);
			
			DateFormat DF1 = new SimpleDateFormat("yyyy-MM-dd");
			String currntDat2 = DF1.format(new java.util.Date());
			model.addObject("dateForSearch", currntDat2);
			

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frid);
			PettyCashManagmt petty = rest.postForObject(Constant.URL + "/getPettyCashDetails", map,
					PettyCashManagmt.class);
			System.out.println("Petty Cash----" + petty);

			ymdSDF = new SimpleDateFormat("yyyy-MM-dd");
			cal = Calendar.getInstance();
			cal.setTimeInMillis(Long.parseLong(petty.getDate()));
			System.out.println("Date==============" + ymdSDF.format(cal.getTime()));

			// Add 1 day
			cal.add(Calendar.DAY_OF_MONTH, 1);
			// Date after adding the days to the given date
			String newDate = ymdSDF.format(cal.getTime());
			// Displaying the new Date after addition of Days
			System.out.println("Date after Addition----------------: " + newDate);

			PettyCashDao pettyDao = null;
			map = new LinkedMultiValueMap<String, Object>();
			if (petty != null) {

				map.add("date", ymdSDF.format(cal.getTime()));
				map.add("frId", frid);
				pettyDao = rest.postForObject(Constant.URL + "/getPettyCashAmts", map, PettyCashDao.class);
			} else {
				System.out.println("Show Petty In Else");
				map.add("frId", frid);
				map.add("date", DateConvertor.convertToYMD(currntDat));
				pettyDao = rest.postForObject(Constant.URL + "/getPettyCashAmts", map, PettyCashDao.class);
			}

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frid);
			map.add("date", newDate);
			
			System.err.println("DATE **************************** "+newDate);
			
			GetCashAdvAndExpAmt amtData = rest.postForObject(Constant.URL + "/getTrCashAmtAndAdvAmtAndExpAmt", map,
					GetCashAdvAndExpAmt.class);

			model.addObject("trCashAmt", amtData.getTrCashAmt());
			model.addObject("advAmt", amtData.getAdvAmt());
			model.addObject("expAmt", amtData.getExpAmt());

			/*
			 * map.add("frId", frid); map.add("date",
			 * DateConvertor.convertToYMD(petty.getDate())); pettyDao =
			 * rest.postForObject(Constant.URL + "/getPettyCashAmts", map,
			 * PettyCashDao.class);
			 * System.out.println("Petty Cash----"+pettyDao.toString());
			 */

			List<Float> spList = new ArrayList<>();

			List<Float> sellBillAdvList = new ArrayList<>();

			List<Float> otherBillAdvList = new ArrayList<>();

			if (pettyDao != null) {
				if (pettyDao.getSpCakAdv() != null) {
					for (int i = 0; i < pettyDao.getSpCakAdv().size(); i++) {
						spList.add(pettyDao.getSpCakAdv().get(i).getMrp());
						spList.add(pettyDao.getSpCakAdv().get(i).getAdvance());

					}
				}
			}

			System.out.println("List1-------------" + spList);

			float lastAdv = spList.get(1);
			System.out.println("LastAdv-------------" + lastAdv);

			float mrp = spList.get(2);
			System.out.println("MRP-------------" + mrp);

			float currentAdv = spList.get(3);
			System.out.println("Today-------------" + currentAdv);

			float calAdv = mrp - currentAdv;
			float amt = calAdv + lastAdv;
			System.out.println("Total Adv-------------" + amt);

			float sellBillAdv = pettyDao.getSellBillAdv().getSellQtyMrp();
			System.out.println("SellBillDetailAdv------------" + sellBillAdv);

			float othrBilAdv = pettyDao.getOtherBillAdv().getBillDetailItemMrp();
			System.out.println("OtherBillDetailAdv-----------" + othrBilAdv);

			float cashAmt = amt + sellBillAdv + othrBilAdv;
			System.out.println("Cash Amt-------------" + cashAmt);

			calendar.setTimeInMillis(Long.parseLong(petty.getDate()));
			System.out.println("Date2==============" + dmySDF.format(cal.getTime()));

			Calendar todaysDate = Calendar.getInstance();
			int isDayEnd = 0;
			if (cal.compareTo(todaysDate) <= 0) {
				isDayEnd = 1;
			}
			model.addObject("isDayEnd", isDayEnd);

			System.err.println("DATE------------- " + todaysDate.getTime() + " ----------  " + cal.getTime());
			System.err.println("isDayEnd-------------------------------- " + isDayEnd);

			pettyCash.setDate(dmySDF.format(cal.getTime()));
			pettyCash.setCashAmt(cashAmt);
			pettyCash.setOpeningAmt(petty.getClosingAmt());
			System.out.println("Petty Data-----------------------------" + pettyCash);

			model.addObject("pettycash", pettyCash);
			model.addObject("isEdit", 0);

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frid);

			PettyCashManagmt[] list = rest.postForObject(Constant.URL + "/getPettyCashList", map,
					PettyCashManagmt[].class);
			ArrayList<PettyCashManagmt> pettyList = new ArrayList<>(Arrays.asList(list));
			SimpleDateFormat ymdSDF1 = new SimpleDateFormat("dd-MM-yyyy");

			if (pettyList != null) {
				for (int i = 0; i < pettyList.size(); i++) {
					Calendar cal1 = Calendar.getInstance();
					cal1.setTimeInMillis(Long.parseLong(pettyList.get(i).getDate()));
					pettyList.get(i).setDate(ymdSDF1.format(cal1.getTime()));
				}
			}

			model.addObject("pettyList", pettyList);// Petty Cash List

			// -----------------------------Petty Cash Hand
			// Over--------------------------------//
			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frid);
			PettyCashManagmt pettyCashMgmt = rest.postForObject(Constant.URL + "/getPettyCashDetails", map,
					PettyCashManagmt.class);

			ymdSDF = new SimpleDateFormat("yyyy-MM-dd");
			cal = Calendar.getInstance();
			cal.setTimeInMillis(Long.parseLong(pettyCashMgmt.getDate()));
			// System.out.println("CashHAndDate=============="+ymdSDF.format(cal.getTime()));

			// Add Day 1
			cal.add(Calendar.DAY_OF_MONTH, 1);
			String plusDate = ymdSDF.format(cal.getTime());
			logger.info("Plus Date-----------" + plusDate);

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frid);
			map.add("lastdate", plusDate);
			PettyCashHandover cashHandOvr = rest.postForObject(Constant.URL + "/getPettyCashHandOvrLastRecrd", map,
					PettyCashHandover.class);

			// From Time
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate localDate = LocalDate.now();
			logger.info("Time Zone-----" + dtf.format(localDate) + " " + "06:00:00"); // 2019-11-29 06:00:00

			// To Time
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			logger.info(dateFormat.format(date)); // Current Date Time

			try {

				if (cashHandOvr != null) {
					System.out.println("Data Found");
					model.addObject("openAmt", cashHandOvr.getAmtHandover());

					map = new LinkedMultiValueMap<String, Object>();
					logger.info("Close DateTime---------" + cashHandOvr.getTransactionDate());
					logger.info("Current DateTime---------" + dateFormat.format(date));

					map.add("fromTime", cashHandOvr.getTransactionDate());
					map.add("toTime", dateFormat.format(date));
					map.add("frId", frid);

					SellBillHeader sellAmt = rest.postForObject(Constant.URL + "/getPettyCashSellAmt", map,
							SellBillHeader.class);
					float sellingAmt = 0;
					try {
						sellingAmt = sellAmt.getGrandTotal();

					} catch (Exception e) {
						sellingAmt = 0;
					}
					logger.info("sell Amt--------" + sellingAmt);
					model.addObject("sellAmt", sellingAmt);
					logger.info("totalCash1--------" + cashHandOvr.getAmtHandover() + sellingAmt);
					model.addObject("totalCash", cashHandOvr.getAmtHandover() + sellingAmt);

				} else {
					System.out.println("No Data Found");

					model.addObject("openAmt", pettyCashMgmt.getClosingAmt());

					map = new LinkedMultiValueMap<String, Object>();
					map.add("fromTime", dtf.format(localDate) + " " + "06:00:00");
					map.add("toTime", dateFormat.format(date));
					map.add("frId", frid);

					SellBillHeader sellAmt = rest.postForObject(Constant.URL + "/getPettyCashSellAmt", map,
							SellBillHeader.class);
					logger.info("sell Amt--------" + sellAmt);
					model.addObject("sellAmt", sellAmt.getGrandTotal());

					logger.info("totalCash2--------" + pettyCashMgmt.getClosingAmt() + sellAmt.getGrandTotal());
					model.addObject("totalCash", pettyCashMgmt.getClosingAmt() + sellAmt.getGrandTotal());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frid);

			/*
			 * PettyCashEmp[] empArr = rest.postForObject(Constant.URL +
			 * "/getAllPettyCashEmp", map, PettyCashEmp[].class); List<PettyCashEmp> empList
			 * = new ArrayList<PettyCashEmp>(Arrays.asList(empArr));
			 */

			FrEmpMaster[] empArr = rest.postForObject(Constant.URL + "/getAllFrEmpByFrid", map, FrEmpMaster[].class);
			List<FrEmpMaster> empList = new ArrayList<FrEmpMaster>(Arrays.asList(empArr));
			logger.info("---------------------------" + empList);
			model.addObject("empList", empList);

			model.addObject("frId", frid);

			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frid);
			PettyCashHandover[] cashHandOvrArr = rest.postForObject(Constant.URL + "/getPettyCashHandByFrid", map,
					PettyCashHandover[].class);
			List<PettyCashHandover> pcHndOvrList = new ArrayList<PettyCashHandover>(Arrays.asList(cashHandOvrArr));
			model.addObject("cashHndOvrList", pcHndOvrList);

		} catch (Exception e) {
			System.err.println("Exception in showPattyCashMgmnt : " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/addPettyCash", method = RequestMethod.POST)
	public String addPettyCash(HttpServletRequest req, HttpServletResponse resp) {
		try {

			PettyCashManagmt pettycash = new PettyCashManagmt();
			HttpSession session = req.getSession();
			int frid = (int) session.getAttribute("frId");

			float cashAmt = 0;
			float closAmt = 0;
			float withdrawAmt = 0;
			float opnAmt = 0;
			float cashEdtAmt = 0;
			int pettyCashId = 0;
			try {

				cashAmt = Float.parseFloat(req.getParameter("cash_amt"));
				withdrawAmt = Float.parseFloat(req.getParameter("withdrawal_amt"));
				opnAmt = Float.parseFloat(req.getParameter("opening_amt"));
				cashEdtAmt = Float.parseFloat(req.getParameter("cash_edit_amt"));
				closAmt = Float.parseFloat(req.getParameter("closing_amt"));
				pettyCashId = Integer.parseInt(req.getParameter("petty_id"));
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

			String date = DateConvertor.convertToYMD(req.getParameter("cash_date"));

			pettycash.setPettycashId(pettyCashId);
			pettycash.setCardAmt(0);
			pettycash.setCashAmt(cashAmt);
			pettycash.setClosingAmt(closAmt);
			pettycash.setDate(date);
			pettycash.setExFloat1(0);
			pettycash.setExInt1(0);
			pettycash.setExVar1("NA");
			pettycash.setExVar2("NA");
			pettycash.setFrId(frid);
			pettycash.setOpeningAmt(opnAmt);
			pettycash.setCardEditAmt(0);
			pettycash.setTtlEditAmt(0);
			pettycash.setOtherAmt(0);
			pettycash.setStatus(0);
			pettycash.setTotalAmt(0);
			pettycash.setTtlEditAmt(0);
			pettycash.setWithdrawalAmt(withdrawAmt);
			pettycash.setOpnEditAmt(0);
			pettycash.setCashEditAmt(cashEdtAmt);
			pettycash.setExFloat1(0);
			System.out.println("Cash-------" + pettycash);
			PettyCashManagmt savePettyCash = rest.postForObject(Constant.URL + "/addPettyCash", pettycash,
					PettyCashManagmt.class);

		} catch (Exception e) {
			System.err.println("Exception in addPettyCash : " + e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/showPattyCashMgmnt";
	}

	@RequestMapping(value = "/editPettyCash", method = RequestMethod.GET)
	public ModelAndView editPettyCash(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView model = new ModelAndView("pettycash/petty_cash_mgmnt");
		try {

			int id = Integer.parseInt(req.getParameter("pettyCashIdId"));

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("id", id);

			PettyCashManagmt petty = rest.postForObject(Constant.URL + "/getPettyCashById", map,
					PettyCashManagmt.class);
			SimpleDateFormat ymdSDF1 = new SimpleDateFormat("dd-MM-yyyy");
			Calendar cal1 = Calendar.getInstance();
			cal1.setTimeInMillis(Long.parseLong(petty.getDate()));
			petty.setDate(ymdSDF1.format(cal1.getTime()));
			model.addObject("pettycash", petty);
		} catch (Exception e) {
			System.err.println("Exception in editPettyCash : " + e.getMessage());
			e.printStackTrace();
		}
		return model;
	}

	@RequestMapping(value = "/getPettyCashTransactions", method = RequestMethod.GET)
	public ModelAndView getPettyCashDetails(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("pettycash/petty_cash_details");
		try {
			DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			Calendar c = Calendar.getInstance();
			c.set(Calendar.DAY_OF_MONTH, 1);
			model.addObject("firstDate", df.format(c.getTime()));

			Date date = Calendar.getInstance().getTime();
			model.addObject("currentDate", df.format(date));

			HttpSession session = request.getSession();
			int frid = (int) session.getAttribute("frId");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frid);

			PettyCashManagmt[] list = rest.postForObject(Constant.URL + "/getPettyCashList", map,
					PettyCashManagmt[].class);
			ArrayList<PettyCashManagmt> pettyList = new ArrayList<>(Arrays.asList(list));
			SimpleDateFormat ymdSDF1 = new SimpleDateFormat("dd-MM-yyyy");

			if (pettyList != null) {
				for (int i = 0; i < pettyList.size(); i++) {
					Calendar cal1 = Calendar.getInstance();
					cal1.setTimeInMillis(Long.parseLong(pettyList.get(i).getDate()));
					pettyList.get(i).setDate(ymdSDF1.format(cal1.getTime()));
				}
			}

			model.addObject("pettyList", pettyList);
		} catch (Exception e) {
			System.err.println("Exception in getPettyCashTransactions : " + e.getMessage());
			e.printStackTrace();
		}
		return model;

	}

	@RequestMapping(value = "/getPettyCashData", method = RequestMethod.GET)
	public @ResponseBody ArrayList<PettyCashManagmt> getPettyCashData(HttpServletRequest request,
			HttpServletResponse response) {

		ArrayList<PettyCashManagmt> pettyInfo = new ArrayList<>();

		try {

			HttpSession session = request.getSession();
			int frid = (int) session.getAttribute("frId");
			DateFormat DF = new SimpleDateFormat("dd-MM-yyyy");
			String currntDat = DF.format(new java.util.Date());
			System.out.println("ToDay Date-----" + currntDat);

			String fromDate = request.getParameter("from_date");
			String toDate = request.getParameter("to_date");

			System.out.println("Dates***************" + fromDate + " " + toDate);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("frId", frid);
			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate", DateConvertor.convertToYMD(toDate));

			PettyCashManagmt[] list = rest.postForObject(Constant.URL + "/getPettyCashListDateWise", map,
					PettyCashManagmt[].class);
			pettyInfo = new ArrayList<>(Arrays.asList(list));
			SimpleDateFormat ymdSDF1 = new SimpleDateFormat("dd-MM-yyyy");

			if (pettyInfo != null) {
				for (int i = 0; i < pettyInfo.size(); i++) {
					Calendar cal1 = Calendar.getInstance();
					cal1.setTimeInMillis(Long.parseLong(pettyInfo.get(i).getDate()));
					pettyInfo.get(i).setDate(ymdSDF1.format(cal1.getTime()));
				}
			}

			System.out.println("PettyDateList---------------" + pettyInfo);

		} catch (Exception e) {
			System.err.println("Exception in showPattyCashMgmnt : " + e.getMessage());
			e.printStackTrace();
		}

		return pettyInfo;

	}

	@RequestMapping(value = "/getPettyCashDetailPdf/{fromDate}/{toDate}", method = RequestMethod.GET)
	public void getOtherItemStockPdf(@PathVariable String fromDate, @PathVariable String toDate,
			HttpServletRequest request, HttpServletResponse response) {

		ArrayList<PettyCashManagmt> pettyInfo = new ArrayList<>();
		HttpSession session = request.getSession();
		int frid = (int) session.getAttribute("frId");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		map.add("frId", frid);
		map.add("fromDate", DateConvertor.convertToYMD(fromDate));
		map.add("toDate", DateConvertor.convertToYMD(toDate));

		PettyCashManagmt[] list = rest.postForObject(Constant.URL + "/getPettyCashListDateWise", map,
				PettyCashManagmt[].class);
		pettyInfo = new ArrayList<>(Arrays.asList(list));
		SimpleDateFormat ymdSDF1 = new SimpleDateFormat("dd-MM-yyyy");

		if (pettyInfo != null) {
			for (int i = 0; i < pettyInfo.size(); i++) {
				Calendar cal1 = Calendar.getInstance();
				cal1.setTimeInMillis(Long.parseLong(pettyInfo.get(i).getDate()));
				pettyInfo.get(i).setDate(ymdSDF1.format(cal1.getTime()));
			}
		}

		Document doc = new Document();

		String FILE_PATH = Constant.REPORT_SAVE;
		File file = new File(FILE_PATH);

		PdfWriter writer = null;

		FileOutputStream out = null;
		try {
			out = new FileOutputStream(FILE_PATH);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			writer = PdfWriter.getInstance(doc, out);
		} catch (DocumentException e) {

			e.printStackTrace();
		}

		PdfPTable table = new PdfPTable(7);
		try {
			System.out.println("Inside PDF Table try");
			table.setWidthPercentage(100);
			table.setWidths(new float[] { 1.2f, 1.2f, 1.2f, 1.2f, 1.2f, 1.2f, 1.2f });
			Font headFont = new Font(FontFamily.HELVETICA, 10, Font.NORMAL, BaseColor.BLACK);
			Font headFont1 = new Font(FontFamily.HELVETICA, 10, Font.BOLD, BaseColor.BLACK);
			Font f = new Font(FontFamily.TIMES_ROMAN, 12.0f, Font.UNDERLINE, BaseColor.BLUE);

			PdfPCell hcell;
			hcell = new PdfPCell(new Phrase("Sr.No.", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Date", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Opening Amt", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Cash Amt", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Withdrawal Amt", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("ClosingAmt", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			hcell = new PdfPCell(new Phrase("Calculated Cash Amt", headFont1));
			hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table.addCell(hcell);

			int index = 0;

			for (PettyCashManagmt advance : pettyInfo) {
				index++;
				PdfPCell cell;

				cell = new PdfPCell(new Phrase(String.valueOf(index), headFont));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase(advance.getDate(), headFont));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				cell.setPaddingRight(5);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase("" + advance.getOpeningAmt(), headFont));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				cell.setPaddingRight(2);
				cell.setPadding(3);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase("" + advance.getCashAmt(), headFont));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				cell.setPaddingRight(2);
				cell.setPadding(3);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase("" + advance.getWithdrawalAmt(), headFont));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				cell.setPaddingRight(2);
				cell.setPadding(3);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase("" + advance.getClosingAmt(), headFont));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				cell.setPaddingRight(2);
				cell.setPadding(3);
				table.addCell(cell);

				cell = new PdfPCell(new Phrase("" + advance.getCashEditAmt(), headFont));
				cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
				cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				cell.setPaddingRight(2);
				cell.setPadding(3);
				table.addCell(cell);

			}

			doc.open();

			Paragraph heading = new Paragraph("Petty Cash Detail ");
			heading.setAlignment(Element.ALIGN_CENTER);
			doc.add(heading);
			DateFormat DF = new SimpleDateFormat("dd-MM-yyyy");
			String reportDate = DF.format(new java.util.Date());

			doc.add(new Paragraph("From Date:" + fromDate));
			doc.add(new Paragraph("To Date:" + toDate));
			doc.add(new Paragraph("\n"));
			// document.add(new Paragraph(" "));
			doc.add(table);

			doc.close();

			// Atul Sir code to open a Pdf File
			if (file != null) {

				String mimeType = URLConnection.guessContentTypeFromName(file.getName());

				if (mimeType == null) {

					mimeType = "application/pdf";

				}

				response.setContentType(mimeType);

				response.addHeader("content-disposition", String.format("inline; filename=\"%s\"", file.getName()));

				// response.setHeader("Content-Disposition", String.format("attachment;
				// filename=\"%s\"", file.getName()));

				response.setContentLength((int) file.length());

				BufferedInputStream inputStream = null;
				try {
					inputStream = new BufferedInputStream(new FileInputStream(file));
				} catch (FileNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				try {
					FileCopyUtils.copy(inputStream, response.getOutputStream());
				} catch (IOException e) {
					System.out.println("Excep in Opening a Pdf File for Mixing");
					e.printStackTrace();
				}
			}

		} catch (DocumentException ex) {

			System.out.println("Pdf Generation Error: Prod From Orders" + ex.getMessage());

			ex.printStackTrace();

		}

	}

	@RequestMapping(value = "/insertPettyCashHandOver", method = RequestMethod.POST)
	public String insertPettyCashHandOver(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		try {

			PettyCashHandover cashHndOvr = new PettyCashHandover();
			session = req.getSession();
			int frid = (int) session.getAttribute("frId");

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			// logger.info(dateFormat.format(date)); // Current Date Time

			SimpleDateFormat ymdSDF1 = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal1 = Calendar.getInstance();
			//String str = req.getParameter("from_emp");
			
			FrEmpMaster loginResponse=  (FrEmpMaster) session.getAttribute("frEmpDetails");
			System.err.println("EMP LOGIN -------------------------------- "+loginResponse);
			
			String fromEmpId = ""+loginResponse.getFrEmpId();
			String FromEmpName = ""+loginResponse.getFrEmpName();
			
			DateFormat DF = new SimpleDateFormat("yyyy-MM-dd");
			String currentDate = DF.format(new java.util.Date());
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frid);
			map.add("lastdate", currentDate);
			
			System.err.println("DATE **************************** "+currentDate);
			
			PettyCashHandover data = rest.postForObject(Constant.URL + "/getLastCashHandover", map,
					PettyCashHandover.class);
			
			System.err.println("PREV HANDOVER **************************** "+data);
			
			float prevAmt=0;
			if(data!=null) {
				prevAmt=data.getSellingAmt();
			}
			
			float sellAmtTot=Float.parseFloat(req.getParameter("sell_amt"));
			
			float saleDone=sellAmtTot-prevAmt;

			
			//String[] part = str.split("-");
			//String fromEmpId = part[0];
			//String FromEmpName = part[1];

			String str2 = req.getParameter("to_emp");
			String[] parts = str2.split("-");
			String toEmpId = parts[0];
			String toEmpName = parts[1];

			cashHndOvr.setActualAmtHandover(Float.parseFloat(req.getParameter("total_cash_amt")));
			cashHndOvr.setAmtHandover(Float.parseFloat(req.getParameter("actual_cash_amt")));
			cashHndOvr.setClosingDate(ymdSDF1.format(cal1.getTime()));
			cashHndOvr.setDelStatus(0);
			cashHndOvr.setExInt1(0);
			cashHndOvr.setExInt2(0);
			cashHndOvr.setExInt3(0);
			cashHndOvr.setExVar1(""+saleDone);
			cashHndOvr.setExVar2("NA");
			cashHndOvr.setExVar3("NA");
			cashHndOvr.setFrId(frid);
			cashHndOvr.setFromUserId(Integer.parseInt(fromEmpId));
			cashHndOvr.setFromUsername(FromEmpName);
			cashHndOvr.setOpeningAmt(Float.parseFloat(req.getParameter("open_amt")));
			cashHndOvr.setSellingAmt(Float.parseFloat(req.getParameter("sell_amt")));
			cashHndOvr.setToUserId(Integer.parseInt(toEmpId));
			cashHndOvr.setToUsername(toEmpName);
			cashHndOvr.setTransactionDate(dateFormat.format(date));
			cashHndOvr.setUpdateDatetime(dateFormat.format(date));

			PettyCashHandover cash = rest.postForObject(Constant.URL + "/savePettyCashHandOver", cashHndOvr,
					PettyCashHandover.class);
			if (cash != null) {
				logger.info("Data Saved Successfully" + cash);
			} else {
				logger.info("Data Not Saved");
			}

		} catch (Exception e) {
			System.out.println("Exception in insertPettyCashHandOver" + e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/showPattyCashMgmnt";
	}

	@RequestMapping(value = "/getPettyCashHandOverData", method = RequestMethod.GET)
	public @ResponseBody List<PettyCashHandover> getPettyCashHandOverData(HttpServletRequest req,
			HttpServletResponse resp, HttpSession session) {
		List<PettyCashHandover> cashList = null;
		try {

			String fromDate = req.getParameter("fromDate");
			String toDate = req.getParameter("toDate");
			logger.info("Datesssssssssss" + fromDate + " -- " + toDate);

			session = req.getSession();
			int frid = (int) session.getAttribute("frId");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("frId", frid);
			map.add("fromDate", fromDate);
			map.add("toDate", toDate);

			PettyCashHandover[] list = rest.postForObject(Constant.URL + "/getCashHandOverTransctn", map,
					PettyCashHandover[].class);
			cashList = new ArrayList<>(Arrays.asList(list));
			logger.info("cashList-----------------------" + cashList);
		} catch (Exception e) {
			System.out.println("Exception in getPettyCashHandOverData" + e.getMessage());
			e.printStackTrace();
		}

		return cashList;

	}

	/***********************************
	 * Franchisee Employee
	 ****************************************/

	@RequestMapping(value = "/saveFranchiseeEmp", method = RequestMethod.POST)
	public @ResponseBody FrEmpMaster saveFranchiseeEmp(HttpServletRequest req, HttpServletResponse resp,
			HttpSession session) {
		FrEmpMaster saveEmp = new FrEmpMaster();
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();

			session = req.getSession();
			int frid = (int) session.getAttribute("frId");

			FrEmpMaster emp = new FrEmpMaster();
			int frEmpId = Integer.parseInt(req.getParameter("fr_emp_id"));
			System.out.println("EmpId=" + frEmpId);

			emp.setFrEmpId(frEmpId);
			emp.setCurrentBillAmt(Float.parseFloat(req.getParameter("curr_bill_amt")));
			emp.setDelStatus(0);
			emp.setDesignation(Integer.parseInt(req.getParameter("designation")));
			emp.setEmpCode(req.getParameter("emp_code"));
			emp.setExInt1(0);
			emp.setExInt2(0);
			emp.setExInt3(0);
			emp.setExVar1("NA");
			emp.setExVar2("NA");
			emp.setExVar3("NA");
			emp.setFrEmpAddress(req.getParameter("emp_address"));
			emp.setFrEmpContact(req.getParameter("emp_contact"));
			System.out.println(req.getParameter("join_date"));
			emp.setFrEmpJoiningDate(req.getParameter("join_date"));
			emp.setFrEmpName(req.getParameter("emp_name"));
			emp.setFrId(frid);
			emp.setFromDate(req.getParameter("from_date"));
			emp.setToDate(req.getParameter("to_date"));
			emp.setIsActive(0);
			emp.setPassword(req.getParameter("pass"));
			emp.setTotalLimit(Float.parseFloat(req.getParameter("ttl_limit")));
			emp.setUpdateDatetime(dateFormat.format(date));

			saveEmp = rest.postForObject(Constant.URL + "/saveFrEmpDetails", emp, FrEmpMaster.class);
			System.out.println("Result-----------" + saveEmp);

			if (saveEmp != null) {

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return saveEmp;

	}

	@RequestMapping(value = "/getAllFrEmp", method = RequestMethod.GET)
	public @ResponseBody List<FrEmpMaster> getAllFrEmp(HttpServletRequest req, HttpServletResponse resp,
			HttpSession session) {
		List<FrEmpMaster> empList = null;
		try {
			session = req.getSession();
			int frid = (int) session.getAttribute("frId");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("frId", frid);
			FrEmpMaster[] empArr = rest.postForObject(Constant.URL + "/getAllFrEmpByFrid", map, FrEmpMaster[].class);
			empList = new ArrayList<FrEmpMaster>(Arrays.asList(empArr));

			System.out.println("Emp List----------" + empList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return empList;

	}

	@RequestMapping(value = "/getFrEmpById", method = RequestMethod.GET)
	public @ResponseBody FrEmpMaster getFrEmpById(HttpServletRequest req, HttpServletResponse resp,
			HttpSession session) {
		FrEmpMaster emp = new FrEmpMaster();
		try {

			int empId = Integer.parseInt(req.getParameter("empId"));
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("empId", empId);

			emp = rest.postForObject(Constant.URL + "/getFrEmpByEmpId", map, FrEmpMaster.class);
			emp.setExVar1(DateConvertor.convertToYMD(emp.getFrEmpJoiningDate()));
			emp.setExVar2(DateConvertor.convertToYMD(emp.getFromDate()));
			emp.setExVar3(DateConvertor.convertToYMD(emp.getToDate()));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return emp;
	}

	@RequestMapping(value = "/delFrEmpById", method = RequestMethod.GET)
	public @ResponseBody List<FrEmpMaster> delFrEmpById(HttpServletRequest req, HttpServletResponse resp,
			HttpSession session) {
		List<FrEmpMaster> empList = null;
		MultiValueMap<String, Object> map = null;
		try {
			session = req.getSession();
			int frid = (int) session.getAttribute("frId");

			int empId = Integer.parseInt(req.getParameter("empId"));
			map = new LinkedMultiValueMap<String, Object>();
			map.add("empId", empId);

			Info info = rest.postForObject(Constant.URL + "/delFrEmp", map, Info.class);
			if (info.isError()) {
				map = new LinkedMultiValueMap<String, Object>();
				map.add("frId", frid);
				FrEmpMaster[] empArr = rest.postForObject(Constant.URL + "/getAllFrEmpByFrid", map,
						FrEmpMaster[].class);
				empList = new ArrayList<FrEmpMaster>(Arrays.asList(empArr));

				System.out.println("Emp ListResFail----------" + empList);

			} else {
				map = new LinkedMultiValueMap<String, Object>();
				map.add("frId", frid);
				FrEmpMaster[] empArr = rest.postForObject(Constant.URL + "/getAllFrEmpByFrid", map,
						FrEmpMaster[].class);
				empList = new ArrayList<FrEmpMaster>(Arrays.asList(empArr));

				System.out.println("Emp ListRes Sucess----------" + empList);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return empList;
	}

	@RequestMapping(value = "/verifyUniqueContactNo", method = RequestMethod.GET)
	public @ResponseBody Info verifyUniqueContactNo(HttpServletRequest request, HttpServletResponse response) {
		Info info = new Info();
		try {
			HttpSession session = request.getSession();
			int frid = (int) session.getAttribute("frId");
			RestTemplate restTemplate = new RestTemplate();
			String mobNo = request.getParameter("mobNo");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("mobNo", mobNo);
			map.add("frId", frid);

			info = restTemplate.postForObject(Constant.URL + "/checkUniqueContactNo", map, Info.class);
			System.out.println("Info Res----------------" + info);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;

	}
}
