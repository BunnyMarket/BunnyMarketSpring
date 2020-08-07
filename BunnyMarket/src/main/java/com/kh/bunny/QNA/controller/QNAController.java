package com.kh.bunny.QNA.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bunny.QNA.model.exception.QNAException;
import com.kh.bunny.QNA.model.service.QNAService;
import com.kh.bunny.QNA.model.vo.QComment;
import com.kh.bunny.QNA.model.vo.QNA;
import com.kh.bunny.adminMember.model.vo.adminMember;
import com.kh.bunny.common.util.AdminUtils;
import com.kh.bunny.common.util.Utils;
import com.kh.bunny.member.model.service.MemberService;
import com.kh.bunny.member.model.vo.Member;

@Controller
public class QNAController {

	@Autowired
	QNAService qnaService;

	@Autowired
	MemberService memberService;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("/QNA/QNAList.do")
	public String selectQNAList(@RequestParam(value = "pPage", required = false, defaultValue = "1") int cPage,
			Model model, HttpServletRequest request, HttpSession session) {
		
		Member m = (Member)session.getAttribute("member");
		String userId = m.getNickName();
			
		// 한 페이지 당 게시글 수
		int numPerPage = 10;

		List<Map<String, String>> list = qnaService.selectQNAList(cPage, numPerPage, userId);

		/*
		 * System.out.println("qnaList 가져오는지 확인: " + list);
		 */
		int totalContents = qnaService.selectQNATotalContents(userId);

		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "QNAList.do");
		
		model.addAttribute("list", list).addAttribute("totalContents", totalContents)
				.addAttribute("numPerPage", numPerPage).addAttribute("pageBar", pageBar);
		
		/* System.out.println("model : " + model); */
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
		} catch (Exception e) {
			throw new QNAException("QNA 등록 오류!" + e.getMessage());
		}

		String loc = "QNA/QNAList.do";
		String msg = "";

		if (result > 0) {
			msg = "QNA 등록 성공!";
			loc = "/QNA/QNADetail.do?qno=" + qno;
//			  loc = "/QNA/QNAList.do";
		} else {
			msg = "QNA 등록 실패!";
		}

		model.addAttribute("loc", loc).addAttribute("msg", msg);

		return "common/msg";
	}

	@RequestMapping("/QNA/QNADetail.do")
	public String selectOne(@RequestParam int qno, Model model,HttpSession session) {
		
		QNA q = qnaService.selectOneQNA(qno);

        
		List<Object> QComments = qnaService.selectQCommentList(qno);
		System.out.println("qcomments: " + QComments);
		System.out.println("qcomments : " + QComments.size());
		
		model.addAttribute("qna", q)
				   .addAttribute("qcomments", QComments)
				   .addAttribute("qcommentSize", QComments.size());

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

		String loc = "/QNA/QNAList.do";
		String msg = "";

		if (result > 0) {
			msg = "게시글 수정 성공!";
		} else {
			msg = "게시글 수정 실패!";
		}
		model.addAttribute("loc", loc).addAttribute("msg", msg);

		return "common/msg";
	}

	@RequestMapping("/QNA/QNADelete.do")
	public String QNADelete(@RequestParam int qno, HttpSession session, Model model) {
		int result = qnaService.deleteQNA(qno);

		String loc = "/QNA/QNAList.do";
		String msg = "";

		if (result > 0) {
			msg = "QNA 삭제 성공!";

		} else {
			msg = "QNA 삭제 실패!";
		}
		model.addAttribute("loc", loc).addAttribute("msg", msg);

		System.out.println("Model받아오나: " + model);

		return "common/msg";
	}

	@RequestMapping("/QNA/QNAPassword.do")
	public String pwdQNA(@RequestParam int qno, Model model) {

		model.addAttribute("qno", qno);

		return "QNA/QNAPassword";

	}

	@RequestMapping("/QNA/QNASelectOnePassword.do")
	public String selectOneQNAPwd(@RequestParam int qno, @RequestParam String checkPwd, Model model,
			HttpSession session) {

		String msg = "";
		String loc = "";

		QNA q = qnaService.selectOneQNA(qno);

		System.out.println(session.getAttribute("member"));
		Member m = (Member) session.getAttribute("member");

		System.out.println("qwriter: " + q.getQWriter());
		System.out.println("userid : " + m.getNickName());
		System.out.println("checkPwd : " + checkPwd);
		System.out.println("userpwd : " + m.getUserPwd());

		System.out.println("복호화 후  : " + bcryptPasswordEncoder.matches(checkPwd, m.getUserPwd()));
		if (q.getQWriter().equals(m.getNickName()) && bcryptPasswordEncoder.matches(checkPwd, m.getUserPwd())) {
			System.out.println("비번가져오나: " + m.getUserPwd());

			msg = "입력 성공!";
			loc = "/QNA/QNADetail.do?qno=" + q.getQno();

			System.out.println(m);
		} else if (checkPwd.trim().length() != 0) {
			msg = "비밀번호가 틀렸습니다.";
			loc = "/QNA/QNAList.do";
		} else {
			msg = "입력 실패!";
			loc = "/QNA/QNAList.do";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc).addAttribute("qna", q);

		return "common/msg";
	}

	@RequestMapping("/QNA/QNASelectOneAdmin.do")
	public String selectOneAdmin(@RequestParam int qno, Model model,HttpSession session) {
		
		QNA q = qnaService.selectOneQNA(qno);
		model.addAttribute("qna", q);

		return "QNA/QNA_Detail";
	}

	@RequestMapping("/QNA/FAQ.do")
	public String FAQ() {
		return "QNA/FAQ";
	}

	@RequestMapping("/QNA/QNAImgInsert.do")
	@ResponseBody
	public String auctionImgInsert(@RequestParam(value = "file", required = false) MultipartFile[] file, Model model,
			HttpSession session) {

		String saveDir = session.getServletContext().getRealPath("resources/upload/qna/desc");

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

		return "http://localhost:8088/bunny/resources/upload/qna/desc/" + renamedName;
	}

	// 댓글 생성
		@RequestMapping("/QNA/qcommentInsert.do")
		public String qcommentInsert(@RequestParam int qno,
											QComment qcomment, Model model, HttpSession session) {
			
			adminMember am = (adminMember)session.getAttribute("admin");
			Member m = (Member)session.getAttribute("member");
			
			String userImg ="";
			if(m != null) {String userId = m.getNickName();
							qcomment.setQWriter(userId);
							userImg = m.getPhoto();
			}else if(am != null ){
				String adminId = am.getAdminId();
				qcomment.setQWriter(adminId);		
			}
			
			System.out.println("userImg : " + userImg);
			
			System.out.println("댓글아 달아졌니" + qcomment);
			String msg = "";
			String loc ="/QNA/QNADetail.do?qno=" + qcomment.getQno();
			
			 try {
			int result = qnaService.insertQComment(qcomment);
			
			if(result > 0) {
				msg ="댓글 달기 성공!";
			}else {
				msg = "댓글 달기 실패,,,";
			}
			
		  }catch(Exception e) {
			  throw new QNAException("QNA 댓글에서 에러 발생!" + e.getMessage());
		  }
		  
		  model.addAttribute("loc", loc)
		  		     .addAttribute("msg", msg).addAttribute("userImg", userImg);
		  
		  return "common/msg";
		  		
			
		}
	
	// 댓글 수정하기
	@RequestMapping("/QNA/qcommentUpdate.do")
	@ResponseBody
	public HashMap<String, Object> qcommentUpdate(QComment qcomment) {
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		boolean updateCheck = false;
		
		try {
			updateCheck = qnaService.updateQComment(qcomment) > 0 ? true:false;
		}catch(Exception e) {
			throw new QNAException();
		}
		
		hmap.put("updateCheck", updateCheck);
		
		return hmap;
	}
	
	// 댓글 삭제하기
	@RequestMapping("/QNA/qcommentDelete.do")
	public String qcommentDelete(QComment qcomment, Model model) {
		
		String msg ="";
		String loc ="/QNA/QNADetail.do?qno=" + qcomment.getQno();
		System.out.println("qno 내놔 : " + qcomment.getQno());
		try {
			
			boolean hasReply = qnaService.selectOneReplyQcno(qcomment.getQcno()) > 0 ? true:false;
			if(hasReply ==true) {
				msg = "대댓글이 있어서 삭제가 불가능합니다.";
			}else {
				
				int result = qnaService.deleteQComment(qcomment.getQcno());
				
				if(result > 0 && hasReply == false) {
					msg = "댓글 삭제 성공!";
				}else {
					msg = "에러 발생!(댓글 삭제 실패)";
				}
			}
		}catch(Exception e) {
			throw new QNAException("QNA 댓글에서 에러 발생!" + e.getMessage());
		}
		
		model.addAttribute("loc", loc)
		           .addAttribute("msg", msg);
		
		return "common/msg";
	}
	
//	@RequestMapping("/admin/QNA/QnAList.do")
//	public String selectAdminQnAList(@RequestParam(value = "pPage", required = false, defaultValue = "1") int cPage,
//			Model model, HttpServletRequest request) {
//
//		int numPerPage = 10;
//
//		List<Map<String, String>> list = qnaService.selectQnAList(cPage, numPerPage);
//
//		int totalContents = qnaService.selectQNATotalContents();
//
//		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "QnAList.do");
//		
//		model.addAttribute("list", list).addAttribute("totalContents", totalContents)
//				.addAttribute("numPerPage", numPerPage).addAttribute("pageBar", pageBar);
//		
//		System.out.println("model : " + model);
//		return "admin/QnAList";
//
//	}
	
	@RequestMapping(value = "/admin/QnA/searchQnA.do", method = RequestMethod.GET)
	public String searchQnA(@RequestParam(value= "keyword", required = false, defaultValue = "") String keyword, 
								@RequestParam (value= "condition", required = false, defaultValue = "") String condition, 
								Model model,
								@RequestParam(value = "pPage", required = false, defaultValue = "1") int pPage) {
		
		int numPerPage = 15; // 10개씩 나오도록 
		List<Object> list = qnaService.searchQnAList(keyword, condition, pPage, numPerPage);

		
		// 페이지 계산을 위한 총 페이지 개수 
		int totalContents =  qnaService.selectSQnATotalContents(keyword, condition);
		
		System.out.println("totalContents : " + totalContents);
		
		String pageBar = AdminUtils.getPageBar(totalContents, 
												pPage, 
												numPerPage, 
												"/admin/QnA/searchQnA.do?condition="+condition+"&keyword=" + keyword);
		
		
		model.addAttribute("keyword", keyword)
		.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("pageBar", pageBar);
		
		return "admin/QnAList";	
	}

	
}
