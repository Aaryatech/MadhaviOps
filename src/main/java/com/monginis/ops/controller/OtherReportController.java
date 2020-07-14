package com.monginis.ops.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.monginis.ops.constant.Constant;
import com.monginis.ops.model.CustList;
import com.monginis.ops.model.ExportToExcel;
import com.monginis.ops.model.Franchisee;
import com.monginis.ops.model.pettycash.FrEmpMaster;
import com.monginis.ops.model.spadvreport.GetOnlineOrderHistory;

@Controller
public class OtherReportController {
	MultiValueMap<String, Object> map;
	@RequestMapping(value = "/showOnlineOrderHistory")
	public ModelAndView showCutomerList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = null;

		mav = new ModelAndView("report/other/onlineOrderhistory");

		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		List<FrEmpMaster> empList = null;
		try {
			map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frDetails.getFrId());
			map.add("desig", 4);
			RestTemplate restTemplate = new RestTemplate();
			
			FrEmpMaster[] empArr = restTemplate.postForObject(Constant.URL + "/getAllFrEmpsByDesination", map, FrEmpMaster[].class);
			empList = new ArrayList<FrEmpMaster>(Arrays.asList(empArr));

			System.out.println("Emp List----------" + empList);

			mav.addObject("empList", empList);
			mav.addObject("frId", frDetails.getFrId());

			List<GetOnlineOrderHistory> list = new ArrayList<GetOnlineOrderHistory>();
			
			GetOnlineOrderHistory order1 = new GetOnlineOrderHistory();
			order1.setOrderId(101);
			order1.setCustomer("Nikhil Takhur");
			order1.setMobNo("9545999985");
			order1.setInvoiceNo("SP101");
			order1.setDeliveryDate("01-07-2020");
			order1.setDeliveryTime("05:00 pm");
			//order1.setDeliveryBoy("Amit");
			order1.setModeOfPayment("Cash");
			list.add(order1);
			
			GetOnlineOrderHistory order2 = new GetOnlineOrderHistory();
			order2.setOrderId(101);
			order2.setCustomer("Vishal Saulanki");
			order2.setMobNo("7845741474");
			order2.setInvoiceNo("SP102");
			order2.setDeliveryDate("01-07-2020");
			order2.setDeliveryTime("05:00 pm");
			//order2.setDeliveryBoy("Govind");
			order2.setModeOfPayment("Cash");
			list.add(order2);
			
			GetOnlineOrderHistory order3 = new GetOnlineOrderHistory();
			order3.setOrderId(101);
			order3.setCustomer("Ajit Dhongde");
			order3.setMobNo("9525632541");
			order3.setInvoiceNo("SP103");
			order3.setDeliveryDate("01-07-2020");
			order3.setDeliveryTime("05:00 pm");
			//order3.setDeliveryBoy("Shubham");
			order3.setModeOfPayment("COD");
			list.add(order3);
			
			GetOnlineOrderHistory order4 = new GetOnlineOrderHistory();
			order4.setOrderId(101);
			order4.setCustomer("Pooja Mishra");
			order4.setMobNo("7547444112");
			order4.setInvoiceNo("SP101");
			order4.setDeliveryDate("04-07-2020");
			order4.setDeliveryTime("12:00 pm");
			order4.setDeliveryBoy("Joy");
			order4.setModeOfPayment("E_Pay");
			list.add(order4);
			
			GetOnlineOrderHistory order5 = new GetOnlineOrderHistory();
			order5.setOrderId(101);
			order5.setCustomer("Ravi Joshi");
			order5.setMobNo("9698585474");
			order5.setInvoiceNo("SP105");
			order5.setDeliveryDate("05-07-2020");
			order5.setDeliveryTime("01:00 pm");
			//order1.setDeliveryBoy("Akhil");
			order5.setModeOfPayment("Cash");
			list.add(order5);
			List<ExportToExcel> exportToExcelList = new ArrayList<ExportToExcel>();

			ExportToExcel expoExcel = new ExportToExcel();
			List<String> rowData = new ArrayList<String>();

			rowData.add("Sr. No");
			rowData.add("Invoice No.");
			rowData.add("Customer");
			rowData.add("Delivery Date");
			rowData.add("Mode Of Payment");
			expoExcel.setRowData(rowData);
			exportToExcelList.add(expoExcel);

			for (int i = 0; i < list.size(); i++) {
				expoExcel = new ExportToExcel();
				rowData = new ArrayList<String>();

				rowData.add("" + (i + 1));
				rowData.add("" + list.get(i).getInvoiceNo());
				rowData.add("" + list.get(i).getCustomer()+" - "+ list.get(i).getMobNo());
				rowData.add("" + list.get(i).getDeliveryDate()+" - "+ list.get(i).getDeliveryTime());
				rowData.add("" + list.get(i).getModeOfPayment());

				expoExcel.setRowData(rowData);
				exportToExcelList.add(expoExcel);

			}

			session = request.getSession();
			session.setAttribute("exportExcelList", exportToExcelList);
			session.setAttribute("excelNameNew", "OnlineOrderHistoryList");
			session.setAttribute("reportNameNew", "OnlineOrderHistoryList");
			session.setAttribute("mergeUpto1", "$A$1:$D$1");
			session.setAttribute("mergeUpto2", "$A$2:$D$2");

		} catch (Exception e) {
			e.printStackTrace();

		}
		return mav;

	}
	
	
	@RequestMapping(value = "/getOnlineOrderHistoryReport")
	@ResponseBody
	public List<GetOnlineOrderHistory> getOnlineOrderHistoryReport(HttpServletRequest request, HttpServletResponse response) {
		List<GetOnlineOrderHistory> list = new ArrayList<GetOnlineOrderHistory>();
		try {
			GetOnlineOrderHistory order1 = new GetOnlineOrderHistory();
			order1.setOrderId(101);
			order1.setCustomer("Nikhil Takhur");
			order1.setMobNo("9545999985");
			order1.setInvoiceNo("SP101");
			order1.setDeliveryDate("01-07-2020");
			order1.setDeliveryTime("05:00 pm");
			//order1.setDeliveryBoy("Amit");
			order1.setModeOfPayment("Cash");
			list.add(order1);
			
			GetOnlineOrderHistory order2 = new GetOnlineOrderHistory();
			order2.setOrderId(101);
			order2.setCustomer("Vishal Saulanki");
			order2.setMobNo("7845741474");
			order2.setInvoiceNo("SP102");
			order2.setDeliveryDate("01-07-2020");
			order2.setDeliveryTime("05:00 pm");
			//order2.setDeliveryBoy("Govind");
			order2.setModeOfPayment("Cash");
			list.add(order2);
			
			GetOnlineOrderHistory order3 = new GetOnlineOrderHistory();
			order3.setOrderId(101);
			order3.setCustomer("Ajit Dhongde");
			order3.setMobNo("9525632541");
			order3.setInvoiceNo("SP103");
			order3.setDeliveryDate("01-07-2020");
			order3.setDeliveryTime("05:00 pm");
			//order3.setDeliveryBoy("Shubham");
			order3.setModeOfPayment("COD");
			list.add(order3);
			
			GetOnlineOrderHistory order4 = new GetOnlineOrderHistory();
			order4.setOrderId(101);
			order4.setCustomer("Pooja Mishra");
			order4.setMobNo("7547444112");
			order4.setInvoiceNo("SP101");
			order4.setDeliveryDate("04-07-2020");
			order4.setDeliveryTime("12:00 pm");
			order4.setDeliveryBoy("Joy");
			order4.setModeOfPayment("E_Pay");
			list.add(order4);
			
			GetOnlineOrderHistory order5 = new GetOnlineOrderHistory();
			order5.setOrderId(101);
			order5.setCustomer("Ravi Joshi");
			order5.setMobNo("9698585474");
			order5.setInvoiceNo("SP105");
			order5.setDeliveryDate("05-07-2020");
			order5.setDeliveryTime("01:00 pm");
			//order1.setDeliveryBoy("Akhil");
			order5.setModeOfPayment("Cash");
			list.add(order5);
			
			System.out.println("List---"+list);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
		
	}
	
	@RequestMapping(value = "pdf/getOnlineOrderHistoryListPdf", method = RequestMethod.GET)
	public ModelAndView getCrnCheckedHeadersNew(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("In Pdf");
		
		ModelAndView model = new ModelAndView("report/other/getOnlineOrderHistoryPdf");
		List<GetOnlineOrderHistory> list = new ArrayList<GetOnlineOrderHistory>();
		try {
			//RestTemplate restTemplate = new RestTemplate();

		//	MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			

			GetOnlineOrderHistory order1 = new GetOnlineOrderHistory();
			order1.setOrderId(101);
			order1.setCustomer("Nikhil Takhur");
			order1.setMobNo("9545999985");
			order1.setInvoiceNo("SP101");
			order1.setDeliveryDate("01-07-2020");
			order1.setDeliveryTime("05:00 pm");
			//order1.setDeliveryBoy("Amit");
			order1.setModeOfPayment("Cash");
			list.add(order1);
			
			GetOnlineOrderHistory order2 = new GetOnlineOrderHistory();
			order2.setOrderId(101);
			order2.setCustomer("Vishal Saulanki");
			order2.setMobNo("7845741474");
			order2.setInvoiceNo("SP102");
			order2.setDeliveryDate("01-07-2020");
			order2.setDeliveryTime("05:00 pm");
			//order2.setDeliveryBoy("Govind");
			order2.setModeOfPayment("COD");
			list.add(order2);
			
			GetOnlineOrderHistory order3 = new GetOnlineOrderHistory();
			order3.setOrderId(101);
			order3.setCustomer("Ajit Dhongde");
			order3.setMobNo("9525632541");
			order3.setInvoiceNo("SP103");
			order3.setDeliveryDate("01-07-2020");
			order3.setDeliveryTime("05:00 pm");
			//order3.setDeliveryBoy("Shubham");
			order3.setModeOfPayment("E-Pay");
			list.add(order3);
			
			GetOnlineOrderHistory order4 = new GetOnlineOrderHistory();
			order4.setOrderId(101);
			order4.setCustomer("Pooja Mishra");
			order4.setMobNo("7547444112");
			order4.setInvoiceNo("SP101");
			order4.setDeliveryDate("04-07-2020");
			order4.setDeliveryTime("12:00 pm");
			order4.setDeliveryBoy("Joy");
			order4.setModeOfPayment("Cash");
			list.add(order4);
			
			GetOnlineOrderHistory order5 = new GetOnlineOrderHistory();
			order5.setOrderId(101);
			order5.setCustomer("Ravi Joshi");
			order5.setMobNo("9698585474");
			order5.setInvoiceNo("SP105");
			order5.setDeliveryDate("05-07-2020");
			order5.setDeliveryTime("01:00 pm");
			//order1.setDeliveryBoy("Akhil");
			order5.setModeOfPayment("Cash");
			list.add(order5);
			
			System.out.println("List---"+list);

			model.addObject("list", list);

		} catch (Exception e) {
			System.err.println("Exce Occured ");
			System.err.println(e.getMessage());
			e.printStackTrace();
		}

		return model;
	}
}
