package com.kh.bunny.deal.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bunny.deal.model.service.DealService;
import com.kh.bunny.deal.model.vo.Deal;
import com.kh.bunny.member.model.service.MemberService;
import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.product.model.service.ProductService;
import com.kh.bunny.product.model.vo.Product;

@Controller
public class DealController {
	
	@Autowired
	DealService dealService;
	
	@Autowired
	MemberService memberService;
	
	// 상품 거래 목록 가져오기 
	@RequestMapping("deal/dealList.do")
	public String selectDealList(Model model) {
		
		
		
		return "";
	}
	
	// 상품 거래 페이지로 이동하기 
	@RequestMapping("/deal/dealDetail.do")
	public String selectOneDeal(@RequestParam int dno, HttpSession session,
								Model model) {
		
		Member member = (Member)session.getAttribute("member"); // 현재 로그인한 사람의 정보  
		Deal deal = dealService.selectOneDeal(dno);
		Product product = dealService.selectOneProduct(deal.getPno());
		
		String sellerPhoto = (memberService.selectOne(product.getPWriter())).getPhoto();
		
		Member other = new Member();
		
		if ((member.getUserId()).equals(deal.getDsId())) {
			// 로그인 한 회원이 seller(판매자). other가 구매자인 경우 
			other = dealService.selectOtherMember(deal.getDbId());
			
			
		} else if((member.getUserId()).equals(deal.getDbId())) {
			// 로그인 한 회원이 buyer(구매자). other가 판매자인 경우 
			other = dealService.selectOtherMember(deal.getDsId());
			
		} else {
			
			System.out.println("외부 침입자가 deal페이지에 들어오려함. 쫓아내야함.");
			
		}
		
		System.out.println("dealDeatil cont에서 other멤버객체 확인 : " + other);
		System.out.println("dealDeatil cont에서 deal객체 확인 : " + deal);
		System.out.println("dealDeatil cont에서 product객체 확인 : " + product);
		System.out.println("dealDeatil cont에서 member객체 확인 : " + member);
		
		model.addAttribute("deal", deal)
			 .addAttribute("product", product)
			 .addAttribute("other", other)
			 .addAttribute("sellerPhoto", sellerPhoto);
		
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
	@RequestMapping("/deal/dealBuyerChk.do")
	public String dealBuyerChk(@RequestParam int dno, 
							   @RequestParam String dAddress1,
							   @RequestParam String dAddress2,
							   @RequestParam int dMethod,
							   Model model, HttpSession session) {
		System.out.println("dealBuyerChk로 들어옴.");
		
		String dAddress = "";
		
		if(dAddress1.length() == 0 || dAddress2.length() == 0) {
			dAddress = "";
		} else {
			dAddress = dAddress1 + " " + dAddress2;
		}
		
		Deal deal = dealService.selectOneDeal(dno);
		deal.setDbStatus(1);
		deal.setDAddress(dAddress);
		deal.setDMethod(dMethod);
		
		
		Product product = dealService.selectOneProduct(deal.getPno());
		
		System.out.println("deal확인 : " + deal);
		int result = dealService.updateBuyerDeal(deal);
		
		System.out.println("result : " + result);
		String msg = "";
		if (result >0) {
			msg = "구매자 deal 확인 완료.";
			System.out.println("구매자 deal 수정 완료");
		} else {
			msg = "구매자 deal 확인 실패.";
			System.out.println("구매자 deal 수정 실패");
		}
		
		Member other = new Member();
		Member member = (Member)session.getAttribute("member");
		if ((member.getUserId()).equals(deal.getDsId())) {
			// 로그인 한 회원이 seller(판매자). other가 구매자인 경우 
			other = dealService.selectOtherMember(deal.getDbId());
			
			
		} else if((member.getUserId()).equals(deal.getDbId())) {
			// 로그인 한 회원이 buyer(구매자). other가 판매자인 경우 
			other = dealService.selectOtherMember(deal.getDsId());
			
		}
		
		model.addAttribute("msg", msg)
			 .addAttribute("deal", deal)
			 .addAttribute("product", product)
			 .addAttribute("other", other);
		
		return "deal/dealBuyerCheck";
	}
	
	
	// 판매자 거래 생성 
	@RequestMapping("/deal/dealSellerChk.do")
	public String dealSellerChk(@RequestParam int dno, 
							    @RequestParam String delNum1,
							    @RequestParam String delNum2,
							    Model model, HttpSession session) {
		System.out.println("dealSellerChk로 들어옴.");
		System.out.println("dno : " + dno);
		System.out.println("delNum1 : " + delNum1);
		System.out.println("delNum2 : " + delNum2);
		
		
		Deal deal = dealService.selectOneDeal(dno);
		deal.setDsStatus(1);
		deal.setDDelNum(delNum1 + " : " + delNum2);
		
		Product product = dealService.selectOneProduct(deal.getPno());
		
		int result = dealService.updateSellerDeal(deal);
		
		String msg = "";
		if (result >0) {
			msg = "구매자 deal 확인 완료.";
			System.out.println("구매자 deal 수정 완료");
		} else {
			msg = "구매자 deal 확인 실패.";
			System.out.println("구매자 deal 수정 실패");
		}
		
		Member other = new Member();
		Member member = (Member)session.getAttribute("member");
		if ((member.getUserId()).equals(deal.getDsId())) {
			// 로그인 한 회원이 seller(판매자). other가 구매자인 경우 
			other = dealService.selectOtherMember(deal.getDbId());
			
			
		} else if((member.getUserId()).equals(deal.getDbId())) {
			// 로그인 한 회원이 buyer(구매자). other가 판매자인 경우 
			other = dealService.selectOtherMember(deal.getDsId());
			
		}
		
		model.addAttribute("msg", msg)
		     .addAttribute("deal", deal)
		     .addAttribute("product", product)
		     .addAttribute("other", other);
		
		return "deal/dealSellerCheck";
		
	}

}























