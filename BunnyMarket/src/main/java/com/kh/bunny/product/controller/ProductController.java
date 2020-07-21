package com.kh.bunny.product.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bunny.product.model.service.ProductService;
import com.kh.bunny.common.util.Utils;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService; 
	
	@RequestMapping("/product/productList.do")
	public String selectBoardList(
			@RequestParam(value = "pPage", required = false, defaultValue = "1")
			int pPage, Model model) {
		
		int numPerPage = 9; // 한 페이지에 9개의 게시글씩 나오도록 
		
		List<Map<String, String>> list = productService.selectProductList(pPage, numPerPage);
		
		System.out.println("productController에서 list를 가져오나 확인 : " + list);
		// Product list는 잘 가져오는 것 확인 완료 
		
		// 페이지 계산을 위한 총 페이지 개수 
		int totalContents = productService.selectProductTotalContents();
		
		// 페이지 HTML 생성 
		String pageBar = Utils.getPageBar(totalContents, pPage, numPerPage, "productList.do");
		
		model.addAttribute("list", list)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numberPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		return "product/productList";
		
		
	}
	
	// 상품 상세보기 
//	@RequestMapping("/product/productDetail.do")
//	public String selectOne(@RequestParam int no, Model model) {
//		Product p = 
//		
//		
//		return "product/productDetail";
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
