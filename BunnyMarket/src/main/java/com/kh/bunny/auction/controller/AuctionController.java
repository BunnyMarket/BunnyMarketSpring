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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bunny.auction.model.exception.AuctionException;
import com.kh.bunny.auction.model.service.AuctionService;
import com.kh.bunny.auction.model.vo.Auction;
import com.kh.bunny.auction.model.vo.Bidder;
import com.kh.bunny.common.util.ProductAjaxUtils;
import com.kh.bunny.common.util.Utils;
import com.kh.bunny.member.model.service.MemberService;
import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.product.model.exception.ProductException;
import com.kh.bunny.product.model.service.ProductService;
import com.kh.bunny.product.model.vo.PComment;
import com.kh.bunny.product.model.vo.Product;
import com.kh.bunny.review.model.service.ReviewService;

@Controller
public class AuctionController {
	
	@Autowired
	AuctionService auctionService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("/auction/auctionList.do")
	public String selectAuctionList(
				  @RequestParam(value="pcno", required=false, defaultValue = "0") int pcno
				, @RequestParam(value="order", required=false, defaultValue = "1") int order
				, @RequestParam(value="count", required=false, defaultValue = "9") int count
				, @RequestParam(value = "pPage", required = false, defaultValue = "1") int aPage
				, Model model, HttpServletRequest request
			) {
		

		int numPerPage = 0;
		System.out.println("count : " + count);
		if(count == 18) {
			numPerPage = 18;
		} else if (count == 36){
			numPerPage = 36;
		} else {
			numPerPage = 9;
		}
		
		Map<String, Integer> conditionMap = new HashMap<String, Integer>();
		
		conditionMap.put("order", order);
		conditionMap.put("pcno", pcno);
		conditionMap.put("count", count);
		conditionMap.put("page", aPage);
		
		List<Map<String, String>> list = auctionService.selectAuctionTypeList(aPage, numPerPage, conditionMap);
		
		int totalContents = auctionService.selectAuctionTypeTotalContents(conditionMap);
		String pageBar = ProductAjaxUtils.getPageBar(totalContents, aPage, numPerPage, conditionMap, "auctionList.do");
		
		List<Integer> countList = auctionService.selectTypeCount();
		
		model.addAttribute("list", list)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar)
			 .addAttribute("typeCount", countList)
			 .addAttribute("condition", conditionMap);
		
		return "auction/auctionList";
	}
	
	@RequestMapping("/auction/auctionDetail.do")
	public String auctionDetail(@RequestParam int pno, Model model, HttpSession session) {
		
		System.out.println("pno : "+pno);
		Auction a = auctionService.selectOneAuction(pno);
		Member m = (Member)session.getAttribute("member");
		int bidderCount = auctionService.selectOneBidderCount(pno);
		
		List<Object> PComments = productService.selectPCommentList(pno);
		System.out.println("pcomments : " + PComments);
		System.out.println("pcomments : " + PComments.size());
		ArrayList<Bidder> bList = auctionService.selectAllBidder(pno);
		Member seller = memberService.findSeller2(a.getPWriter());
		
		int dno = 0;
		int reCount = 0;
		if(a.getPBuyer() != null && a.getPType() == 1) {
			dno = productService.giveMeDno(pno);
			System.out.println("dno 있어요?" + dno);
		} else if(a.getPBuyer() != null && a.getPType() == 2 && a.getPStatus() == 2) {
			dno = productService.giveMeDno(pno);
			System.out.println("dno 있어요?" + dno);
		} else if(a.getPStatus() == 3) {
			dno = productService.giveMeDno(pno);
			System.out.println("dno 있어요?" + dno);
			reCount = reviewService.selectOneReCount(pno, m.getUserId());
		}
		
		model.addAttribute("auction", a)
			 .addAttribute("bCount", bidderCount)
			 .addAttribute("bList" , bList)
			 .addAttribute("seller",seller)
			 .addAttribute("pcomments", PComments)
			 .addAttribute("dno", dno)
			 .addAttribute("reCount", reCount)
			 .addAttribute("pcommentSize", PComments.size()); // 댓글 갯수 출력 
		
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
		
		String saveDir = session.getServletContext().getRealPath("resources/upload/product");
		
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
			msg = "경매 등록 성공";
			loc = "/auction/auctionDetail.do?pno="+auction.getPno();
			System.out.println("경매상품 등록 성공");
		} else {
			msg = "경매 등록 실패";
			System.out.println("경매상품 등록 실패");
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
		String userId = m.getNickName();
		
		String msg = "";
		String loc = "/auction/auctionDetail.do?pno="+pno;
		System.out.println("pno  / bPrice : " + pno + ", " + bPrice);
		try {
			Bidder b = new Bidder(pno, userId, bPrice);
			System.out.println("b가 뭐라구? : " + b);
			int result = auctionService.insertBidder(b);
			
			if (result > 0) {
				msg = "입찰 성공!";
			} else {
				msg = "입찰 실패!";
			}
			
		} catch (Exception e) {
			throw new AuctionException();
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/auction/bidderCheckInvalid.do")
	@ResponseBody
	public Map<String, Object> bidderCheck(@RequestParam int pno, @RequestParam int bPrice, HttpSession session, Model model){
		System.out.println("잘 들어오고 있나요?" + pno + bPrice);
		Member m = (Member)session.getAttribute("member");
		
		Auction a = auctionService.selectOneAuction(pno);
		Member bM = memberService.selectOne(m.getNickName());
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("잘 들어오고 있나요?" + pno + bPrice);
		int msg = 0;
		
		if(bM.getNowPoint() < bPrice) {
			msg = 0; //"당근이 부족합니다.";
		} else if(a.getBPrice() >= bPrice || a.getPPrice() >= bPrice) {
			msg = 1; //"입찰 하려는 금액이 기존 금액보다 작습니다.";
		} else if(bPrice % 10 != 0) {
			msg = 2; //"입찰은 10당근 씩 해주시기 바랍니다.";
		} else if(a.getPBuyer() != null && a.getPBuyer().equals(bM.getNickName())) { 
			msg = 3; //"최고가로 입찰중인 회원은 입찰할 수 없습니다.";
		} else if((a.getBPrice() > a.getPPrice() && bM.getNowPoint() < a.getBPrice()) 
					|| (a.getPPrice() > a.getBPrice() && bM.getNowPoint() < a.getPPrice())) {
			msg = 4;
		} else {
			msg = 5;
		}
		
		map.put("msg", msg);
		
		return map;
	}
	
	// 댓글 생성하기 
	@RequestMapping("/auction/pcommentInsert.do")
	public String pcommentInsert(PComment pcomment, Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("member");
		String userId = m.getNickName();
		
		pcomment.setPcWriter(userId);
		System.out.println("댓글 들어옴 ? " + pcomment);
		String msg = "";
		String loc = "/auction/auctionDetail.do?pno=" + pcomment.getPno();
		
		try	{
			int result = productService.insertPComment(pcomment);
			
			if(result > 0) {
				msg = "댓글 달기 성공!";
			} else {
				msg = "댓글 달기 실패ㅠ";
			}
		} catch (Exception e) {
			throw new ProductException("상품 댓글에서 에러 발생! " + e.getMessage());
		}
		 
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	// 댓글 수정하기 
	@RequestMapping("/auction/pcommentUpdate.do")
	@ResponseBody
	public HashMap<String, Object> pcommentUpdate(PComment pcomment) {
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		boolean updateCheck = false;
		try {
			updateCheck = productService.updatePComment(pcomment) > 0 ? true : false;
		} catch (Exception e) {
			throw new ProductException();
		}
		
		hmap.put("updateCheck", updateCheck);
		
		return hmap;
	}
	
	// 댓글 삭제하기 
	@RequestMapping("/auction/pcommentDelete.do")
	public String pcommentDelete(PComment pcomment, Model model) {
		
		String msg = "";
		String loc = "/auction/auctionDetail.do?pno=" + pcomment.getPno();
		
		try	{
			
			boolean hasReply = productService.selectOneReplyPcmno(pcomment.getPcmno()) > 0 ? true : false;
			if(hasReply == true) {
				msg = "대댓글이 있어서 삭제가 불가능합니다.";
			} else {
				
				int result = productService.deletePComment(pcomment.getPcmno());
			
				if(result > 0 && hasReply == false) {
					msg = "댓글 삭제 성공!";				
				} else {
					msg = "에러 발생!(댓글 삭제 실패)";
				}
			}
		} catch (Exception e) {
			throw new ProductException("상품 댓글에서 에러 발생! " + e.getMessage());
		}
		 
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/auction/auctionTradeList.do")
	@ResponseBody
	public Map<String, Object> tradeList(
				  @RequestParam(value = "aPage", required = false, defaultValue = "1") int aPage
				, Model model, HttpServletRequest request, String nickName
			) {
		Map<String, Object> result = new HashMap<String, Object>();
		int numPerPage = 100;
		 
		List<Map<String, String>> tlist = auctionService.selectTradeList(aPage, numPerPage,nickName);
		
		System.out.println("무엇이 들어있느냐? : " + tlist);
		System.out.println("무엇이 들어있느냐? : " + tlist.size());
		
		int totalContents = auctionService.selectTradeTotalContents(nickName);
		
		String pageBar = Utils.getPageBar(totalContents, aPage, numPerPage, "/auction/auctionTradeList.do?PWRITER="+nickName);
		result.put("list", tlist);
		result.put("totalContents", totalContents);
		result.put("numPerPage", numPerPage);
		result.put("pageBar", pageBar);
		
		
		
		return result;
	}
	
	
	
	
	
	@RequestMapping("/auction/completeAuctionList.do")
	@ResponseBody
	public Map<String, Object> completeAuctionList(
				  @RequestParam(value = "aPage", required = false, defaultValue = "1") int aPage
				, Model model, HttpServletRequest request, String nickName
			) {
		Map<String, Object> result = new HashMap<String, Object>();
		int numPerPage = 100;
		 
		List<Map<String, String>> tlist = auctionService.completeAuctionList(aPage, numPerPage,nickName);
		
		System.out.println("무엇이 들어있느냐? : " + tlist);
		System.out.println("무엇이 들어있느냐? : " + tlist.size());
		
		int totalContents = auctionService.selectCompleteAuctionTotalContents(nickName);
		
		String pageBar = Utils.getPageBar(totalContents, aPage, numPerPage, "/auction/auctionTradeList.do?PWRITER="+nickName);
		result.put("list", tlist);
		result.put("totalContents", totalContents);
		result.put("numPerPage", numPerPage);
		result.put("pageBar", pageBar);
		
		
		
		return result;
	}
	
	@RequestMapping("/auction/sellCompleteAuctionList.do")
	@ResponseBody
	public Map<String, Object> sellCompleteAuctionList(
				  @RequestParam(value = "aPage", required = false, defaultValue = "1") int aPage
				, Model model, HttpServletRequest request, String nickName
			) {
		Map<String, Object> result = new HashMap<String, Object>();
		int numPerPage = 100;
		 
		List<Map<String, String>> tlist = auctionService.sellCompleteAuctionList(aPage, numPerPage,nickName);
		
		System.out.println("무엇이 들어있느냐? : " + tlist);
		System.out.println("무엇이 들어있느냐? : " + tlist.size());
		
		
		
		result.put("list", tlist);
		
		
		
		
		return result;
	}
	
	@RequestMapping("/auction/auctionListType.do")
	@ResponseBody
	public Map<String, Object> auctionListType(
			  @RequestParam(value="pcno", required=false, defaultValue = "0") int pcno
			, @RequestParam(value="order", required=false, defaultValue = "1") int order
			, @RequestParam(value="count", required=false, defaultValue = "9") int count
			, @RequestParam(value = "pPage", required = false, defaultValue = "1") int aPage
			, HttpServletRequest request
		) {
	
		int numPerPage = 0;
		System.out.println("count : " + count);
		if(count == 18) {
			numPerPage = 18;
		} else if (count == 36){
			numPerPage = 36;
		} else {
			numPerPage = 9;
		}
		
		Map<String, Integer> conditionMap = new HashMap<String, Integer>();
		
		conditionMap.put("order", order);
		conditionMap.put("pcno", pcno);
		
		List<Map<String, String>> list = auctionService.selectAuctionTypeList(aPage, numPerPage, conditionMap);
		
		int totalContents = auctionService.selectAuctionTypeTotalContents(conditionMap);
		String pageBar = ProductAjaxUtils.getPageBar(totalContents, aPage, numPerPage, conditionMap, "auctionList.do");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalTypeContents", totalContents);
		map.put("numPerPage", numPerPage);
		map.put("pageBar", pageBar);
		
		return map;
	}
	
	
	@RequestMapping("/auction/goTradeAuction.do")
	@ResponseBody
	public Map<String, Object> goTradeAuction(
				  @RequestParam(value = "aPage", required = false, defaultValue = "1") int aPage
				, Model model, HttpServletRequest request, String nickName
			) {
		Map<String, Object> result = new HashMap<String, Object>();
		int numPerPage = 100;
		 
		List<Map<String, String>> tlist = auctionService.goTradeAuction(aPage, numPerPage,nickName);
		
		System.out.println("무엇이 들어있느냐? : " + tlist);
		System.out.println("무엇이 들어있느냐? : " + tlist.size());
		
		result.put("list", tlist);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

























