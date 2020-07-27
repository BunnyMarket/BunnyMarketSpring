package com.kh.bunny.auction.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bunny.auction.model.exception.AuctionException;
import com.kh.bunny.auction.model.service.AuctionService;
import com.kh.bunny.auction.model.vo.Auction;
import com.kh.bunny.auction.model.vo.Bidder;
import com.kh.bunny.common.util.Utils;
import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.product.model.vo.Product;

@Controller
public class AuctionController {
	
	@Autowired
	AuctionService auctionService;
	
	@RequestMapping("/auction/auctionList.do")
	public String selectAuctionList(
				  @RequestParam(value = "aPage", required = false, defaultValue = "1") int aPage
				, Model model, HttpServletRequest request
			) {
		
		int numPerPage = 9;
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
		System.out.println("pno : " + pno + " / bidderCount는 무엇일랑가? "+bidderCount);
		map.put("bidderCount", bidderCount);
		
		return bidderCount;
	}
	
	
	@RequestMapping("/auction/auctionDetail.do")
	public String auctionDetail(@RequestParam int pno, Model model) {
		System.out.println("pno : "+pno);
		Auction a = auctionService.selectOneAuction(pno);
		
		int bidderCount = auctionService.selectOneBidderCount(pno);
		
		ArrayList<Bidder> bList = auctionService.selectAllBidder(pno);
		
		model.addAttribute("auction", a)
			 .addAttribute("bCount", bidderCount)
			 .addAttribute("bList" , bList);
		
		return "auction/auctionDetail";
	}
	
	@RequestMapping("/auction/auctionInsertForm.do")
	public String auctionInsertForm() {
		
		return "auction/auctionInsert";
		
	}
	
	@RequestMapping("/auction/auctionInsertEnd.do")
	public String insertProduct(Auction auction, Model model, HttpSession session,
			@RequestParam(value="pImage", required = false) MultipartFile pImage) {
		
		System.out.println("옥션이 잘 들어왓느냐~ : " +auction );
		
		String saveDir = session.getServletContext().getRealPath("resources/upload/auction");
		
		File dir = new File(saveDir);
		if(dir.exists() == false) dir.mkdirs();
		
		String originName = pImage.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		
		int rndNum = (int)(Math.random() * 1000); // 이름바꾸기 수행. 랜덤번호..
		
		// 서버에서 저장 후 관리할 파일 명 
		String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
		System.out.println("renamedName : " + renamedName);
		// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
		try {
			pImage.transferTo(new File(saveDir + "/" + renamedName)); 
			// transferTo는 우리가 원래 받은 원본 파일 이름을 변경된 파일 이름으로 바꾸어서 해당 경로에 저장해달라는 것.
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		Member m = (Member)session.getAttribute("member");
		String userId = m.getNickName();
		
		auction.setPImg(renamedName);
		auction.setPWriter(userId);
		
		System.out.println("파일은 잘 들어왔느냐~ : " +auction );
		
		int result;
		try {
			result = auctionService.insertAuction(auction);
			
		} catch (Exception e) {
			throw new AuctionException("게시글 등록 오류" + e.getMessage());
		}
		
		String loc = "/auction/auctionList.do";
		String msg = "";
		
		if (result >0) {
			msg = "Success Insert Auction";
			loc = "/auction/auctionDetail.do?pno="+auction.getPno();
			System.out.println("Success Insert Auction");
		} else {
			msg = "Fail Insert Auction";
			System.out.println("Fail Insert Auction");
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/auction/aImgInsert.do")
	@ResponseBody
	public String auctionImgInsert(
				  @RequestParam(value="file", required = false) MultipartFile[] file
				, Model model, HttpSession session
			) {
		
		String saveDir = session.getServletContext().getRealPath("resources/upload/auction/desc");
		
		File dir = new File(saveDir);
		if(dir.exists() == false) dir.mkdirs();
		
		String renamedName = "";
		
		for(MultipartFile f : file) {
			
			if(!f.isEmpty()) {
				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".") + 1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
				
				int rndNum = (int)(Math.random() * 1000);
				
				renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
				
				try {
					f.transferTo(new File(saveDir + "/" + renamedName)); 
					System.out.println("바뀐이름 : " + renamedName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			
		}
		// 192.168.20.214 - 민정
		return "http://localhost:8088/bunny/resources/upload/auction/desc/" + renamedName;
	}
	
	
	@RequestMapping("/auction/insertBidder.do")
	public String insertBidder(@RequestParam int pno, @RequestParam int bPrice, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("member");
		String userId = m.getUserId();
		
		Auction a = auctionService.selectOneAuction(pno);
		
		String msg = "";
		String loc = "/auction/auctionDetail.do?pno="+pno;
		
		if(a.getBPrice() > bPrice || a.getPPrice() > bPrice) {
			msg = "입찰 하려는 금액이 기존 금액보다 작습니다.";
		} else if((a.getBPrice() > bPrice || a.getPPrice() > bPrice) && bPrice % 10 != 0) {
			msg = "입찰은 10당근 씩 해주시기 바랍니다.";
		} else if((a.getBPrice() > bPrice || a.getPPrice() > bPrice)  && a.getPBuyer().equals(userId)) { 
			msg = "최고가로 입찰중인 회원은 입찰할 수 없습니다. ";
		} else {
			Bidder b = new Bidder(pno, userId, bPrice);
			int result = auctionService.insertBidder(b);
			
			if (result >0) {
				msg = "입찰 성공!";
			} else {
				msg = "입찰 실패!";
			}
			
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	
}

























