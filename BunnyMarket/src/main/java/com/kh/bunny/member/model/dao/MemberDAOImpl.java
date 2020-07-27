package com.kh.bunny.member.model.dao;

import java.util.HashMap;

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

	

	
	
	
	
	
	
	
	
	
	
	
	
	
}
