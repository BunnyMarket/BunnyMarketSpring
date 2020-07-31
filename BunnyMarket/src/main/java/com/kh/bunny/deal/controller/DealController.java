package com.kh.bunny.deal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bunny.deal.model.service.DealService;
import com.kh.bunny.deal.model.vo.Deal;
import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.product.model.service.ProductService;
import com.kh.bunny.product.model.vo.Product;

@Controller
public class DealController {
	
	@Autowired
	DealService dealService;
	
	// 상품 거래 목록 가져오기 
	
	
	
	
	
	
	
	
	// 상품 거래 페이지로 이동하기 
	@RequestMapping("/deal/dealDetail.do")
	public String selectOneDeal(@RequestParam int dno, HttpSession session,
								Model model) {
		
		Member member = (Member)session.getAttribute("member"); // 현재 로그인한 사람의 정보  
		Deal deal = dealService.selectOneDeal(dno);
		Product product = dealService.selectOneProduct(deal.getPno());
		
		Member other = new Member();
		
		if ((member.getUserId()).equals(deal.getDsId())) {
			// 로그인 한 회원이 seller(판매자). other가 구매자인 경우 
			other = dealService.selectOtherMember(deal.getDbId());
			
			
		} else if((member.getUserId()).equals(deal.getDbId())) {
			// 로그인 한 회원이 buyer(구매자). other가 판매자인 경우 
			other = dealService.selectOtherMember(deal.getDsId());
		}
		
		System.out.println("dealDeatil cont에서 other멤버객체 확인 : " + other);
		System.out.println("dealDeatil cont에서 deal객체 확인 : " + deal);
		System.out.println("dealDeatil cont에서 product객체 확인 : " + product);
		System.out.println("dealDeatil cont에서 member객체 확인 : " + member);
		
		model.addAttribute("deal", deal)
			 .addAttribute("product", product)
			 .addAttribute("member", member)
			 .addAttribute("other", other);
		
		String loc = "";
		
		if ((member.getUserId()).equals(deal.getDsId())) {
			// 로그인 한 회원의 아이디가 deal의 seller(판매자)와 같은 경우
			System.out.println("내가 판매자다!!");
			loc = "deal/dealSeller";
			
		} else if((member.getUserId()).equals(deal.getDbId())) {
			// 로그인 한 회원의 아이디가 deal의 buyer(구매자)와 같은 경우 
			System.out.println("내가 구매자다!!");
			loc = "deal/dealBuyer";
		}
		
		return loc;
	}
	
	
	
	
	// 구매자 거래 생성 
	
	
	
	
	
	// 판매자 거래 생성 
	

}























