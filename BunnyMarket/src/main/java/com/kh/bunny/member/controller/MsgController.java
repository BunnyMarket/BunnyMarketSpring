package com.kh.bunny.member.controller;
//Install the Java helper library from twilio.com/docs/java/install
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller	
public class MsgController {
	
	@RequestMapping("member/sendMsg.do")
	@ResponseBody
	/*
	 * public String sendMsg(@RequestParam String phone){
	 * 
	 * 
	 * String ACCOUNT_SID = "AC49cdf142933bcfec8d3fb7007dfa54cf"; String AUTH_TOKEN
	 * = "46b4b284d314dcdb6127a0dd43e13987"; String verifyNum = randomNum();
	 * Twilio.init(ACCOUNT_SID, AUTH_TOKEN); Message message = Message.creator( new
	 * com.twilio.type.PhoneNumber(phone), new
	 * com.twilio.type.PhoneNumber("+13343260797"), verifyNum) .create();
	 * 
	 * 
	 * 
	 * return verifyNum; }
	 */
	
	private String randomNum() {
	    StringBuffer buffer = new StringBuffer();
	        
	    for( int i = 0 ; i < 4 ; i++) {
	        int n = (int)(Math.random()*10);
	        buffer.append(n);
	    }
	        
	    return buffer.toString();
	}
	    
	
}
