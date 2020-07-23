package com.kh.bunny.member.model.service;

import java.util.List;

import com.kh.bunny.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member m);
	
	Member selectOne(String userId);
	
	int updateMember(Member m);
	
	int deleteMember(String userId);
	
	int checkIdDuplicate(String userId);

	
	 public boolean email_check(String email) throws Exception;    //이메일 중복확인을 하는 메소드

	
	 
	 
	
}
