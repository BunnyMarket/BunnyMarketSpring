
package com.kh.bunny.review.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.bunny.member.model.exception.MemberException;
import com.kh.bunny.member.model.service.MemberService;
import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.review.model.service.ReviewService;
import com.kh.bunny.review.model.vo.Review;

@SessionAttributes(value = {"review"})
@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	@Autowired
	MemberService memberService;

	
	@RequestMapping("/review/reviewInsert.do")
	public String reviewInsert(@RequestParam String userId, Model model, Review review
			, HttpSession session) {
		int result;
		String nickName = userId;
		 Member m = memberService.findSeller2(nickName);
		 
		 review.setSellerid(m.getNickName());
		 
		 Member reviewM = (Member)session.getAttribute("member");
		 review.setRewriter(reviewM.getNickName());
		
		 
		 String loc = "/review/sellerReview.do?userId="+m.getNickName();
		 String msg = "";

		try {
			System.out.println("review :" + review);
			result = reviewService.insertReview(review, userId);
			
			if (result >0) {
				msg = "리뷰 등록 성공 ! ";
			}else {
				msg = "리뷰 등록 실패 !";
				
			}
		} catch (Exception e) {
			throw new MemberException("리뷰 등록 오류!");
		}
		
		
		model.addAttribute("loc", loc)
		 .addAttribute("msg", msg);

		return "common/msg";
		
		

	}
	 
	
	@RequestMapping("/review/sellerReview.do")
	public String selectReviewList(@RequestParam String userId, Model model, int reCount) {
		String nickName = userId;
		
		Member m = memberService.findSeller2(nickName);
		
		List<Map<String, String>> slist 
			= reviewService.selectSellerReview(m.getNickName());
		model.addAttribute("ReviewList", slist);
		
		if(reCount == 0) {
			model.addAttribute("reCount",reCount);
		}
		
		model.addAttribute("sellerList", slist)
		 	 .addAttribute("seller", m) ;

		return "member/sellerPage";
		
	}

}
