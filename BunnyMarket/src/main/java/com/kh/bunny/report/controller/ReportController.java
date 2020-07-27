package com.kh.bunny.report.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bunny.common.util.Utils;
import com.kh.bunny.member.model.service.MemberService;
import com.kh.bunny.report.model.service.ReportService;

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
}
