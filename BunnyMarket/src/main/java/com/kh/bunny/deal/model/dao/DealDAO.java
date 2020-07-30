package com.kh.bunny.deal.model.dao;

import java.util.List;

import com.kh.bunny.deal.model.vo.Deal;

public interface DealDAO {
	
	// 상품 거래 목록 가져오기 
	List<Object> selectDealList(String userId); // 사용자의 아이디에 따라서 deal에 생성된 목록 가져오기 
	
	// 상품 거래 가져오기 
	Deal selectOneDeal(int dno);
	
	// 구매자 거래 생성 
	int updateBuyerDeal(Deal deal);
	
	// 판매자 거래 생성 
	int updateSellerDeal(Deal deal);
		

}
