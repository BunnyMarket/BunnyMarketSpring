package com.kh.bunny.auction.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.auction.model.dao.AuctionDAO;
import com.kh.bunny.auction.model.exception.AuctionException;
import com.kh.bunny.auction.model.vo.Auction;
import com.kh.bunny.auction.model.vo.Bidder;

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
		int result = 0;
		int pno = 0;
		
		try {
			
			result = auctionDAO.insertProduct(auction);
			if(result == AUCTION_SERVICE_ERROR) throw new AuctionException("상품에서 문제발생함");
	        System.out.println("상품 옥션 : " + auction);
			pno = auction.getPno();
			
			result = auctionDAO.insertAuction(auction);
			System.out.println("그냥 옥션 : " + auction);
			if(result == AUCTION_SERVICE_ERROR) throw new AuctionException("옥션에서 문제발생함");
			
		} catch (Exception e) {
			System.out.println("문제가 발생한 옥션 : " + auction);
			throw new AuctionException("인서트 하다 문제발생함" + e.getMessage());
		}
		
		return result;
	}

	@Override
	public int insertBidder(Bidder b) {
		return auctionDAO.insertBidder(b);
	}

	@Override
	public int selectOneBidderCount(int pno) {
		return auctionDAO.selectOneBidderCount(pno);
	}

	@Override
	public ArrayList<Bidder> selectAllBidder(int pno) {
		return auctionDAO.selectAllBidder(pno);
	}

	
}
