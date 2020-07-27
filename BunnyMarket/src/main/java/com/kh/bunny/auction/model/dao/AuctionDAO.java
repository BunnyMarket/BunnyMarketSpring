package com.kh.bunny.auction.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.bunny.auction.model.vo.Auction;
import com.kh.bunny.auction.model.vo.Bidder;

public interface AuctionDAO {

	List<Map<String, String>> selectAuctionList(int aPage, int numPerPage);

	int selectAuctionTotalContents();

	int selectBidderCount(HashMap<String, Object> hmap);

	Auction selectOneAuction(int pno);

	int insertProduct(Auction auction);

	int insertAuction(Auction auction);

	int insertBidder(Bidder b);

	int selectOneBidderCount(int pno);

	int hasBidderCount(String string);

	List<Map<String, String>> selectAuctionListAddBidder(int aPage, int numPerPage);

	ArrayList<Bidder> selectAllBidder(int pno);

}
