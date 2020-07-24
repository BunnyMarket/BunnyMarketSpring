package com.kh.bunny.member.model.dao;

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
	public boolean email_check(String email) throws Exception {
		 email
	        =sqlSession.selectOne("member.email_check", email);
	    
	        //조건식 ? true일때의 값 : false일때의 값
	        return (email==null) ? true : false;
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
	
	
	
	
	
	
	
	
}
