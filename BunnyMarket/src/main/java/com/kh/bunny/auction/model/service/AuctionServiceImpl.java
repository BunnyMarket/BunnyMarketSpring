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
import com.kh.bunny.product.model.vo.PComment;
import com.kh.bunny.product.model.vo.Product;

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
		Auction a = auctionDAO.selectOneAuction(pno);
		
		if(a != null){
			int result = auctionDAO.updateCount(pno);
		}
		return a;
		
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
		
		int result = 0;
		
		try {
			
			result = auctionDAO.insertBidder(b);
			if(result == AUCTION_SERVICE_ERROR) throw new AuctionException("입찰 중 문제 발생");
			
			if(b.getBPrice() > 0) {
				result = auctionDAO.updateBeforeBidderMember(b.getPno());
				if(result == AUCTION_SERVICE_ERROR) throw new AuctionException("입찰 중 회원 포인트 차감 할 때 문제발생함");
				
				result = auctionDAO.updateBeforeBidder(b.getPno());
				if(result == AUCTION_SERVICE_ERROR) throw new AuctionException("입찰 중 입찰자에서 문제발생함");
				
				result = auctionDAO.updateBeforeUsedPoint(b.getPno());
				if(result == AUCTION_SERVICE_ERROR) throw new AuctionException("입찰 중 사용포인트에서 문제발생함");				
			}
			
		} catch (Exception e) {
			System.out.println("문제가 발생한 옥션 : " + b);
			throw new AuctionException("인서트 하다 문제발생함" + e.getMessage());
		}
		
		return result;
	}

	@Override
	public int selectOneBidderCount(int pno) {
		return auctionDAO.selectOneBidderCount(pno);
	}

	@Override
	public ArrayList<Bidder> selectAllBidder(int pno) {
		return auctionDAO.selectAllBidder(pno);
	}
	
	@Override
	public List<Map<String, String>> selectTradeList(int aPage, int numPerPage, String nickName) {
		
		return auctionDAO.selectTradeList(aPage, numPerPage, nickName);
	}
	
	@Override
	public int selectTradeTotalContents(String nickName) {
		return auctionDAO.selectTradeTotalContents(nickName);
	}

	@Override
	public List<Map<String, String>> completeAuctionList(int aPage, int numPerPage, String nickName) {
		return auctionDAO.completeAuctionList(aPage, numPerPage, nickName);
	}

	@Override
	public int selectCompleteAuctionTotalContents(String nickName) {
		return auctionDAO.selectCompleteAuctionTotalContents(nickName);
	}

	@Override
	public List<Map<String, String>> sellCompleteAuctionList(int aPage, int numPerPage, String nickName) {
		return auctionDAO.sellCompleteAuctionList(aPage, numPerPage, nickName);
	}

	@Override
	public List<Map<String, String>> selectAuctionTypeList(int aPage, int numPerPage, Map<String, Integer> conditionMap) {
		return auctionDAO.selectAuctionTypeList(aPage, numPerPage, conditionMap);
	}

	@Override
	public int selectAuctionTypeTotalContents(Map<String, Integer> conditionMap) {
		return auctionDAO.selectAuctionTypeTotalContents(conditionMap);

	}
	@Override
	public List<Map<String, String>> goTradeAuction(int aPage, int numPerPage, String nickName) {
		return auctionDAO.goTradeAuction(aPage, numPerPage, nickName);

	}

	@Override
	public List<Integer> selectTypeCount() {
		
		List<Integer> list = new ArrayList<Integer>();
		
		for(int i = 1; i < 8; i++) {
			list.add(auctionDAO.selectTypeCount(i));
		}
		
		return list;
	}

	@Override
	public List<Auction> selectAuctionTopList() {
		return auctionDAO.selectAuctionTopList();
	}

	
	
}
