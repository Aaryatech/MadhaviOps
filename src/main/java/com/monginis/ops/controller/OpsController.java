package com.monginis.ops.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.monginis.ops.constant.Constant;
import com.monginis.ops.model.AddCustemerResponse;
import com.monginis.ops.model.CategoryList;
import com.monginis.ops.model.Customer;
import com.monginis.ops.model.FrMenu;
import com.monginis.ops.model.Franchisee;
import com.monginis.ops.model.Info;
import com.monginis.ops.model.Item;
import com.monginis.ops.model.ItemResponse;
import com.monginis.ops.model.SubCategory;
import com.monginis.ops.model.newpos.ItemListForCustomerBill;

@Controller
@Scope("session")
public class OpsController {

	RestTemplate restTemplate = new RestTemplate();
	List<ItemListForCustomerBill> itemBillList = new ArrayList<>();

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

	@RequestMapping(value = "/newcustomerbill", method = RequestMethod.GET)
	public String newcustomerbill(HttpServletRequest request, HttpServletResponse response, Model model) {

		
		String mav = "customerBill/newcustomerbill";
		HttpSession session = request.getSession();
		Franchisee frDetails = (Franchisee) session.getAttribute("frDetails");
		try {
			
			itemBillList = new ArrayList<>();
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
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

			SubCategory[] subCatList = restTemplate.getForObject(Constant.URL + "getAllSubCatList",
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
			String itemNameHidden =request.getParameter("itemNameHidden");
			
			/*MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("id", itemId); 
			Item item = restTemplate.postForObject(Constant.URL + "getItem", map, Item.class);*/
			
			ItemListForCustomerBill add = new ItemListForCustomerBill();
			add.setItemId(itemId);
			add.setItemName(itemNameHidden);
			add.setOrignalMrp(orignalrate);
			add.setTotal(total);
			add.setQty(qty);
			add.setTaxPer(taxperHidden); 
			Float taxableAmt = (total * 100) / (100 + add.getTaxPer());
			add.setTaxableAmt(taxableAmt);
			add.setTaxAmt(total-taxableAmt); 
			//System.out.println(add);
			itemBillList.add(add);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return itemBillList;
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
	public List<ItemListForCustomerBill> deleteItemInBillList(HttpServletRequest request, HttpServletResponse responsel) {

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
}
