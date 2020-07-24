package com.kh.bunny.QNA.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bunny.QNA.model.exception.QNAException;
import com.kh.bunny.QNA.model.service.QNAService;
import com.kh.bunny.QNA.model.vo.QNA;
import com.kh.bunny.common.util.Utils;
import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.member.model.service.MemberService;

@Controller
public class QNAController {

	@Autowired
	QNAService qnaService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
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
	
	@RequestMapping("/QNA/QNAInsertView.do")	
	public String detailQNA() {
		
		return "QNA/QNA_Insert";
		
	}
	
	@RequestMapping("/QNA/QNAInsert.do")
	public String insertQNA(QNA qna, Model model, HttpSession session) {
		int result;
		System.out.println("컨트롤러에서 qna객체 확인 : " + qna);
		
		int qno = 0;
		
		try {
			result = qnaService.insertQNA(qna);
			qno = qnaService.selectCurrentQno();
	}catch(Exception e) {
			throw new QNAException("QNA 등록 오류!" + e.getMessage());
		}
	
		String loc = "QNA/QNAList.do";
		String msg ="";

		if(result > 0) {
			  msg = "QNA 등록 성공!";
			  loc = "/QNA/QNADetail.do?qno="+qno;
//			  loc = "/QNA/QNAList.do";
		}else {
			msg ="QNA 등록 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
}
	
	@RequestMapping("/QNA/QNADetail.do")
	public String selectOne(@RequestParam int qno, Model model) {
		QNA q = qnaService.selectOneQNA(qno);
		
		model.addAttribute("qna", q);
		
		return "QNA/QNA_Detail";
		
	}
	
	@RequestMapping("/QNA/QNAUpdateView.do")
	public String QNAUpdateView(@RequestParam int qno, Model model) {
		
		model.addAttribute("qna", qnaService.selectOneQNA(qno));
		
		return "QNA/QNA_Update";
	}
	
	@RequestMapping("/QNA/QNAUpdate.do")
	public String QNAUpdate(QNA qna, HttpSession session, Model model) {
		
		int qNo = qna.getQno();
		
		System.out.println("QNA번호왔냐?" + qNo);
		
		QNA originQNA = qnaService.selectOneQNA(qNo);
		
		System.out.println("원본 QNA" + originQNA);
		
		originQNA.setQTitle(qna.getQTitle());
		originQNA.setQContent(qna.getQContent());
		
		int result = qnaService.updateQNA(originQNA);
		qna = qnaService.selectOneQNA(qna.getQno());
		
		String loc ="/QNA/QNAList.do";
		String msg ="";
		
		if(result >0) {
			msg = "게시글 수정 성공!";
		}else {
			msg ="게시글 수정 실패!";
		}
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/QNA/QNADelete.do")
	public String QNADelete(@RequestParam int qno, HttpSession session, Model model) {
		int result = qnaService.deleteQNA(qno);
		
		String loc = "/QNA/QNAList.do";
		String msg ="";
		
		  if(result > 0) {
		         msg = "QNA 삭제 성공!";
		         
		      } else {
		         msg = "QNA 삭제 실패!";
		      }
		   model.addAttribute("loc", loc).addAttribute("msg", msg);
		   
		   System.out.println("Model받아오나: " +model);
		   
		   return "common/msg";
	}
	
	@RequestMapping("/QNA/QNAPassword.do")
	public String pwdQNA(@RequestParam int qno, Model model) {

		model.addAttribute("qno", qno);
		
		return "QNA/QNAPassword";
		
	}
	
	@RequestMapping("/QNA/QNASelectOnePassword.do")
	public String selectOneQNAPwd(@RequestParam int qno, @RequestParam String checkPwd, Model model, HttpSession session) {
		
		String msg="";
		String loc ="";
		
		QNA q = qnaService.selectOneQNA(qno);
		
		System.out.println(session.getAttribute("member"));
		Member m =(Member)session.getAttribute("member");
		
		System.out.println("qwriter: " + q.getQWriter() );
		System.out.println("userid : "+ m.getUserId() );
		System.out.println("checkPwd : " + checkPwd);
		System.out.println("userpwd : "+ m.getUserPwd());
		
		System.out.println("복호화 후  : " +  bcryptPasswordEncoder.matches(checkPwd, m.getUserPwd()));
		if(q.getQWriter().equals( m.getUserId()) && bcryptPasswordEncoder.matches(checkPwd, m.getUserPwd())) {
			System.out.println("비번가져오나: " + m.getUserPwd());
			
			msg= "입력 성공!";
			loc = "/QNA/QNADetail.do?qno=" +q.getQno();
			
			System.out.println(m);
		}else if(checkPwd.trim().length()!=0) {
			msg ="비밀번호가 틀렸습니다.";
			loc="/QNA/QNAList.do";
		}else {
			msg ="입력 실패!";
			loc="/QNA/QNAList.do";
		}
		
		model.addAttribute("msg", msg).addAttribute("loc", loc).addAttribute("qna", q);
		
		return "common/msg";
	}
	
	@RequestMapping("/QNA/QNASelectOneAdmin.do")
	public String selectOneAdmin(@RequestParam int qno, Model model) {
		QNA q = qnaService.selectOneQNA(qno);
		
		model.addAttribute("qna", q);
		
		return "QNA/QNA_Detail";
	}
	
	
	
}
