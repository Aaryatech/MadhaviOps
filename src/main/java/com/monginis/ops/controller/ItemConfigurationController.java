package com.monginis.ops.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("session")
public class ItemConfigurationController {

	@RequestMapping(value = "/showItemConfig")
	public ModelAndView showItemConfig(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = null;

		mav = new ModelAndView("itemConfig/itemConfig");

	
		return mav;

	}

	
}
