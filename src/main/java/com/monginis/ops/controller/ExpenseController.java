package com.monginis.ops.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
 import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.monginis.ops.common.DateConvertor;
import com.monginis.ops.constant.Constant;
import com.monginis.ops.constant.VpsImageUpload;
import com.monginis.ops.model.Expense;
import com.monginis.ops.model.Franchisee;
 
@Controller
@Scope("session")
public class ExpenseController {
 
	@RequestMapping(value = "/showAddExpense")
	public ModelAndView addRate(HttpServletRequest request, HttpServletResponse response) {
 
		ModelAndView mav = new ModelAndView("expense/addExpense");

		  
//saveExpense
		return mav;
	}
	
	
	@RequestMapping(value = "/addSubmitExpense", method = RequestMethod.POST)
	public String addSubmitExpense(HttpServletRequest request, HttpServletResponse response,@RequestParam("photo") List<MultipartFile> photo) {

		try {

			

			HttpSession session = request.getSession();
			Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
			

			String chalanNo = request.getParameter("chalanNo");

			String expDate = request.getParameter("expDate");
			
			String amount = request.getParameter("amount");
			
			String isActive = request.getParameter("isActive");
			String remark = request.getParameter("remark");

		 
 			
 			VpsImageUpload upload = new VpsImageUpload();

			Calendar cale = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
			System.out.println(sdf.format(cale.getTime()));

			String curTimeStamp = sdf.format(cale.getTime());
			String gvnPhoto1 = null;
 
			
			for(int i=0;i<photo.size();i++) {
				try {
					gvnPhoto1 = curTimeStamp + "-" + photo.get(i).getOriginalFilename();
	 				 
					upload.saveUploadedFiles(photo, Constant.GVN_IMAGE_TYPE,
							curTimeStamp + "-" + photo.get(i).getOriginalFilename());

	 
				} catch (IOException e) {

					System.out.println("Exce in File Upload In gvn  Insert " + e.getMessage());
					e.printStackTrace();
				}
			}
			Expense exp =new Expense();
			
			exp.setChalanNo(chalanNo);
			exp.setChAmt(amount);
			exp.setDelStatus(0);
			exp.setExpDate(DateConvertor.convertToYMD(expDate));
			exp.setExpType(isActive);
			exp.setRemark(remark);
			exp.setStatus(0);
			exp.setImgName(gvnPhoto1);
			
			exp.setExInt1(0);
			exp.setExInt2(0);
			exp.setExInt3(0);
			exp.setExInt4(0);
			
			exp.setExVar1("NA");
			exp.setExVar2("NA");
			exp.setExVar3("NA");
			exp.setExVar4("NA");
			
			exp.setFrId(frDetails.getFrId());
 
			RestTemplate restTemplate = new RestTemplate();

			Expense errorMessage = restTemplate.postForObject(Constant.URL + "/saveExpense", exp,
					Expense.class);
			System.out.println("Response: " + errorMessage.toString());
		} catch (Exception e) {
			System.out.println("Exception In Add  SubCategory Process:" + e.getMessage());

			return "redirect:/showAddExpense";

		}

		return "redirect:/showAddExpense";
	}

}
