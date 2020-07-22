package com.kh.bunny.auction.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.bunny.auction.model.vo.Auction;

public interface AuctionDAO {

	List<Map<String, String>> selectAuctionList(int aPage, int numPerPage);

	int selectAuctionTotalContents();

	int selectBidderCount(HashMap<String, Object> hmap);

	Auction selectOneAuction(int pno);

	int bidderCount(int pno);

}
