package com.monginis.ops.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Month;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.monginis.ops.constant.Constant;
import com.monginis.ops.model.CategoryList;
import com.monginis.ops.model.Customer;
import com.monginis.ops.model.MCategory;
import com.monginis.ops.model.pettycash.PettyCashManagmt;
 
@Controller
@Scope("session")
public class PosPlaceOrderController {
	
	List<MCategory> mAllCategoryList = new ArrayList<MCategory>();
 	
	CategoryList categoryList;

	@RequestMapping(value = "/showsPlaceOrder")
	public ModelAndView showsPlaceOrder(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
 
		ModelAndView model = new ModelAndView("POSOrder/placeOrder");

		RestTemplate restTemplate = new RestTemplate();
		ArrayList<Customer> custList  = new ArrayList<>();
		try {

			categoryList = restTemplate.getForObject(Constant.URL + "showAllCategory", CategoryList.class);
			
 			Customer[] list = restTemplate.getForObject(Constant.URL + "/getAllCustomers",
					Customer[].class);
			 custList = new ArrayList<>(Arrays.asList(list)); 
			 System.out.println("custlist" + custList.toString());

		} catch (Exception e) {
			System.out.println("Exception in getAllGategory" + e.getMessage());
			e.printStackTrace();

		}

		mAllCategoryList = categoryList.getmCategoryList();

		System.out.println(" All Category " + mAllCategoryList.toString());

		model.addObject("category", mAllCategoryList);
		model.addObject("custList", custList);
 
		return model;
	}


}
