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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
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
	
	// 신고글 직접 등록
	@RequestMapping("/report/reportDirectInsertView.do")
	public String detailDirectReport() {
		
		return "report/reportInsert";
	}
	
	@RequestMapping("/report/reportInsertView.do")
	public String detailReport(@RequestParam String pTitle, @RequestParam int pno, Model model) {
		System.out.println("pTitle : " + pTitle);
		System.out.println("pno : " + pno);
		
		model.addAttribute("pTitle", pTitle)
		           .addAttribute("pno", pno);
		
		return "report/reportInsert";
	}
	
	@RequestMapping("/report/reportInsert.do")
	public String insertReport(Report r, Model model, HttpSession session) {
		int result;
		
		System.out.println("컨트롤러에서 r객체 확인 : " + r);
		
		int rno =0;
		
		try {
		result = reportService.insertReport(r);
		rno = reportService.selectCurrentRno();
		}catch (Exception e) {
			throw new ReportException("Report 등록 오류!" + e.getMessage());
		}
		
		String loc = "report/reportList.do";
		String msg ="";
		
		if(result >0) {
			msg = "Report 등록 성공!";
			
			loc = "/report/reportDetail.do?rno=" + rno;
			
		}else {
			msg = "Report 등록 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/report/reportDetail.do")
	public String selectOne(@RequestParam int rno, Model model) {
		Report r = reportService.selectOneReport(rno);
		
		System.out.println("report객체 확인 : " + r);
		
		Product p = productService.selectOneProduct(r.getPno());
		
		String pTitle = p.getPTitle();
		
		model.addAttribute("report", r).addAttribute("pTitle", pTitle);
		
		return "report/reportDetail";
		
		
	}
	
	
	
	
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
	
	@RequestMapping("/report/reportPassword.do")
	public String pwdReport(@RequestParam int rno, Model model) {
		model.addAttribute("rno",rno);
		
		return "report/reportPassword";
	}
	
	@RequestMapping("/report/reportSelectOnePassword.do")
	public String selectOneReportPwd(@RequestParam int rno, @RequestParam String checkPwd, Model model,
			HttpSession session) {
		
		String msg ="";
		String loc ="";
		
		Report r = reportService.selectOneReport(rno);
		
		System.out.println(session.getAttribute("member"));
		Member m = (Member)session.getAttribute("member");
		
		if(r.getRWriter().equals(m.getUserId())&& bcryptPasswordEncoder.matches(checkPwd, m.getUserPwd())) {
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
	
	@RequestMapping("/report/reportSelectOneAdmin.do")
	public String selectOneAdmin(@RequestParam int rno, Model model) {
		Report r = reportService.selectOneReport(rno);
		
		model.addAttribute("report",r);
		
		return "report/reportDetail";
	}
	
	@RequestMapping("/report/reportUpdateView.do")
	public String reportUpdateView(@RequestParam int rno, Model model) {
		model.addAttribute("report", reportService.selectOneReport(rno));
		
		return "report/reportUpdate";
	}
	
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
	
	
	
	
	
	
	
	
}
