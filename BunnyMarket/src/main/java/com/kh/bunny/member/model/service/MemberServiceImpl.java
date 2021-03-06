package com.kh.bunny.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.member.model.dao.MemberDAO;
import com.kh.bunny.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int insertMember(Member m) {
		return memberDAO.insertMember(m);
	}

	@Override
	public Member selectOne(String userId) {
		return memberDAO.selectOne(userId);
	}

	@Override
	public int updateMember(Member m) {
		return memberDAO.updateMember(m);
	}

	@Override
	public int deleteMember(String userId) {
		return memberDAO.deleteMember(userId);
	}

	@Override
	public int checkIdDuplicate(String userId) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("userId", userId);
		
		return memberDAO.checkIdDuplicate(hmap);
	}




	@Override
	public Member findId(Member m) {
		
		return memberDAO.findId(m);
	}

	@Override
	public int pwdUpdate(Member m) {
		
		return memberDAO.pwdUpdate(m);
	}

	@Override
	public int idDupCheck(String userId) {
		
		return memberDAO.idDupCheck(userId);
	}

	@Override
	public int nickDupCheck(String nickName) {
		
		return memberDAO.nickDupCheck(nickName);
	}

	@Override
	public int emailDupCheck(String email) {

		return memberDAO.emailDupCheck(email);
	}

	@Override
	public int phoneDupCheck(String phone) {

		return memberDAO.phoneDupCheck(phone);
	}

	@Override
	public ArrayList<Member> findSeller(String nickName) {
		
		return memberDAO.findSeller(nickName);
	}

	@Override
	public Member findSeller2(String nickName) {
		
		return memberDAO.findSeller2(nickName);
	}
	

	//admin
	@Override
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage) {
		
		return memberDAO.selectMemberList(cPage, numPerPage);
	}

	@Override
	public int selectMemberTotalContents() {
		
		return memberDAO.selectMemberTotalContents();
	}
	
	@Override
	public int selectOneCountUp(String userId) {
//		HashMap<String, Object> hmap = new HashMap<>();
//		hmap.put("userId", userId);
		System.out.println("service : " + userId);
		return memberDAO.selectOneCountUp(userId);
	}
	
	@Override
	public int selectOneCountDown(String userId) {

		System.out.println("service : " + userId);
		return memberDAO.selectOneCountDown(userId);
	}

	@Override
	public Object findPwdUserId(String email) {
		
		return memberDAO.findPwdUserId(email);
	}
	
	@Override
	public List<Object> searchMemberList(String keyword, String condition, int pPage, int numPerPage) {
		return  memberDAO.searchMemberList(keyword, condition, pPage, numPerPage);
	}

	@Override
	public int selectSMemberTotalContents(String keyword, String condition) {
		return memberDAO.selectSMemberTotalContents(keyword, condition);
	}

	

	
	
}







