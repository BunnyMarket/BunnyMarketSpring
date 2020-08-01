package com.kh.bunny.adminMember.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bunny.adminMember.model.service.AdminService;
import com.kh.bunny.adminMember.model.vo.adminMember;
import com.kh.bunny.common.util.Utils;
import com.kh.bunny.member.model.exception.MemberException;

@SessionAttributes(value = { "admin" })
@Controller
public class adminMemberController {

	@Autowired
	AdminService adminService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/admin/main/home.do")
	public String goHome() {
		return "admin/dashboard";
	}
	
	// 리스트
	@RequestMapping("/admin/adminMember/adminList.do")
	public String selectAdminList(
			 @RequestParam(
					 value="pPage",
					 required=false, 
					 defaultValue="1")
				int cPage, Model model
			) {
		int numPerPage = 10; 
		
		List<Map<String, String>> list 
			= adminService.selectAdminList(cPage, numPerPage);
	
		int totalContents = adminService.selectAdminTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "adminList.do");
		
	
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage",numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		
		return "admin/member/adminMember";
	}
	
	// 죽이기
	@RequestMapping("/admin/adminMember/adminStatusOn.do")
	@ResponseBody
	public Map<String, Object> adminStatusOn(@RequestParam String userId) {
		System.out.println("controller : " + userId);

		Map<String, Object> map = new HashMap<String, Object>();
		boolean adminKill =adminService.selectOneStatusOn(userId) > 0 ? true : false;
		
		map.put("kill", adminKill);
		
		return map; 
	}
	
	// 살리기
	@RequestMapping("/admin/adminMember/adminStatusOff.do")
	@ResponseBody
	public Map<String, Object> adminStatusOff(@RequestParam String userId) {
		System.out.println("controllercd : " + userId);

		Map<String, Object> map = new HashMap<String, Object>();
		boolean adminSave =adminService.selectOneStatusOff(userId) > 0 ? true : false;
		
		map.put("save", adminSave);
		
		return map; 
	}
	
	// 회원가입 기능
	@RequestMapping("/admin/adminMember/adminInsert.do")
	public String adminInsert(adminMember adminMember, Model model) {
		
		String plainPassword = adminMember.getAdminPw();
		System.out.println("비밀번호 암호화 전 : " + plainPassword);
		
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword);
		System.out.println("비밀번호 암호화 후 : " + encryptPassword);
		
		adminMember.setAdminPw(encryptPassword);
		
		String loc = "/admin/adminMember/adminList.do";
		String msg = "";
		
		try {
			int result = adminService.insertadminMember(adminMember);			
			
			if (result > 0) {
				msg = "관리자 등록 성공"; 
			} else {
				msg = "관리자 등록 실패";
			}
			
		} catch (Exception e) {
			throw new MemberException();
		}
		model.addAttribute("loc", loc).addAttribute("msg", msg);
	
		return "common/msg";
	}

	// 로그인 뷰
	@RequestMapping("/admin/adminLoginCheck.do")
	public String adminLog(HttpSession session, Model model) {
		String loc ="";
		String msg = "";
		
		if((adminMember)session.getAttribute("admin") == null) {
			loc ="/admin/adminLogin.do";
			msg="로그인 해주세요.";
		}else {
			loc="/admin/main/home.do";
			msg="로그인이 되어있습니다.";
		}
		
		model.addAttribute("loc",loc).addAttribute("msg", msg);

		return "common/msg";

	}
	
	@RequestMapping("/admin/adminLogin.do")
	public String adminLog() {

		return "/admin/adminLogin";

	}
	
	// 로그인
	@RequestMapping(value="/admin/adminLoginForm.do", method = RequestMethod.POST)
	public ModelAndView adminLogin(@RequestParam("adminId") String adminId , @RequestParam("adminPw") String adminPw ) {
	
	ModelAndView mav = new ModelAndView();

	try { 
		adminMember am = adminService.selectOne(adminId);
		
		String msg = "";
		String loc = "";

			if (am != null && bcryptPasswordEncoder.matches(adminPw, am.getAdminPw())) {
				msg = "로그인 성공!";
				loc="/admin/main/home.do";
				mav.addObject("admin", am); 
			} else {
				msg = "비밀번호가 틀렸습니다!";
				loc ="/admin/adminLogin.do";
			}
	
		mav.addObject("loc", loc);
		mav.addObject("msg", msg);

		mav.setViewName("common/msg");
		} catch (Exception e) {
			throw new MemberException(e.getMessage());
		}
	
		return mav;

		}

	// 로그아웃
	@RequestMapping(value="/admin/adminLogout.do", method=RequestMethod.POST)
	public String adminLogout(SessionStatus status,Model model,HttpSession session) {
		/*
		 * String loc=""; String msg="노우";
		 */
	
		if (!status.isComplete()) {
			status.setComplete();
			session.invalidate();
			
		}
		System.out.println("끼룩");
		/* model.addAttribute("loc", loc).addAttribute("msg",msg); */
		return "redirect:/admin/adminLogin.do";
	}
}