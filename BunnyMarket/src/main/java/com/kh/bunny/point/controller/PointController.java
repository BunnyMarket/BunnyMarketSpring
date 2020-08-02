package com.kh.bunny.point.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bunny.auction.model.service.AuctionService;
import com.kh.bunny.auction.model.vo.Auction;
import com.kh.bunny.common.util.Utils;
import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.point.model.exception.PointException;
import com.kh.bunny.point.model.service.PointService;
import com.kh.bunny.point.model.vo.BunnyPoint;
import com.kh.bunny.product.model.service.ProductService;
import com.kh.bunny.product.model.vo.Product;

@Controller
public class PointController {

	@Autowired
	PointService pointService;
	
	@RequestMapping("/point/pointChargeView.do")
	public String pointChargeView() {
		
		return "payment/pView";
	}
	
	@RequestMapping("/point/pointCharge.do")
	@ResponseBody
	public Map<String, Object> pointCharge(BunnyPoint bunnyPoint, Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("member");
		String userId = m.getNickName();
		
		HashMap<String , Object> hmap = new HashMap<String, Object>();
		boolean fineCharge = false;
		
		bunnyPoint.setUserId(userId);
		System.out.println("포인트로 들어왔어요? : " + bunnyPoint);
		int nowPoint = 0;
		try {
			
			fineCharge = pointService.pointChargeInsert(bunnyPoint) > 0 ? true : false;
			
			nowPoint = pointService.selectOneNowPoint(userId);
			System.out.println("웨?? fineCharge : " + fineCharge);
			System.out.println("현재 포인트 : " + nowPoint);
			
		} catch (Exception e) {
			throw new PointException("[포인트 결제 중 문제 발생] : " + e.getMessage());
		}
		hmap.put("fineCharge", fineCharge);
		hmap.put("nowPoint", nowPoint);
		
		
		return hmap;
	}
	
	@RequestMapping("/point/myPointView.do")
	public String goMyPointView(@RequestParam(value = "pPage", required = false, defaultValue = "1") int pPage,
								Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("member");
		String userId = m.getNickName();
		
		List<Map<String, String>> list = null;
		
		int totalContents = 0;
		int numPerPage = 10;
		int nowPoint = 0;
		
//		try {
			 list = pointService.selectMyPoint(userId, pPage, numPerPage);

			 totalContents = pointService.selectPointTotalContents(userId);
			 nowPoint = pointService.selectOneNowPoint(userId);
//		} catch (Exception e) {
//			throw new PointException();
//		}
		
		String pageBar = Utils.getPageBar(totalContents, pPage, numPerPage, "point/myPointView.do");
		
		model.addAttribute("myPoint", list)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar)
			 .addAttribute("nowPoint", nowPoint);
		
		return "member/myPoint";
	}
	
	@RequestMapping("/point/pointChargeViewProduct.do")
	public String pointChargeViewProduct(@RequestParam int pno, @RequestParam int bPrice, Model model) {
		//point/pointChargeViewProduct.do?pno=${a.pno}&bPrice='+bPrice
		System.out.println("pno를 보여주세요 : " + pno);
		Product p = pointService.selectOneProduct(pno);
		System.out.println("p를 보여주세요 : " + p);
		int realPrice = 0;
		
		if(p.getBPrice() > p.getPPrice()) {
			realPrice = p.getBPrice() - bPrice;
		} else {
			realPrice = p.getPPrice() - bPrice;
		}
		
		model.addAttribute("realPrice", realPrice);
		
		return "payment/pView";
	}
	
	
}









