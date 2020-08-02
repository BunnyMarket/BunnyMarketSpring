package com.kh.bunny.love.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bunny.love.model.service.LoveService;
import com.kh.bunny.love.model.vo.Love;
import com.kh.bunny.member.model.exception.MemberException;
import com.kh.bunny.member.model.vo.Member;

@Controller
public class LoveController {
	@Autowired
	LoveService loveService;
	
	@RequestMapping("/love/loveInsert.do")
	public String loveInsert(@RequestParam int pno, Model model, Love love, HttpSession session) {
		int result;
		Member m = (Member)session.getAttribute("member");
		
		love.setPno(pno);
		love.setUserId(m.getUserId());
		
		String loc = "/auction/auctionDetail.do?pno="+love.getPno();
		String msg ="";
		System.out.println(love);
		try {
			
			result = loveService.insertLoveAuction(love);
			
			if(result >0) {
				msg="찜하기 등록 성공";
			}else {
				msg="찜하기 등록 실패";
			}
			
		}catch(Exception e) {
			throw new MemberException("찜하기 등록 오류");
		}
		
		model.addAttribute("loc", loc)
		 .addAttribute("msg", msg);
		
		return "common/msg";
				
				
	}
	
	
	
	
}
