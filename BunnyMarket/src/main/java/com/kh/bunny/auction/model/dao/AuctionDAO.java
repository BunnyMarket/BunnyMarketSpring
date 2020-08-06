package com.kh.bunny.auction.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.bunny.auction.model.vo.Auction;
import com.kh.bunny.auction.model.vo.Bidder;
import com.kh.bunny.product.model.vo.PComment;
import com.kh.bunny.product.model.vo.Product;

public interface AuctionDAO {

	List<Map<String, String>> selectAuctionList(int aPage, int numPerPage);

	int selectAuctionTotalContents();

	int selectBidderCount(HashMap<String, Object> hmap);

	Auction selectOneAuction(int pno);

	int insertProduct(Auction auction);

	int insertAuction(Auction auction);
	
	int updateCount(int pno);

	int insertBidder(Bidder b);

	int selectOneBidderCount(int pno);

	int hasBidderCount(String string);

	List<Map<String, String>> selectAuctionListAddBidder(int aPage, int numPerPage);

	ArrayList<Bidder> selectAllBidder(int pno);
	
	List<Map<String, String>> selectTradeList(int aPage, int numPerPage,String nickName);
	
	int selectTradeTotalContents(String nickName);

	int updateBeforeBidderMember(int pno);

	int updateBeforeBidder(int pno);

	int updateBeforeUsedPoint(int pno);

	List<Map<String, String>> completeAuctionList(int aPage, int numPerPage, String nickName);

	int selectCompleteAuctionTotalContents(String nickName);

	List<Map<String, String>> sellCompleteAuctionList(int aPage, int numPerPage, String nickName);

	List<Map<String, String>> selectAuctionTypeList(int aPage, int numPerPage, Map<String, Integer> conditionMap);

	int selectAuctionTypeTotalContents(Map<String, Integer> conditionMap);
	
	List<Map<String, String>> goTradeAuction(int aPage, int numPerPage, String nickName);

	Integer selectTypeCount(int pcno);

	List<Auction> selectAuctionTopList();

	
}
