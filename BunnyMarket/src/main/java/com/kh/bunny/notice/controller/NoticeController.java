package com.kh.bunny.notice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bunny.common.util.Utils;
import com.kh.bunny.notice.model.service.NoticeService;
import com.kh.bunny.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	// list admin
	@RequestMapping("/admin/notice/noticeList.do")
	public String selectNoticeList(
			 @RequestParam(
					 value="cPage",
					 required=false, 
					 defaultValue="1")
				int cPage, Model model
			) {
		int numPerPage = 10; 
		
		List<Map<String, String>> list 
			= noticeService.selectNoticeList(cPage, numPerPage);
	
		int totalContents = noticeService.selectNoticeTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "noticeList.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage",numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		
		return "notice/notice";
	}
	
	// list member
	@RequestMapping("/notice/mNotice.do")
	public String selectmNoticeList(
			 @RequestParam(
					 value="cPage",
					 required=false, 
					 defaultValue="1")
				int cPage, Model model
			) {
		int numPerPage = 10; 
		
		List<Map<String, String>> list 
			= noticeService.selectNoticeList(cPage, numPerPage);
	
		int totalContents = noticeService.selectNoticeTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "mNotice.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage",numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		
		return "notice/mNotice";
	}
	
	// insertView
	@RequestMapping("/admin/notice/noticeInsertForm.do")
	public String noticeInsertView() {
		return "notice/noticeInsert";
	}
	
	// insert
	@RequestMapping("/admin/notice/noticeInsert.do")
	public String noticeInsert(Notice notice) {
		
		System.out.println(notice);
		
		int result = noticeService.insertNotice(notice);
		
		String loc ="";
		
		if(result > 0 ) {
			loc ="/admin/notice/noticeList.do";
		} else {
			loc ="/admin/notice/noticeList.do";
		}
		
		
		return "redirect:/admin/notice/noticeList.do";
	}
	
	// detail
	@RequestMapping("/admin/notice/noticeDetail.do")
	public String selectOne(@RequestParam int no, Model model) {
		
		model.addAttribute("notice",noticeService.selectOneNotice(no));
		
		return "notice/noticeDetail";
	}
	
	// mdetail
	@RequestMapping("/notice/mNoticeDetail.do")
	public String selectmOne(@RequestParam int no, Model model) {
		
		model.addAttribute("notice",noticeService.selectOneNotice(no));
		
		return "notice/mNoticeDetail";
	}	
}
