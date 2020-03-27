package com.liu.graduation.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.liu.graduation.entities.Product;
import com.liu.graduation.service.AdminService;
import com.liu.graduation.service.ProductService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@Resource(name="productService")
	ProductService productService;
	
	@RequestMapping("/into")
	public String adminInto()
	{
		return "suplogin";
	}
	@RequestMapping("/login")
	public String loginadmin(@RequestParam("rootId") String name,@RequestParam("password") String password,Model model)
	{
		System.out.println(name+"\t"+password);
		if(adminService.queryAdmin(name, password)==1)
		{
			searchAction(model);
			
			return "Product/productlist";
			
		}
			
		else
			return "suplogin";
	}
	
	@RequestMapping("/findlist")
	public String findProductList()
	{
		return "AdministratorResult";
	}
	
	@RequestMapping("/add")
	public String addProduct(Model model)
	{
		model.addAttribute("attrs", productService.findAttrList());
		return "Product/addProduct";
	}
	
	@RequestMapping("/modify")
	public String modifyProduct()
	{
		return "AdministratorUpdate";
	}
	
	@RequestMapping("/remove")
	public String removeProduct()
	{
		return "AdministratorDelete";
	}
	@RequestMapping("/test/{way}")
	public String test(@PathVariable("way") String way)
	{
		
		return way;
	}
	
	@RequestMapping(value = "/search/{page}")
	public String searchPageAction(@Valid Product product, @PathVariable("page") int page, Model model) {

		model.addAttribute("curPage",page);
		 productService.findProductList(product,model, page);
		 return "Product/productlist";
		/*
		// サービスの実行結果から在庫情報エンティティリストを取得
		List<GroupOneStockInfoEntity> stockList = (List<GroupOneStockInfoEntity>) serviceResult
				.getAttribute("stocks");

		// 検索条件に合致する在庫情報が0件の場合はメッセージを指定
		if (stockList.size() == 0) {
			// i18n error messages
			String errorMessage = messages.getMessage("I00004");
			LOGGER.debug(errorMessage);
			uiModel.addAttribute("message", errorMessage);
		}
		uiModel.addAttribute("stocks", stockList);

		// サービスの実行結果からPaginationリストを取得
		List<Pagination> pageList = (List<Pagination>) serviceResult
				.getAttribute("pages");
		uiModel.addAttribute("pages", pageList);
		uiModel.addAttribute("curPage", page);

		// ページ総数を設定
		if (pageList != null && pageList.size() > 0) {
			uiModel.addAttribute("pageCnt", pageList.get(pageList.size() - 1)
					.getIndex());
		}
		return "group1/grouponestockList";*/
	}

	/**
	 * search action
	 * 
	 * @author dongsheng.liu
	 * @param detailForm
	 * @param result
	 * @param uiModel
	 * @return jsp location
	 */
	@RequestMapping(value = "/search")
	public String searchAction(Model model) {
		Product product=new Product();
		product.setAddtime(null);
		productService.findProductList(product,model, 1);
		model.addAttribute("curPage","1");
		model.addAttribute("key","");
		return "Product/productlist";
	}
	
	
	
}
