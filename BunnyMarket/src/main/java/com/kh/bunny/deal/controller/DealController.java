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

@Controller
public class DealController {
	
	@Autowired
	DealService dealService;
	
	// 상품 거래 목록 가져오기 
	
	// 상품 거래 가져오기 
	@RequestMapping("/deal/dealDetail.do")
	public String selectOneDeal(@RequestParam int dno, HttpSession session,
								Model model) {
		
		Member m = (Member)session.getAttribute("member");
		
		Deal deal = dealService.selectOneDeal(dno);
		
		System.out.println("dealDeatil cont에서 deal객체 확인 : " + deal);
		
		model.addAttribute("deal", deal);
		
		String loc = "";
		
		if ((m.getUserId()).equals(deal.getDsId())) {
			// 로그인 한 회원의 아이디가 deal의 seller(판매자)와 같은 경우
			loc = "deal/dealSeller";
			
		} else if((m.getUserId()).equals(deal.getDbId())) {
			// 로그인 한 회원의 아이디가 deal의 buyer(구매자)와 같은 경우 
			loc = "deal/dealBuyer";
		}
		
		return loc;
	}
	
	
	
	
	// 구매자 거래 생성 
	
	
	
	
	
	// 판매자 거래 생성 
	

}























