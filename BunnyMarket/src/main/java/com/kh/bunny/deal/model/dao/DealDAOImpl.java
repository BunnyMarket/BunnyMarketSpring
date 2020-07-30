package com.kh.bunny.deal.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.deal.model.vo.Deal;

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

	
}
