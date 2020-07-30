package com.monginis.ops.controller.cloudkitchen;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
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
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.monginis.ops.constant.Constant;
import com.monginis.ops.model.Franchisee;
import com.monginis.ops.model.cloudkitchen.GetItemsForConfig;
import com.monginis.ops.model.cloudkitchen.GetOrderDetail;
import com.monginis.ops.model.cloudkitchen.GetOrderHeaderDisplay;
import com.monginis.ops.model.cloudkitchen.GetOrders;
import com.monginis.ops.model.newpos.SellBillHeaderAndDetail;
import com.monginis.ops.model.pettycash.FrEmpMaster;

@Controller
@Scope("session")
public class OrderController {

	RestTemplate restTemplate = new RestTemplate();

	@RequestMapping(value = "/showCkOrders")
	public ModelAndView showCkOrders(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = null;

		mav = new ModelAndView("ckpos/viewCkOrders");

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		mav.addObject("todaysDate", sdf.format(cal.getTime()));

		List<FrEmpMaster> empList = null;
		try {
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			int frId = frDetails.getFrId();

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("frId", frId);
			map.add("desig", 3);

			FrEmpMaster[] empArr = restTemplate.postForObject(Constant.URL + "/getAllFrEmpsByDesination", map,
					FrEmpMaster[].class);
			empList = new ArrayList<FrEmpMaster>(Arrays.asList(empArr));
			mav.addObject("deliveryBoyList", empList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;

	}

	List<GetOrderHeaderDisplay> orderList = new ArrayList<>();

	// AJAX
	@RequestMapping(value = "/getOrdersByFrAndDelDateAjax", method = RequestMethod.GET)
	public @ResponseBody List<GetOrderHeaderDisplay> getOrdersByFrAndDelDateAjax(HttpServletRequest request,
			HttpServletResponse response) {

		orderList = new ArrayList<>();

		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		int frId = frDetails.getFrId();

		String delDate = request.getParameter("delDate");

		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");

		try {
			Date d = sdf.parse(delDate);
			delDate = sdf1.format(d);
		} catch (ParseException e) {
		}

		System.err.println("DEL DATE = " + delDate);

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
		map.add("frId", frId);
		map.add("delDate", delDate);
		map.add("status", "0,1,2");

		GetOrderHeaderDisplay[] orderArr = restTemplate.postForObject(Constant.URL + "getOrdersByFrAndDeliveryDate",
				map, GetOrderHeaderDisplay[].class);
		orderList = new ArrayList<GetOrderHeaderDisplay>(Arrays.asList(orderArr));
		System.err.println("ORDERS = " + orderList);

		return orderList;
	}

	List<GetOrderDetail> orderDetailList = new ArrayList<>();

	// AJAX
	@RequestMapping(value = "/getOrderDetailListByOrderId", method = RequestMethod.GET)
	public @ResponseBody List<GetOrderDetail> getOrderDetailListByOrderId(HttpServletRequest request,
			HttpServletResponse response) {

		orderDetailList = new ArrayList<>();

		int orderId = Integer.parseInt(request.getParameter("orderId"));

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
		map.add("orderId", orderId);

		GetOrderDetail[] itemArr = restTemplate.postForObject(Constant.URL + "getOrderDetailByOrderId", map,
				GetOrderDetail[].class);
		orderDetailList = new ArrayList<GetOrderDetail>(Arrays.asList(itemArr));

		return orderDetailList;
	}

	// KOT PRINT
	@RequestMapping(value = "/printOrderKot/{index}", method = RequestMethod.GET)
	public String printKotBill(@PathVariable int index, HttpServletRequest request, HttpServletResponse response,
			Model model) {

		String mav = "ckpos/printOrderKOT";

		try {
			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			model.addAttribute("frName", frDetails.getFrName());

			// System.err.println("JSON = "+jsonStr);

			// ObjectMapper mapper = new ObjectMapper();
			// GetOrderHeaderDisplay order = mapper.readValue(jsonStr,
			// GetOrderHeaderDisplay.class);

			GetOrderHeaderDisplay order = new GetOrderHeaderDisplay();

			if (orderList != null) {
				order=orderList.get(index);
			}

			System.err.println("ORDER KOT = " + order);

			model.addAttribute("order", order);
			/*
			 * try { map = new LinkedMultiValueMap<String, Object>(); map.add("empId",
			 * sellBillHeaderAndDetail.getExtInt1());
			 * 
			 * FrEmpMaster frEmpMaster = restTemplate.postForObject(Constant.URL +
			 * "/getFrEmpByEmpId", map, FrEmpMaster.class);
			 * model.addAttribute("frEmpMaster", frEmpMaster); } catch (Exception e) {
			 * FrEmpMaster frEmpMaster = new FrEmpMaster(); frEmpMaster.setFrEmpName("-");
			 * model.addAttribute("frEmpMaster", frEmpMaster); }
			 */

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	
	

}
