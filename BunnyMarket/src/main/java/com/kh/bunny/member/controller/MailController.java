package com.kh.bunny.member.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bunny.member.model.service.MemberService;
import com.kh.bunny.member.model.service.MemberServiceImpl;
import com.kh.bunny.member.model.vo.Member;

@Controller
public class MailController {

	@Autowired
	private MailSender mailSender;
	
	@RequestMapping(value="/member/mailAuth.do" ,produces="text/plain;charset=utf-8")
	@ResponseBody
	public String emailAuth(@RequestParam("email") String email) {
	  
	        
	    String authNum = "";
	        
	    System.out.println(email);
	    authNum = randomNum();
	    //가입승인에 사용될 인증키 난수 발생    
	    sendEmail(email, authNum);
	    //이메일전송
	    String str = authNum;
	        
	        
	    return str;
	}
	
	
	    
	
	// 난수 발생 메소드
	private String randomNum() {
	    StringBuffer buffer = new StringBuffer();
	        
	    for( int i = 0 ; i <= 6 ; i++) {
	        int n = (int)(Math.random()*10);
	        buffer.append(n);
	    }
	        
	    return buffer.toString();
	}
	 
	public void sendEmail(String email , String authNum ) {
	    //이메일 발송 메소드
	    SimpleMailMessage mailMessage = new SimpleMailMessage();
	    mailMessage.setSubject("[인증] BUNNY 서비스 회원가입 인증메일입니다.");
	    mailMessage.setFrom("maybeaprils@naver.com");
	    mailMessage.setText("환영합니다! 우측 인증번호를 입력해주세요. [ "+authNum+" ]");
	    mailMessage.setTo(email);
	    try {
	        mailSender.send(mailMessage);
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	}
	
	public void sendId(String email, String userId) {
		
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setSubject("[아이디찾기] BUNNY 마켓 아이디찾기 결과입니다. ");
		mailMessage.setFrom("maybeaprils@naver.com");
	    mailMessage.setText("아이디찾기 결과입니다. 아이디 : ["+userId+"]" );
	    mailMessage.setTo(email);
	    try {
	        mailSender.send(mailMessage);
	    } catch (Exception e) {
	        System.out.println(e);
	    }
		
	}
	
	
	
	
}
