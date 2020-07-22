package com.kh.bunny.auction.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bunny.auction.model.vo.Auction;

public interface AuctionService {

	List<Map<String, String>> selectAuctionList(int aPage, int numPerPage);

	int selectAuctionTotalContents();

	int selectBidderCount(int pno);

	Auction selectOneAuction(int pno);

	int insertAuction(Auction auction);

}
