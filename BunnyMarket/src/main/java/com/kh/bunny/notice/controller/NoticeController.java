package com.kh.bunny.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bunny.common.util.AdminUtils;
import com.kh.bunny.common.util.SearchUtils;
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
					 value="pPage",
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
		
		
		return "notice/noticeList";
	}
	
	// list member
	@RequestMapping("/notice/mNotice.do")
	public String selectmNoticeList(
			 @RequestParam(
					 value="pPage",
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
		
		
		return "notice/mNoticeList";
	}
	
	// insertView
	@RequestMapping("/admin/notice/noticeInsertForm.do")
	public String noticeInsertView() {
		return "notice/noticeInsert";
	}
	
	// insert
	@RequestMapping("/admin/notice/noticeInsert.do")
	public String noticeInsert(Notice notice) {
		
		int result = noticeService.insertNotice(notice);
		
		String loc ="";
		
		if(result > 0 ) {
			loc ="/admin/notice/noticeDetail.do?no="+notice.getNno();
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
	
	//updateView
	@RequestMapping("/admin/notice/noticeUpdateForm.do")
	public String noticeUpdateView(@RequestParam int no, Model model) {
		
		model.addAttribute("notice", noticeService.selectOneNotice(no));
		return "notice/noticeUpdate";
	}
	
	// update
	@RequestMapping("/admin/notice/noticeUpdate.do")
	public String noticeUpdate(Notice notice, HttpSession session, Model model) {
	
		int result = noticeService.updateNotice(notice);
	
		String loc ="";
		
		if(result > 0 ) {
			loc ="/admin/notice/noticeDetail.do?no="+notice.getNno();
		} else {
			loc ="/admin/notice/noticeList.do";
		}
		
		
		return "notice/noticeDetail";
	}

	// delete
	@RequestMapping("/admin/notice/noticeDelete.do")
	public String noticeDelete(@RequestParam int no) {
		
		int result = noticeService.deleteNotice(no);
		
		String loc ="";
		
		if(result > 0 ) {
			loc ="redirect:/admin/notice/noticeList.do";
		} else {
			
		}
		
		return loc;	
	}
	
	@RequestMapping(value = "/admin/notice/searchNotice.do", method = RequestMethod.GET)
	public String searchNotice(@RequestParam(value= "keyword", required = false, defaultValue = "") String keyword, 
								@RequestParam (value= "condition", required = false, defaultValue = "") String condition, 
								Model model,
								@RequestParam(value = "pPage", required = false, defaultValue = "1") int pPage) {
		
		int numPerPage = 15; // 10개씩 나오도록 
		List<Object> list = noticeService.searchNoticeList(keyword, condition, pPage, numPerPage);

		
		// 페이지 계산을 위한 총 페이지 개수 
		int totalContents =  noticeService.selectSNoticeTotalContents(keyword, condition);
		
		System.out.println("totalContents : " + totalContents);
		
		String pageBar = AdminUtils.getPageBar(totalContents, 
												pPage, 
												numPerPage, 
												"admin/notice/searchNotice.do?condition="+condition+"&keyword=" + keyword);
		
		
		model.addAttribute("keyword", keyword)
		.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("pageBar", pageBar);
		
		return "notice/noticeList";	
	}

}

