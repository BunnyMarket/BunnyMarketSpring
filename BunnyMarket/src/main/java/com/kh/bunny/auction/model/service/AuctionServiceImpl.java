package com.kh.bunny.auction.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.auction.model.dao.AuctionDAO;
import com.kh.bunny.auction.model.vo.Auction;

@Service("auctionService")
public class AuctionServiceImpl implements AuctionService {

	@Autowired
	AuctionDAO auctionDAO;
	
	@Override
	public List<Map<String, String>> selectAuctionList(int aPage, int numPerPage) {
		return auctionDAO.selectAuctionList(aPage, numPerPage);
	}

	@Override
	public int selectAuctionTotalContents() {
		return auctionDAO.selectAuctionTotalContents();
	}
	
	@Override
	public int selectBidderCount(int pno) {
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("pno", pno);
		
		return auctionDAO.selectBidderCount(hmap);
	}

	@Override
	public Auction selectOneAuction(int pno) {
		return auctionDAO.selectOneAuction(pno);
	}

	@Override
	public int insertAuction(Auction auction) {
		return auctionDAO.insertAuction(auction);
	}

	
}
