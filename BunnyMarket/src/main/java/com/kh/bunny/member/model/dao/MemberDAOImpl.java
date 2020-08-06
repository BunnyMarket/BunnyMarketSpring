package com.kh.bunny.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.member.model.vo.Member;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	@Override
	public Member selectOne(String userId) {
		return sqlSession.selectOne("memberMapper.loginMember", userId);
	}

	@Override
	public int updateMember(Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	@Override
	public int deleteMember(String userId) {
		return sqlSession.delete("memberMapper.deleteMember", userId);
	}

	@Override
	public int checkIdDuplicate(HashMap<String, Object> hmap) {
		// 혼자 실행하고, 혼자 결과 가져오고
		sqlSession.selectOne("memberMapper.checkIdDuplicate", hmap);
		
		return (Integer)hmap.get("result");
	}

	

	@Override
	public Member findId(Member m) {
		
		return sqlSession.selectOne("memberMapper.findId",m);
	}

	@Override
	public int pwdUpdate(Member m) {
		
		return sqlSession.update("memberMapper.pwdUpdate",m);
	}

	@Override
	public int idDupCheck(String userId) {
	
		return sqlSession.selectOne("memberMapper.idDupCheck",userId);
	}

	@Override
	public int nickDupCheck(String nickName) {
		return sqlSession.selectOne("memberMapper.nickDupCheck",nickName);
	}

	@Override
	public int emailDupCheck(String email) {
	
		return sqlSession.selectOne("memberMapper.emailDupCheck",email);
	}

	@Override
	public int phoneDupCheck(String phone) {
	
		return sqlSession.selectOne("memberMapper.phoneDupCheck",phone);
	}

	@Override
	public ArrayList<Member> findSeller(String nickName) {

		return new ArrayList<Member>(sqlSession.selectList("memberMapper.findSeller",nickName));
	}

	@Override
	public Member findSeller2(String nickName) {
		return sqlSession.selectOne("memberMapper.findSeller",nickName);
	}

	//admin
	
	@Override
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("memberMapper.selectMemberList", null, rows);
	}

	@Override
	public int selectMemberTotalContents() {
		return sqlSession.selectOne("memberMapper.selectMemberTotalContents");
	}
	
	@Override
	public int selectOneCountUp(String userId) {
		System.out.println("dao : " + userId);
		return sqlSession.update("memberMapper.selectOneCountUp", userId); 
	}
	
	
	@Override
	public int selectOneCountDown(String userId) {
		System.out.println("dao : " + userId);
		return sqlSession.update("memberMapper.selectOneCountDown", userId); 
	}

	@Override
	public Object findPwdUserId(String email) {
		return sqlSession.selectOne("memberMapper.findPwdUserId", email);
	}

	
	@Override
	public List<Object> searchMemberList(String keyword, String condition, int pPage, int numPerPage) {
		HashMap<Object, Object> hmap = new HashMap<>();
		RowBounds rows = new RowBounds((pPage-1)*numPerPage, numPerPage);
		
		hmap.put("keyword", keyword);
		hmap.put("condition", condition);
	
		return sqlSession.selectList("memberMapper.searchMemberList", hmap, rows);
	}

	@Override
	public int selectSMemberTotalContents(String keyword, String condition) {
		HashMap<Object, Object> hmap = new HashMap<>();
		hmap.put("keyword", keyword);
		hmap.put("condition", condition);
		
		return sqlSession.selectOne("memberMapper.selectSMemberTotalContent", hmap);
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
