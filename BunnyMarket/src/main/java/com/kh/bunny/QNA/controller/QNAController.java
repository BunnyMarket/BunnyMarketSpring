package com.kh.bunny.QNA.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bunny.QNA.model.exception.QNAException;
import com.kh.bunny.QNA.model.service.QNAService;
import com.kh.bunny.QNA.model.vo.QNA;
import com.kh.bunny.common.util.Utils;

@Controller
public class QNAController {

	@Autowired
	QNAService qnaService;
	
	@RequestMapping("/QNA/QNAList.do")
	public String selectQNAList(
			@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage,Model model) {
		
		// 한 페이지 당 게시글 수
		int numPerPage = 10;
		
		List<Map<String,String>>list
		= qnaService.selectQNAList(cPage,numPerPage);
		
		System.out.println("qnaList 가져오는지 확인: " + list);
		
		int totalContents = qnaService.selectQNATotalContents();
		
	String pageBar= Utils.getPageBar(totalContents, cPage, numPerPage, "QNAList.do");
		
		model.addAttribute("list", list)
		           .addAttribute("totalContents", totalContents)
		           .addAttribute("numPerPage", numPerPage)
		           .addAttribute("pageBar", pageBar);
		
		return "QNA/QNA_List";
		
	}
	
	@RequestMapping("/QNA/QNADetail.do")	
	public void insertQNA() {
		
	}
	
	@RequestMapping("/QNA/QNA_Insert.do")
	public String insertQNA(QNA qna, Model model, HttpSession session) {
		int result;
		
		try {
		result = qnaService.insertQNA(qna);
		}catch(Exception e) {
			throw new QNAException("QNA 등록 오류!");
		}
	
		String loc = "QNA/QNAList.do";
		String msg ="";
		
		if(result > 0) {
			  msg = "QNA 등록 성공!";
			  loc = "/QNA/QNA_Detail.do?no="+qna.getQno();
		}else {
			msg ="QNA 등록 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
