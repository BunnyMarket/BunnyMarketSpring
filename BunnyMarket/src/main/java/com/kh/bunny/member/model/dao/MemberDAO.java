package com.kh.bunny.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.bunny.member.model.vo.Member;

public interface MemberDAO {
	
	// 인터페이스에서 public 은 생략 가능
	int insertMember(Member m);
	
	Member selectOne(String userId);
	
	int updateMember(Member m);
	
	int deleteMember(String userId);
	
	int checkIdDuplicate(HashMap<String, Object> hmap);
	
	  

	Member findId(Member m);

	int pwdUpdate(Member m);

	int idDupCheck(String userId);

	int nickDupCheck(String nickName);

	int emailDupCheck(String email);

	int phoneDupCheck(String phone);

	ArrayList<Member> findSeller(String nickName);

	Member findSeller2(String nickName);

	// admin
	List<Map<String, String>> selectMemberList(int cPage, int numPerPage);

	int selectMemberTotalContents();

	int selectOneCountUp(String userId);
	
	int selectOneCountDown(String userId);

	Object findPwdUserId(String email);

	
	
	
}
