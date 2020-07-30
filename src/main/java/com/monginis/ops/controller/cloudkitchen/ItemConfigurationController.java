package com.monginis.ops.controller.cloudkitchen;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.monginis.ops.constant.Constant;
import com.monginis.ops.model.Franchisee;
import com.monginis.ops.model.Info;
import com.monginis.ops.model.cloudkitchen.GetItemsForConfig;
import com.monginis.ops.model.cloudkitchen.ItemConfigDetail;

@Controller
@Scope("session")
public class ItemConfigurationController {

	RestTemplate restTemplate = new RestTemplate();

	@RequestMapping(value = "/showItemConfig")
	public ModelAndView showItemConfig(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView("itemConfig/itemConfig");

		return mav;

	}

	List<GetItemsForConfig> itemConfigList = new ArrayList<>();

	@RequestMapping(value = "/getItemListForConfiguration", method = RequestMethod.GET)
	public @ResponseBody List<GetItemsForConfig> getItemListForConfiguration(HttpServletRequest request,
			HttpServletResponse response) {

		itemConfigList = new ArrayList<>();

		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		int frId = frDetails.getFrId();
		int configType = Integer.parseInt(request.getParameter("configType"));

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
		map.add("frId", frId);
		map.add("configType", configType);

		System.err.println("FR = " + frId);
		System.err.println("TYPE = " + configType);

		GetItemsForConfig[] itemArr = restTemplate.postForObject(Constant.URL + "getItemsForConfigByFrId", map,
				GetItemsForConfig[].class);
		itemConfigList = new ArrayList<GetItemsForConfig>(Arrays.asList(itemArr));

		return itemConfigList;
	}

	@RequestMapping(value = "/saveItemConfiguration", method = RequestMethod.POST)
	public String saveItemConfiguration(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			System.err.println("saveItemConfiguration--- ");

			if (itemConfigList != null) {

				List<ItemConfigDetail> detailList = new ArrayList<>();

				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				String dateTime = dateFormat.format(cal.getTime());

				for (int i = 0; i < itemConfigList.size(); i++) {

					if (itemConfigList.get(i).getChecked() == 1) {

						int status = Integer
								.parseInt(request.getParameter("status" + itemConfigList.get(i).getItemId()));

						float cgst = itemConfigList.get(i).getTax1();
						System.err.println("PREV CGST = " + cgst);
						if (request.getParameter("cgst" + itemConfigList.get(i).getItemId()) != null) {
							cgst = Float.parseFloat(request.getParameter("cgst" + itemConfigList.get(i).getItemId()));
						}
						System.err.println("NEXT CGST = " + cgst);

						float sgst = itemConfigList.get(i).getTax2();
						if (request.getParameter("sgst" + itemConfigList.get(i).getItemId()) != null) {
							sgst = Float.parseFloat(request.getParameter("sgst" + itemConfigList.get(i).getItemId()));
						}

						String hsncd = itemConfigList.get(i).getHsncd();
						if (request.getParameter("hsncd" + itemConfigList.get(i).getItemId()) != null) {
							hsncd = request.getParameter("hsncd" + itemConfigList.get(i).getItemId());
						}

						ItemConfigDetail detail = new ItemConfigDetail(itemConfigList.get(i).getItemConfigDetailId(),
								itemConfigList.get(i).getItemConfigId(), itemConfigList.get(i).getItemId(),
								itemConfigList.get(i).getRateAmt(), itemConfigList.get(i).getMrpAmt(),
								itemConfigList.get(i).getSpRateAmt(), cgst, sgst, itemConfigList.get(i).getTax3(),
								hsncd, status, dateTime, dateTime, 0, 0, 0, 0, 0, 0, "", "", "", "", 0, 0, 0, 0);
						detailList.add(detail);

					}

				}

				Info info = restTemplate.postForObject(Constant.URL + "saveItemConfigurationDetails", detailList,
						Info.class);
				System.err.println("RESULT = " + info);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showItemConfig";
	}

}
