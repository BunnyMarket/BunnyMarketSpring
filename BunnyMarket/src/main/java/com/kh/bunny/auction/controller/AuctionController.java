package com.kh.bunny.auction.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bunny.auction.model.service.AuctionService;
import com.kh.bunny.auction.model.vo.Auction;
import com.kh.bunny.common.util.Utils;

@Controller
public class AuctionController {
	
	@Autowired
	AuctionService auctionService;
	
	@RequestMapping("/auction/auctionList.do")
	public String selectAuctionList(
				  @RequestParam(value = "aPage", required = false, defaultValue = "1") int aPage
				, Model model, HttpServletRequest request
			) {
		
		int numPerPage = 10;
		List<Map<String, String>> list = auctionService.selectAuctionList(aPage, numPerPage);
		
		System.out.println("무엇이 들어있느냐? : " + list);
		System.out.println("무엇이 들어있느냐? : " + list.size());
		
		int totalContents = auctionService.selectAuctionTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, aPage, numPerPage, "auctionList.do");
		
		model.addAttribute("list", list)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		return "auction/auctionList";
	}
	
	@RequestMapping("/auction/bidderCount.do")
	@ResponseBody
	public int bidderCount(@RequestParam int pno) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int bidderCount = auctionService.selectBidderCount(pno);
		System.out.println("bidderCount는 무엇일랑가? "+bidderCount);
		map.put("bidderCount", bidderCount);
		
		return bidderCount;
	}
	
	@RequestMapping("/auction/auctionDetail.do")
	public String auctionDetail(@RequestParam int pno, Model model) {
		System.out.println("pno : "+pno);
		Auction a = auctionService.selectOneAuction(pno);
		
		model.addAttribute("auction", a);
		
		return "auction/auctionDetail";
	}
	
	@RequestMapping("/auction/auctionInsertForm.do")
	public String auctionInsertForm() {
		
		return "auction/auctionInsert";
		
	}
	
	
}

























