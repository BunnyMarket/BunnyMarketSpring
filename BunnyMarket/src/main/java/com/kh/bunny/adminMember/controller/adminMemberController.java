package com.kh.bunny.adminMember.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bunny.adminMember.model.service.AdminService;
import com.kh.bunny.adminMember.model.vo.adminMember;
import com.kh.bunny.common.util.Utils;
import com.kh.bunny.member.model.exception.MemberException;

@Controller
public class adminMemberController {

	@Autowired
	AdminService adminService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/admin/dashboard.do")
	public String goHome() {
		return "/admin/dashboard";
	}
	
	// 리스트
	@RequestMapping("/admin/adminMember/adminList.do")
	public String selectAdminList(
			 @RequestParam(
					 value="cPage",
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
	
	//회원가입 기능
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
				msg = "회원가입 성공"; 
			} else {
				msg = "회원가입 실패";
			}
			
		} catch (Exception e) {
			throw new MemberException();
		}
		model.addAttribute("loc", loc).addAttribute("msg", msg);
	
		return "common/msg";
	}
}
