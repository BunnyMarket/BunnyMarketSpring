package com.kh.bunny.deal.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.deal.model.dao.DealDAO;
import com.kh.bunny.deal.model.vo.Deal;
import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.product.model.vo.Product;

@Service("dealService")
public class DealServiceImpl implements DealService {

	@Autowired
	DealDAO dealDAO;
	
	@Override
	public List<Object> selectDealList(String userId) {
		return dealDAO.selectDealList(userId);
	}

	@Override
	public Deal selectOneDeal(int dno) {
		return dealDAO.selectOneDeal(dno);
	}

	@Override
	public int updateBuyerDeal(Deal deal) {
		return dealDAO.updateBuyerDeal(deal);
	}

	@Override
	public int updateSellerDeal(Deal deal) {
		return dealDAO.updateSellerDeal(deal);
	}

	@Override
	public Product selectOneProduct(int pno) {
		return dealDAO.selectOneProduct(pno);
	}

	@Override
	public Member selectOtherMember(String userId) {
		return dealDAO.selectOtherMember(userId);
	}

	@Override
	public List<Map<String, String>> selectDealList (int cPage, int numPerPage){
		return dealDAO.selectDealList(cPage, numPerPage);
	}

	@Override
	public int selectDealTotalContents() {
		return dealDAO.selectDealTotalContents();
	}
	@Override
	public int selectdealRefund(Deal deal) {
		return dealDAO.selectdealRefund(deal);
	}
}
