package com.monginis.ops.controller;

import java.awt.Dimension;
import java.awt.Insets;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.InvalidParameterException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.TimeZone;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.zefer.pd4ml.PD4Constants;
import org.zefer.pd4ml.PD4ML;
import org.zefer.pd4ml.PD4PageMark;

import com.monginis.ops.billing.GetBillDetail;
import com.monginis.ops.billing.GetBillDetailsResponse;
import com.monginis.ops.billing.GetBillHeader;
import com.monginis.ops.billing.GetBillHeaderResponse;
import com.monginis.ops.billing.Info;
import com.monginis.ops.billing.SellBillDataCommon;
import com.monginis.ops.billing.SellBillDetail;
import com.monginis.ops.billing.SellBillHeader;
import com.monginis.ops.constant.Constant;
import com.monginis.ops.model.CategoryListResponse;
import com.monginis.ops.model.Currency;
import com.monginis.ops.model.FrBillHeaderForPrint;
import com.monginis.ops.model.FrBillPrint;
import com.monginis.ops.model.Franchisee;
import com.monginis.ops.model.GetBillDetailPrint;
import com.monginis.ops.model.MCategoryList;
import com.monginis.ops.model.SellBillDetailList;
import com.monginis.ops.model.SlabwiseBillList;
import com.monginis.ops.model.SubCategory;


@Controller
@Scope("session")
public class BillingController {
	
	
	public GetBillHeaderResponse billHeadeResponse;
	public List<GetBillDetail> billDetailsList;
	
	
	@RequestMapping(value = "/showBill", method = RequestMethod.GET)
	public ModelAndView showBill(HttpServletRequest request,
			HttpServletResponse response) {
		
		ModelAndView modelAndView = new ModelAndView("billing/showBill");
		List<GetBillHeader> billHeader=new ArrayList<GetBillHeader>();

		try {
		     HttpSession session = request.getSession();
		     Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		
		     RestTemplate restTemplate = new RestTemplate();
				
				MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
				DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
				Date date = new Date();				
				System.out.println(dateFormat.format(date));
				
				
				int frId=frDetails.getFrId();
				
				
				map.add("fromDate", dateFormat.format(date));
				
				map.add("toDate", dateFormat.format(date));
				
				map.add("frId", frId);
				//map.add("typeIdList", "-1");
			
				
				ParameterizedTypeReference<GetBillHeaderResponse> typeRef = new ParameterizedTypeReference<GetBillHeaderResponse>() {
				};
				ResponseEntity<GetBillHeaderResponse> responseEntity = restTemplate.exchange(Constant.URL + "getBillHeaderPOSOnlyRegBills",
						HttpMethod.POST, new HttpEntity<>(map), typeRef);
				
				billHeadeResponse = responseEntity.getBody();	

				billHeader = billHeadeResponse.getGetBillHeaders();
				modelAndView.addObject("fromDate", dateFormat.format(date));
				modelAndView.addObject("toDate", dateFormat.format(date));
				
				
				modelAndView.addObject("billHeader",billHeader);
		}
		catch(Exception e)
		{
			System.out.println("Exception in showBill"+e.getMessage());
		}
		return modelAndView;

	}
	
	
	@RequestMapping(value = "/showBillProcess", method = RequestMethod.GET)
	public ModelAndView   showBillProcess(HttpServletRequest request,
			HttpServletResponse response) {
		
		System.out.println("inside show bill process");

		
		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		
		
		List<GetBillHeader> billHeader=new ArrayList<GetBillHeader>();
		
		
		ModelAndView modelAndView = new ModelAndView("billing/showBill");
		
		try {
		
		RestTemplate restTemplate = new RestTemplate();
		
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		
		String fromDate= request.getParameter("from_datepicker");
		
		String toDate= request.getParameter("to_datepicker");
		
		modelAndView.addObject("fromDate",fromDate);
		modelAndView.addObject("toDate",toDate);
		
		int frId=frDetails.getFrId();
		
		
		map.add("fromDate", fromDate);
		
		map.add("toDate", toDate);
		
		map.add("frId", frId);
		map.add("typeIdList", -1);
		
		ParameterizedTypeReference<GetBillHeaderResponse> typeRef = new ParameterizedTypeReference<GetBillHeaderResponse>() {
		};
		ResponseEntity<GetBillHeaderResponse> responseEntity = restTemplate.exchange(Constant.URL + "getBillHeaderPOSOnlyRegBills",
				HttpMethod.POST, new HttpEntity<>(map), typeRef);
		
		billHeadeResponse = responseEntity.getBody();	

		billHeader = billHeadeResponse.getGetBillHeaders();
		System.out.println("billHeader"+billHeader.toString());
		modelAndView.addObject("billHeader",billHeader);
		
		}catch (Exception e) {
			
			System.out.println("ex in getting bills "+e.getMessage());
			e.printStackTrace();
		}
		return modelAndView;
	
	}
	
	
	@RequestMapping(value = "/showBillDetailProcess", method = RequestMethod.GET)
	public ModelAndView   showBillDetailProcess(HttpServletRequest request,
			HttpServletResponse response) {
		
		ModelAndView modelAndView = new ModelAndView("billing/billDetails");
		
		try {
			
		String billNo=request.getParameter("billNo");
		String billDate=request.getParameter("billDate");
		String billStatus=request.getParameter("billStatus");
		String grandTotal=request.getParameter("grandTotal");
		
		String invNo=request.getParameter("Inv");
		System.out.println("billNo: "+billNo +"  Date : "+billDate +"  billStatus :"+billStatus);
		
		RestTemplate restTemplate = new RestTemplate();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		
		map.add("billNo", billNo);

		GetBillDetailsResponse billDetailsResponse = restTemplate.postForObject(Constant.URL + "getBillDetails",
				map, GetBillDetailsResponse.class);

		billDetailsList = new ArrayList<GetBillDetail>();
		billDetailsList = billDetailsResponse.getGetBillDetails();
		
		modelAndView.addObject("billDetailsList",billDetailsList);
		
		modelAndView.addObject("billDate", billDate);
		modelAndView.addObject("billNo", billNo);
		modelAndView.addObject("billStatus", billStatus);
		modelAndView.addObject("grandTotal", grandTotal);
		
		modelAndView.addObject("invoiceNo", invNo);
		
		}catch (Exception e) {
		System.out.println("ex in bill detail "+e.getMessage());
		e.printStackTrace();
		}
		
		
		
	return modelAndView;
	
}
	
	
	
	@RequestMapping(value = "/updateBillStatus", method = RequestMethod.GET)
	public @ResponseBody void updateBillStatus(HttpServletRequest request,
		HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		
		String billNo=request.getParameter("billNo");
		System.out.println("Bill No : "+ billNo);
		
		
		
		 System.out.println("Headerdgdgdfg List "+billHeadeResponse.getGetBillHeaders().toString());
		
		try {
			GetBillHeader getBillHeader=new GetBillHeader();
			 List<GetBillHeader> getBillHeaders=billHeadeResponse.getGetBillHeaders();
			 
			 System.out.println("Header List "+getBillHeaders.toString());
		for(int i=0;i<billHeadeResponse.getGetBillHeaders().size();i++)
		{
			if(billHeadeResponse.getGetBillHeaders().get(i).getBillNo()==Integer.parseInt(billNo))
			{
				System.out.println("first date :"+ billHeadeResponse.getGetBillHeaders().get(i).getBillDate());
				
				
				
				getBillHeader=billHeadeResponse.getGetBillHeaders().get(i);
				//postBillHeader.setBillDate(date);
				
				
							}
		}
		
		getBillHeader.setStatus(2);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("kk:mm:ss ");
		TimeZone istTimeZone = TimeZone.getTimeZone("Asia/Kolkata");
		
		Date d = new Date();
		sdf.setTimeZone(istTimeZone);
		
		String strtime = sdf.format(d);
		
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		System.out.println("************* Date Time " + dateFormat.format(cal.getTime()));
		
		getBillHeader.setBillDateTime(dateFormat.format(cal.getTime()));
		getBillHeader.setTime(strtime);
		RestTemplate restTemplate = new RestTemplate();
		try {
			
		Info info = restTemplate.postForObject(Constant.URL + "updateBillStatus", getBillHeader,
					Info.class);

			System.out.println("Message :   "+info.getMessage());
			System.out.println("Error  :    "+info.getError());
			if(info.getError()==false) {
			System.out.println("Bill Received--------------------"+getBillHeader);
			
			try {
				String url = Constant.ReportURL + "pdf/showBillPdf/By-Road/0/"+billNo;
				doConversion(url, Constant.REPORT_SAVE);
				
				final String emailSMTPserver = "smtp.gmail.com";
				final String emailSMTPPort = "587";
				final String mailStoreType = "imaps";
				
				final String username ="madhvierp@gmail.com";
				final String password ="madhvi@#2020";				
				String mailsubject ="Delivery Challan";
				System.out.println("username : " + username);
				System.out.println("password : " + password);

				Properties props = new Properties();
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.socketFactory.port", "465");
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.port", "587");
				props.put("mail.smtp.starttls.enable", "true");

				Session sess = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				});

				try {
					Store mailStore = sess.getStore(mailStoreType);
					mailStore.connect(emailSMTPserver, username, password);
					
					Message mimeMessage = new MimeMessage(sess);
					mimeMessage.setFrom(new InternetAddress(username));
					mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(frDetails.getFrEmail()));
					mimeMessage.setSubject(mailsubject);
					mimeMessage.setFileName("Bill Print");
					BodyPart mbodypart = new MimeBodyPart();
					Multipart multipart = new MimeMultipart();
					DataSource source = new FileDataSource(Constant.REPORT_SAVE);
					mbodypart.setDataHandler(new DataHandler(source));
					mbodypart.setFileName(new File(Constant.REPORT_SAVE).getName());
					// mbodypart.setFileName(Constants.REPORT_SAVE);
					multipart.addBodyPart(mbodypart);
					mimeMessage.setContent(multipart);

					MimeBodyPart messageBodyPart = new MimeBodyPart();
					messageBodyPart = new MimeBodyPart();
					StringBuilder sb = new StringBuilder();

					sb.append("<html><body>");
					sb.append("<br><p>Outlet Code:"+getBillHeader.getFrCode()+" Bill Date: "+getBillHeader.getBillDate()+" Bill Amt: "+getBillHeader.getGrandTotal()+"</p><br>"); 
					sb.append("</body></html>");
					messageBodyPart.setContent(""+sb,"text/html; charset=utf-8");
					multipart.addBodyPart(messageBodyPart);
					mimeMessage.setContent(multipart);

					Transport.send(mimeMessage);
				}catch (Exception e) {
					System.err.println("Ex in Receive Bill1: "+e.getMessage());
					e.printStackTrace();
				}	
			}catch (Exception e) {
				System.err.println("Ex in Receive Bill2: "+e.getMessage());
				e.printStackTrace();
			}
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			
			map = new LinkedMultiValueMap<String, Object>();

			map.add("frId", frDetails.getFrId());

			SellBillDataCommon sellBillResponse = restTemplate
					.postForObject(Constant.URL + "/showNotDayClosedRecord", map, SellBillDataCommon.class);

			if (!sellBillResponse.getSellBillHeaderList().isEmpty()) {

				List<SellBillHeader> sellBillHeaderList = sellBillResponse.getSellBillHeaderList();

				int count = sellBillHeaderList.size();
				SellBillHeader billHeader = sellBillResponse.getSellBillHeaderList().get(0);

				map = new LinkedMultiValueMap<String, Object>();

				map.add("billNo", billHeader.getSellBillNo());

				SellBillDetailList sellBillDetailList = restTemplate
						.postForObject(Constant.URL + "/getSellBillDetails", map, SellBillDetailList.class);

				List<SellBillDetail> sellBillDetails = sellBillDetailList.getSellBillDetailList();
				if (sellBillDetails.size() > 0) {

					for (int x = 0; x < sellBillDetails.size(); x++) {

						billHeader
								.setTaxableAmt(billHeader.getTaxableAmt() + sellBillDetails.get(x).getTaxableAmt());

						billHeader.setTotalTax(billHeader.getTotalTax() + sellBillDetails.get(x).getTotalTax());
						billHeader
								.setGrandTotal(sellBillDetails.get(x).getGrandTotal() + billHeader.getGrandTotal());

						// billHeader.setBillDate(billHeader.getBillDate());

						billHeader.setDiscountPer(billHeader.getDiscountPer());

					}
					billHeader.setGrandTotal(Math.round(billHeader.getGrandTotal()));
					billHeader.setPaidAmt(billHeader.getGrandTotal());
					billHeader.setPayableAmt(billHeader.getGrandTotal());

					System.err.println("bill Header data for Day close " +billHeader.toString());

					String start_dt =billHeader.getBillDate();
					DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy"); 
					Date date = (Date)formatter.parse(start_dt);
				
					SimpleDateFormat newFormat = new SimpleDateFormat("yyyy-MM-dd");
					String finalString = newFormat.format(date);
					billHeader.setBillDate(finalString);

						billHeader = restTemplate.postForObject(Constant.URL + "saveSellBillHeader", billHeader,
								SellBillHeader.class);

						System.out.println("Bill Header Response " + billHeader.toString());
					
				} else {

					// update time
				String	curDateTime = dateFormat.format(cal.getTime());

					map = new LinkedMultiValueMap<String, Object>();

					DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Calendar cal2 = Calendar.getInstance();

					map.add("sellBillNo", billHeader.getSellBillNo());

					java.util.Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(curDateTime);

					Calendar caleInstance = Calendar.getInstance();

					caleInstance.setTime(date);
						caleInstance.set(Calendar.SECOND, (caleInstance.get(Calendar.SECOND) + 5));
						
						String incTime=dateFormat2.format(caleInstance.getTime());

					System.out.println("*****Calender Gettime == " + caleInstance.getTime());

					System.out.println("*****Inc time Gettime == " + incTime);

					map.add("timeStamp", incTime);

					Info updateSellBillTimeStamp = restTemplate.postForObject(Constant.URL + "updateSellBillTimeStamp", map,
							Info.class);

				}

			}
			}
	
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}catch (Exception e) {
		System.out.println("ex in update bill "+e.getMessage());
		e.printStackTrace();
	}
		
	}
	
	public void doConversion(String url, String outputPath)
			throws InvalidParameterException, MalformedURLException, IOException {
		File output = new File(outputPath);
		java.io.FileOutputStream fos = new java.io.FileOutputStream(output);

		PD4ML pd4ml = new PD4ML();

		try {

			PD4PageMark footer = new PD4PageMark();
			footer.setPageNumberTemplate("page $[page] of $[total]");
			footer.setTitleAlignment(PD4PageMark.LEFT_ALIGN);
			footer.setPageNumberAlignment(PD4PageMark.RIGHT_ALIGN);
			footer.setInitialPageNumber(1);
			footer.setFontSize(8);
			footer.setAreaHeight(15);

			pd4ml.setPageFooter(footer);

		} catch (Exception e) {
			System.out.println("Pdf conversion method excep " + e.getMessage());
		}
		try {
			pd4ml.setPageSize(landscapeValue ? pd4ml.changePageOrientation(format) : format);
		} catch (Exception e) {
			System.out.println("Pdf conversion ethod excep " + e.getMessage());
		}

		if (unitsValue.equals("mm")) {
			pd4ml.setPageInsetsMM(new Insets(topValue, leftValue, bottomValue, rightValue));
		} else {
			pd4ml.setPageInsets(new Insets(topValue, leftValue, bottomValue, rightValue));
		}

		pd4ml.setHtmlWidth(userSpaceWidth);

		pd4ml.render(new URL(url), fos);
		fos.close();

		System.out.println(outputPath + "\ndone.");
	}
	
	@RequestMapping(value = "pdf/showBillPdf/{transportMode}/{vehicleNo}/{selectedBills}", method = RequestMethod.GET)
	public ModelAndView showBillPdf(@PathVariable String transportMode, @PathVariable String vehicleNo,
			@PathVariable String[] selectedBills, HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("IN Show bill PDF Method :/showBillPdf");
		ModelAndView model = new ModelAndView("billing/frBillPdf");
	//	System.err.println("Inside new form action "+411);
		List<FrBillPrint> billPrintList = new ArrayList<>();

		try {
			RestTemplate restTemplate = new RestTemplate();
			String billList = new String();

			for (int i = 0; i < selectedBills.length; i++) {
				billList = selectedBills[i] + "," + billList;
			}

			billList = billList.substring(0, billList.length() - 1);

			//System.out.println("selected bills for Printing " + billList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("billNoList", billList);

			ParameterizedTypeReference<List<GetBillDetailPrint>> typeRef = new ParameterizedTypeReference<List<GetBillDetailPrint>>() {
			};
			ResponseEntity<List<GetBillDetailPrint>> responseEntity = restTemplate.exchange(
					Constant.URL + "getBillDetailsForPrint", HttpMethod.POST, new HttpEntity<>(map), typeRef);

			List<GetBillDetailPrint> billDetailsResponse = responseEntity.getBody();
			
			System.err.println("BILL DETAIL ----------------------- "+billDetailsResponse);

			List<String> billnos = Arrays.asList(billList.split("\\s*,\\s*"));
			List<SlabwiseBillList> slabwiseBillList = new ArrayList<>();

			for (String billno : billnos) {
				map = new LinkedMultiValueMap<String, Object>();

				map.add("billNoList", billno);
				ParameterizedTypeReference<List<SlabwiseBillList>> typeRef1 = new ParameterizedTypeReference<List<SlabwiseBillList>>() {
				};
				ResponseEntity<List<SlabwiseBillList>> responseEntity1 = restTemplate.exchange(
						Constant.URL + "getSlabwiseBillData", HttpMethod.POST, new HttpEntity<>(map), typeRef1);

				slabwiseBillList.addAll(responseEntity1.getBody());
			}
			System.out.println("slabwiseBillList" + slabwiseBillList.toString());
			List<FrBillHeaderForPrint> billHeadersListForPrint = new ArrayList<>();

			System.out.println("selected bills for Printing " + billList);
			System.out.println("Size Here Now  " + billHeadersListForPrint.size());

			map = new LinkedMultiValueMap<String, Object>();

			map.add("billNoList", billList);

			ParameterizedTypeReference<List<FrBillHeaderForPrint>> typeRef2 = new ParameterizedTypeReference<List<FrBillHeaderForPrint>>() {
			};
			ResponseEntity<List<FrBillHeaderForPrint>> responseEntity2 = restTemplate.exchange(
					Constant.URL + "getFrBillHeaderForPrintSelectedBill", HttpMethod.POST, new HttpEntity<>(map),
					typeRef2);
			billHeadersListForPrint = new ArrayList<>();
			billHeadersListForPrint = responseEntity2.getBody();

			//System.out.println("in new BHLFP" + billHeadersListForPrint.toString());
						CategoryListResponse categoryListResponse = restTemplate.getForObject(Constant.URL + "showAllCategory",
					CategoryListResponse.class);
			List<MCategoryList> categoryList;
			categoryList = categoryListResponse.getmCategoryList();
			System.err.println("in categoryList" + categoryList.toString());
			
			
			SubCategory[] subCatList = restTemplate.getForObject(Constant.URL + "getAllSubCatList",
					SubCategory[].class);

			ArrayList<SubCategory> subCatAList = new ArrayList<SubCategory>(Arrays.asList(subCatList));
		 

			System.err.println("subCatAList:" + subCatAList.toString());
		
			List<GetBillDetailPrint> billDetailsListForPrint= new ArrayList<GetBillDetailPrint>();
			billDetailsListForPrint = billDetailsResponse;
			System.out.println("Size Here Now  " + billHeadersListForPrint.size());

			FrBillPrint billPrint = null;
			for (int i = 0; i < billHeadersListForPrint.size(); i++) {
				billPrint = new FrBillPrint();
				List<GetBillDetailPrint> billDetails = new ArrayList<>();

				List<SubCategory> filteredSubCat = new ArrayList<SubCategory>();
				for (int j = 0; j < billDetailsListForPrint.size(); j++) {

					if (billHeadersListForPrint.get(i).getBillNo().equals(billDetailsListForPrint.get(j).getBillNo())) {

						System.out.println("Inside If  Bill no  = " + billHeadersListForPrint.get(i).getBillNo());
						billPrint.setAmtInWords(Currency.convertToIndianCurrency(
								String.valueOf(billHeadersListForPrint.get(i).getGrandTotal())));
						billPrint.setBillNo(billHeadersListForPrint.get(i).getBillNo());
						billPrint.setFrAddress(billHeadersListForPrint.get(i).getFrAddress());
						billPrint.setFrId(billHeadersListForPrint.get(i).getFrId());
						billPrint.setFrName(billHeadersListForPrint.get(i).getFrName());
						billPrint.setInvoiceNo(billHeadersListForPrint.get(i).getInvoiceNo());
						billPrint.setIsSameState(billHeadersListForPrint.get(i).getIsSameState());
						billPrint.setBillDate(billHeadersListForPrint.get(i).getBillDate());
						billPrint.setGrandTotal(billHeadersListForPrint.get(i).getGrandTotal());
						billPrint.setPartyName(billHeadersListForPrint.get(i).getPartyName());//new
						billPrint.setPartyAddress(billHeadersListForPrint.get(i).getPartyAddress());//new
						billPrint.setPartyGstin(billHeadersListForPrint.get(i).getPartyGstin());//new
						
						billPrint.setBillTime(billHeadersListForPrint.get(i).getBillTime());// new on 2july
						billPrint.setVehNo(billHeadersListForPrint.get(i).getVehNo());// new on 2july
						billPrint.setExVarchar1(billHeadersListForPrint.get(i).getExVarchar1());// new on 2july
						billPrint.setExVarchar2(billHeadersListForPrint.get(i).getExVarchar2());// new on 2july
						
						billPrint.setEwayBillNo(billHeadersListForPrint.get(i).getEwayBillNo());
						
						billPrint.setExVarchar3(billHeadersListForPrint.get(i).getExVarchar3());
						billPrint.setExVarchar4(billHeadersListForPrint.get(i).getExVarchar4());
						billPrint.setExVarchar5(billHeadersListForPrint.get(i).getExVarchar5());
						
						billPrint.setIsDairyMart(billHeadersListForPrint.get(i).getIsDairyMart());
						
						billPrint.setCompany(billHeadersListForPrint.get(i).getCompany());
						billDetails.add(billDetailsListForPrint.get(j));

						for (int a = 0; a < subCatAList.size(); a++) {

							for (int b = 0; b < billDetails.size(); b++) {

								
								if (billDetails.get(b).getSubCatId()==subCatAList.get(a).getSubCatId()) {

									if (filteredSubCat.isEmpty())
										filteredSubCat.add(subCatAList.get(a));
									else if (!filteredSubCat.contains(subCatAList.get(a))) {
										filteredSubCat.add(subCatAList.get(a));
									}
								}

							}

						}


					} // end of if

				}
				billPrint.setBillDetailsList(billDetails);
				// billPrintList=new ArrayList<>();
				billPrint.setSubCatList(filteredSubCat);
				if (billPrint != null)
					billPrintList.add(billPrint);
				
				model.addObject("isDairy",billHeadersListForPrint.get(i).getIsDairyMart());
				model.addObject("isOwnFr",billHeadersListForPrint.get(i).getExVarchar2());

			}
			System.err.println("sub Cat List  " +billPrint.getSubCatList().toString());
			System.out.println(" after adding detail List : bill Print List " + billPrintList.toString());

			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			Calendar cal = Calendar.getInstance();

			//System.out.println("time in Gen Bill PDF ==" + dateFormat.format(cal.getTime()));
			model.addObject("billDetails", billPrintList);
			model.addObject("slabwiseBillList", slabwiseBillList);
			model.addObject("vehicleNo", vehicleNo);
			model.addObject("transportMode", transportMode);
			model.addObject("dateTime", dateFormat.format(cal.getTime()));


		} catch (Exception e) {

			System.out.println("Ex in getting bill Data for PDF " + e.getMessage());
			e.printStackTrace();
		}
		return model;

	}
	private Dimension format = PD4Constants.A4;
	private boolean landscapeValue = false;
	private int topValue = 8;
	private int leftValue = 0;
	private int rightValue = 0;
	private int bottomValue = 8;
	private String unitsValue = "m";
	private String proxyHost = "";
	private int proxyPort = 0;
	private boolean isTwice=false;

	private int userSpaceWidth = 750;
	private static int BUFFER_SIZE = 1024;
	
	@RequestMapping(value = "/billPdf", method = RequestMethod.GET)
	public void billPdf(HttpServletRequest request, HttpServletResponse response) {

		String url = request.getParameter("url");
		System.out.println("URL " + url);
		// http://monginis.ap-south-1.elasticbeanstalk.com
		   File f = new File(Constant.BILL_REPORT_PATH);
		   //  File f = new File("/home/ats-12/bill.pdf");
		//File f = new File("/Users/MIRACLEINFOTAINMENT/ATS/uplaods/reports/ordermemo221.pdf");

		System.out.println("I am here " + f.toString());
		try {
			isTwice =false;
			runConverter(Constant.ReportURL + url, f, request, response);
			System.out.println("Come on lets get ");
		} catch (IOException e) {
			// TODO Auto-generated catch block

			System.out.println("Pdf conversion exception " + e.getMessage());
		}

		// get absolute path of the application
		ServletContext context = request.getSession().getServletContext();
		String appPath = context.getRealPath("");
		String filename = "ordermemo221.pdf";
		 	String filePath =Constant.BILL_REPORT_PATH;
		 	///	String filePath = "/home/ats-12/bill.pdf";
		//String filePath = "/Users/MIRACLEINFOTAINMENT/ATS/uplaods/reports/ordermemo221.pdf";

		// construct the complete absolute path of the file
		String fullPath = appPath + filePath;
		File downloadFile = new File(filePath);
		FileInputStream inputStream = null;
		try {
			inputStream = new FileInputStream(downloadFile);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			// get MIME type of the file
			String mimeType = context.getMimeType(fullPath);
			if (mimeType == null) {
				// set to binary type if MIME mapping not found
				mimeType = "application/pdf";
			}
			System.out.println("MIME type: " + mimeType);

			String headerKey = "Content-Disposition";

			// response.addHeader("Content-Disposition", "attachment;filename=report.pdf");
			response.setContentType("application/pdf");

			// get output stream of the response
			OutputStream outStream;

			outStream = response.getOutputStream();

			byte[] buffer = new byte[BUFFER_SIZE];
			int bytesRead = -1;

			// write bytes read from the input stream into the output stream

			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}

			inputStream.close();
			outStream.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void runConverter(String urlstring, File output, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		if (urlstring.length() > 0) {
			if (!urlstring.startsWith("http://") && !urlstring.startsWith("file:")) {
				urlstring = "http://" + urlstring;
			}
			System.out.println("PDF URL " + urlstring);
			java.io.FileOutputStream fos = new java.io.FileOutputStream(output);

			PD4ML pd4ml = new PD4ML();
			pd4ml.enableSmartTableBreaks(true);
			try {

				PD4PageMark footer = new PD4PageMark();  
				footer.setPageNumberTemplate("page $[page] of $[total]");  
				//footer.setTitleTemplate("This Is A Computer Generated Invoice Does Not Require Signature");
				footer.setTitleAlignment(PD4PageMark.CENTER_ALIGN);  
				footer.setPageNumberAlignment(PD4PageMark.RIGHT_ALIGN);  
				footer.setInitialPageNumber(1);  
				footer.setFontSize(8);  
				footer.setAreaHeight(15); 
			
				pd4ml.setPageFooter(footer);

			} catch (Exception e) {
				System.out.println("Pdf conversion method excep " + e.getMessage());
			}
			try {
				pd4ml.setPageSize(landscapeValue ? pd4ml.changePageOrientation(format) : format);
			} catch (Exception e) {
				System.out.println("Pdf conversion ethod excep " + e.getMessage());
			}

			if (unitsValue.equals("mm")) {
				pd4ml.setPageInsetsMM(new Insets(topValue, leftValue, bottomValue, rightValue));
			} else {
				pd4ml.setPageInsets(new Insets(topValue, leftValue, bottomValue, rightValue));
			}

			pd4ml.setHtmlWidth(userSpaceWidth);
        	pd4ml.render(urlstring, fos);

		}
	}
}
