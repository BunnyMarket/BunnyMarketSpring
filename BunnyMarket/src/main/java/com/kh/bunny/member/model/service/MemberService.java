package com.kh.bunny.member.model.service;

import java.util.List;

import com.kh.bunny.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member m);
	
	Member selectOne(String userId);
	
	int updateMember(Member m);
	
	int deleteMember(String userId);
	
	int checkIdDuplicate(String userId);

	
	

	Member findId(Member m);

	int pwdUpdate(Member m);

	int idDupCheck(String userId);

	int nickDupCheck(String nickName);

	int emailDupCheck(String email);

	int phoneDupCheck(String phone);


	
	 
	 
	
}
