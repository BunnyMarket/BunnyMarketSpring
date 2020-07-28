package com.kh.bunny.member.model.dao;

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
	
	public boolean email_check(String email) throws Exception;    //이메일 중복 확인

	
	// admin
	List<Map<String, String>> selectMemberList(int cPage, int numPerPage);

	int selectMemberTotalContents();

	int selectOneCountUp(String userId);
	
	int selectOneCountDown(String userId);
	
	
}
