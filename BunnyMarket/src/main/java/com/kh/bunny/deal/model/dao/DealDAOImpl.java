package com.kh.bunny.deal.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.deal.model.vo.Deal;
import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.product.model.vo.Product;

@Repository("DealDAO")
public class DealDAOImpl implements DealDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Object> selectDealList(String userId) {
		return sqlSession.selectList("dealMapper.selectDealList", userId);
	}

	@Override
	public Deal selectOneDeal(int dno) {
		return sqlSession.selectOne("dealMapper.selectOneDeal", dno);
	}

	@Override
	public int updateBuyerDeal(Deal deal) {
		return sqlSession.update("dealMapper.updateBuyerDeal", deal);
	}

	@Override
	public int updateSellerDeal(Deal deal) {
		return sqlSession.update("dealMapper.updateSellerDeal", deal);
	}

	@Override
	public Product selectOneProduct(int pno) {
		return sqlSession.selectOne("dealMapper.selectOneProduct", pno);
	}

	@Override
	public Member selectOtherMember(String userId) {
		return sqlSession.selectOne("dealMapper.selectOtherMember", userId);
	}
	
	@Override
	public List<Map<String, String>> selectDealList (int cPage, int numPerPage){
		return sqlSession.selectList("dealMapper.selectAdminDealList");
	}
	
	@Override
	public int selectDealTotalContents() {
		return sqlSession.selectOne("dealMapper.selectadminDealTotalContent");
	}
	
	@Override
	public int selectdealRefund(Deal deal) {
		return sqlSession.update("dealMapper.updateBuyerRefund", deal);
	}

	@Override
	public List<Object> searchDealList(String keyword, String condition, int pPage, int numPerPage) {
		HashMap<Object, Object> hmap = new HashMap<>();
		RowBounds rows = new RowBounds((pPage-1)*numPerPage, numPerPage);
		
		hmap.put("keyword", keyword);
		hmap.put("condition", condition);
	
		return sqlSession.selectList("dealMapper.searchDealList", hmap, rows);
	
	}

	@Override
	public int selectSDealTotalContents(String keyword, String condition) {
		HashMap<Object, Object> hmap = new HashMap<>();
		hmap.put("keyword", keyword);
		hmap.put("condition", condition);
		
		return sqlSession.selectOne("dealMapper.selectSDealTotalContent", hmap);

	}
}
