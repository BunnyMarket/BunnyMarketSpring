package com.kh.bunny.report.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bunny.common.util.Utils;
import com.kh.bunny.member.model.service.MemberService;
import com.kh.bunny.report.model.exception.ReportException;
import com.kh.bunny.report.model.service.ReportService;
import com.kh.bunny.report.model.vo.Report;

@Controller
public class ReportController {

	@Autowired
	ReportService reportService;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/report/reportList.do")
	public String selectReportList(@RequestParam(value ="cPage", required = false, defaultValue = "1") int cPage,
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
	
	@RequestMapping("/report/reportInsertView.do")
	public String detailReport() {
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
	
	@RequestMapping("/report/reportImgInsert.do")
	@ResponseBody
	public String auctionImgInsert(@RequestParam(value = "file", required = false) MultipartFile[] file, Model model,
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
	
	
	
	
	
	
	
	
	
	
	
	
	
}
