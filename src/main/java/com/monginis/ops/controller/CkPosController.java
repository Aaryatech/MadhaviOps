package com.monginis.ops.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("session")
public class CkPosController {

	@RequestMapping(value = "/showCkOrders")
	public ModelAndView showCkOrders(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = null;

		mav = new ModelAndView("ckpos/viewCkOrders");
		
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		mav.addObject("todaysDate",sdf.format(cal.getTime()));

	
		return mav;

	}
	
}
