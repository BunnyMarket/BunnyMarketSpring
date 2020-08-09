package com.kh.bunny.report.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bunny.auction.model.service.AuctionService;
import com.kh.bunny.auction.model.vo.Auction;
import com.kh.bunny.common.util.AdminUtils;
import com.kh.bunny.common.util.Utils;
import com.kh.bunny.member.model.service.MemberService;
import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.product.model.service.ProductService;
import com.kh.bunny.product.model.vo.Product;
import com.kh.bunny.report.model.exception.ReportException;
import com.kh.bunny.report.model.service.ReportService;
import com.kh.bunny.report.model.vo.Report;

@Controller
public class ReportController {

	@Autowired
	ReportService reportService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	AuctionService auctionService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 신고 리스트 출력(o)
	@RequestMapping("/report/reportList.do")
	public String selectReportList(@RequestParam(value ="pPage", required = false, defaultValue = "1") int cPage,
			Model model) {
		
		int numPerPage = 10;
		
		List<Map<String, String>> list = reportService.selectReportList(cPage, numPerPage);
		
		System.out.println("reportList 가져오는지 확인:" + list);
		
		int totalContents = reportService.selectReportTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "reportList.do");
		
		model.addAttribute("list", list).addAttribute("totalContents", totalContents)
		           .addAttribute("numPerPage", numPerPage).addAttribute("pageBar", pageBar);
		
		return "report/reportList";
	}
	
	
	// 신고글 직접 등록(o)
	@RequestMapping("/report/reportDirectInsertView.do")
	public String detailDirectReport() {
		
		return "report/reportDirectInsert";
	}
	
	
	// 상품 신고글 등록(직접, 일반, 경매)
	@RequestMapping("/report/reportInsertView.do")
	public String detailReport(@RequestParam int pno, Model model) {
		
		 Product p = reportService.selectOneProduct(pno);
		System.out.println("p : " + p);
		
		model.addAttribute("product", p);
		
		return "report/reportInsert";
	}
	
	// 상품 신고글 등록하고 상세보기로 넘김(o)
	@RequestMapping("/report/reportInsert.do")
	public String insertReport(Report r, Model model, HttpSession session) {
		int result = 0;
		
		System.out.println("컨트롤러에서 r객체 확인 : " + r);
		
		int rno =0;
		String loc = "/report/reportList.do";
		String msg ="";
		try {
			if(r.getPno() != 0) {
				result = reportService.insertReport(r);
			} else {
				result = reportService.insertDirectReport(r);
			}
			rno = reportService.selectCurrentRno();
			
			if(result >0) {
				msg = "Report 등록 성공!";
				
				loc = "/report/reportDetail.do?rno=" + rno;
				
			}else {
				msg = "Report 등록 실패!";
			}
		}catch (Exception e) {
			throw new ReportException("Report 등록 오류!" + e.getMessage());
		}
		
	
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	// 신고글 상세보기(직접, 상품, 경매)
	@RequestMapping("/report/reportDetail.do")
	public String selectOne(@RequestParam int rno, Model model) {
		Report r = reportService.selectOneReport(rno);
		
		System.out.println("report객체 확인 : " + r);
		if(r.getPno() != 0) {
			Product p = reportService.selectOneProduct(r.getPno());
			
			String pTitle = p.getPTitle();
			
			model.addAttribute("report", r).addAttribute("pTitle", pTitle);
			
		} else {
			model.addAttribute("report", r);
		}
		
		return "report/reportDetail";
		
		
	}
	
	@RequestMapping("/report/reportMember.do")
	public String reportMember(Report report, Model model, HttpSession session, int pType) {
		System.out.println("report잘 가져오나 확인 : " + report);
		System.out.println("pType 잘 가져와?" + pType);
		
		String rWriter = ((Member)session.getAttribute("member")).getNickName();
		
		report.setRWriter(rWriter);
		
		int result = reportService.insertReport(report);
		String msg = "";
		String loc = "";
		
		//int pType = (productService.selectOneProduct(report.getPno())).getPType(); 
		
		if(result > 0) {
			msg = report.getReported() + "님에 대한 신고가 접수되었습니다.";
			
			if (pType == 1) {
				loc = "/product/productDetail.do?pno="+report.getPno();
			} else if (pType == 2) {
				loc = "/auction/auctionDetail.do?pno="+report.getPno();
			}
			
		} else {
			msg = "신고 접수 실패";
			loc = "/";
		}
		
		model.addAttribute("loc", loc)
			 .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	
	// 첨부파일
	@RequestMapping("/report/reportImgInsert.do")
	@ResponseBody
	public String reportImgInsert(@RequestParam(value = "file", required = false) MultipartFile[] file, Model model,
			HttpSession session) {

		String saveDir = session.getServletContext().getRealPath("resources/upload/report/desc");

		File dir = new File(saveDir);
		if (dir.exists() == false)
			dir.mkdirs();

		String renamedName = "";

		for (MultipartFile f : file) {

			if (!f.isEmpty()) {
				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".") + 1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");

				int rndNum = (int) (Math.random() * 1000);

				renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;

				try {
					f.transferTo(new File(saveDir + "/" + renamedName));
					System.out.println("바뀐이름 : " + renamedName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}

		}

		return "http://localhost:8088/bunny/resources/upload/report/desc/" + renamedName;
	}
	
	// 비밀번호 체크 (o)
	@RequestMapping("/report/reportPassword.do")
	public String pwdReport(@RequestParam int rno, Model model) {
		model.addAttribute("rno",rno);
		
		return "report/reportPassword";
	}
	
	// 비밀번호 입력 후 넘어감 (o)
	@RequestMapping("/report/reportSelectOnePassword.do")
	public String selectOneReportPwd(@RequestParam int rno, @RequestParam String checkPwd, Model model,
			HttpSession session) {
		
		String msg ="";
		String loc ="";
		
		Report r = reportService.selectOneReport(rno);
		
		System.out.println(session.getAttribute("member"));
		Member m = (Member)session.getAttribute("member");
		
		if(r.getRWriter().equals(m.getNickName())&& bcryptPasswordEncoder.matches(checkPwd, m.getUserPwd())) {
			System.out.println("비번 : " + m.getUserPwd());
			
			msg = "입력 성공!";
			loc = "/report/reportDetail.do?rno=" + r.getRNo();
			
			System.out.println(m);
		}else if(checkPwd.trim().length() != 0) {
			msg = "비밀번호가 틀렸습니다.";
			loc = "/report/reportList.do";
		}else {
			msg = "입력 실패!";
			loc = "/report/reportList.do";
		}
		
		model.addAttribute("msg", msg).addAttribute("loc",loc).addAttribute("report",r);
		
		return "common/msg";
				
	}
	
	// 관리자 비밀번호  체크 x
	@RequestMapping("/report/reportSelectOneAdmin.do")
	public String selectOneAdmin(@RequestParam int rno, Model model) {
		Report r = reportService.selectOneReport(rno);
		
		model.addAttribute("report",r);
		
		return "report/reportDetail";
	}
	

	
	// 상품 신고 글 수정페이지 (직접, 상품, 경매)
	@RequestMapping("/report/reportUpdateView.do")
	public String reportUpdateView(@RequestParam int rno, Model model) {
		model.addAttribute("report", reportService.selectOneReport(rno));
		
		return "report/reportUpdate";
	}
	
	// 신고글 수정 후 상세보기로 넘어감 (직접, 상품, 경매)
	@RequestMapping("/report/reportUpdate.do")
	public String reportUpdate(Report r, HttpSession session, Model model) {
		System.out.println("지금 잘 들어왔니? : " + r);
		
		int result = reportService.updateReport(r);
		
		String loc = "/report/reportDetail.do?rno=" + r.getRNo();
		String msg = "";
		
		if(result > 0) {
			msg = "신고글 수정 성공!";
		}else {
			msg ="신고글 수정 실패!";
		}
		model.addAttribute("loc",loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	// 신고글 삭제 (o)
	@RequestMapping("/report/reportDelete.do")
	public String reportDelete(@RequestParam int rno, HttpSession session, Model model) {
		int result = reportService.deleteReport(rno);
		
		String loc = "/report/reportList.do";
		String msg = "";
		
		if(result >0) {
			msg = "신고글 삭제 성공!";
		}else {
			msg = "신고글 삭제 실패!";
		}
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		System.out.println("Model :" + model);
		
		return "common/msg";
	}
	
	
	// admin 신고 리스트 출력
	@RequestMapping("/admin/report/reportList.do")
	public String ReportList(@RequestParam(value ="pPage", required = false, defaultValue = "1") int cPage,
			Model model) {
		
		int numPerPage = 10;
		
		List<Map<String, String>> list = reportService.selectReportList(cPage, numPerPage);
		
		System.out.println("reportList 가져오는지 확인:" + list);
		
		int totalContents = reportService.selectReportTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "reportList.do");
		
		model.addAttribute("list", list).addAttribute("totalContents", totalContents)
		           .addAttribute("numPerPage", numPerPage).addAttribute("pageBar", pageBar);
		
		return "admin/report/reportList";
	}
	
	@RequestMapping("/admin/report/reportSelectOneAdmin.do")
	public String adminSelectOne(@RequestParam int rno, Model model) {
		Report r = reportService.selectOneReport(rno);
		
		model.addAttribute("report",r);
		
		return "admin/report/reportDetail";
	}
	
	@RequestMapping(value = "/admin/report/searchReport.do", method = RequestMethod.GET)
	public String searchReport(@RequestParam(value= "keyword", required = false, defaultValue = "") String keyword, 
								@RequestParam (value= "condition", required = false, defaultValue = "") String condition, 
								Model model,
								@RequestParam(value = "pPage", required = false, defaultValue = "1") int pPage) {
		
		int numPerPage = 10; // 10개씩 나오도록 
		List<Object> list = reportService.searchReportList(keyword, condition, pPage, numPerPage);

		
		// 페이지 계산을 위한 총 페이지 개수 
		int totalContents =  reportService.selectSReportTotalContents(keyword, condition);
		
		System.out.println("totalContents : " + totalContents);
		
		String pageBar = AdminUtils.getPageBar(totalContents, 
												pPage, 
												numPerPage, 
												"/report/searchReport.do?condition="+condition+"&keyword=" + keyword);
		
		
		model.addAttribute("keyword", keyword)
		.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("pageBar", pageBar);
		
		return "admin/report/reportList";	
	}
	
	
}
