package com.kh.bunny.auction.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.bunny.auction.model.vo.Auction;
import com.kh.bunny.auction.model.vo.Bidder;
import com.kh.bunny.product.model.vo.PComment;
import com.kh.bunny.product.model.vo.Product;

public interface AuctionService {

	static int AUCTION_SERVICE_ERROR = 0;
	static int AUCTION_SERVICE_COMPLETE = 1;
	
	List<Map<String, String>> selectAuctionList(int aPage, int numPerPage);

	int selectAuctionTotalContents();

	int selectBidderCount(int pno);

	Auction selectOneAuction(int pno);

	int insertAuction(Auction auction);

	int insertBidder(Bidder b);

	int selectOneBidderCount(int pno);

	ArrayList<Bidder> selectAllBidder(int pno);

	List<Map<String, String>> selectTradeList(int aPage, int numPerPage,String nickName);
	
	int selectTradeTotalContents(String nickName);

	List<Map<String, String>> completeAuctionList(int aPage, int numPerPage, String nickName);

	int selectCompleteAuctionTotalContents(String nickName);

	List<Map<String, String>> sellCompleteAuctionList(int aPage, int numPerPage, String nickName);

	List<Map<String, String>> selectAuctionTypeList(int aPage, int numPerPage, Map<String, Integer> conditionMap);

	int selectAuctionTypeTotalContents(Map<String, Integer> conditionMap);

	List<Map<String, String>> goTradeAuction(int aPage, int numPerPage, String nickName);

	List<Integer> selectTypeCount();

	List<Auction> selectAuctionTopList();
}
