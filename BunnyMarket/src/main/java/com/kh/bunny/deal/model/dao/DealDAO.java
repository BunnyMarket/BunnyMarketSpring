package com.kh.bunny.deal.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.bunny.deal.model.vo.Deal;
import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.product.model.vo.Product;

public interface DealDAO {
	
	// 상품 거래 목록 가져오기 
	List<Object> selectDealList(String userId); // 사용자의 아이디에 따라서 deal에 생성된 목록 가져오기 
	
	// 상품 거래 가져오기 
	Deal selectOneDeal(int dno);
	
	// 구매자 거래 생성 
	int updateBuyerDeal(Deal deal);
	
	// 판매자 거래 생성 
	int updateSellerDeal(Deal deal);

	// 해당 거래의 상품 가져오기 
	Product selectOneProduct(int pno);

	// 상대 거래자의 정보 가져오기 
	Member selectOtherMember(String userId);
		
	List<Map<String, String>> selectDealList (int cPage, int numPerPage);
	
	int selectDealTotalContents();
	
	int selectdealRefund(Deal deal);

	List<Object> searchDealList(String keyword, String condition, int pPage, int numPerPage);

	int selectSDealTotalContents(String keyword, String condition);

}
