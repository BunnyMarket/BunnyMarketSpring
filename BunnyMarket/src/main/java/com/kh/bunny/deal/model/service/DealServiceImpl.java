package com.kh.bunny.deal.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.deal.model.dao.DealDAO;
import com.kh.bunny.deal.model.vo.Deal;

@Service("productService")
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


}
