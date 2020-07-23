package com.kh.bunny.auction.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.auction.model.vo.Auction;

@Repository("auctionDAO")
public class AuctionDAOImpl implements AuctionDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectAuctionList(int aPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((aPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("auctionMapper.selectAuctionList", null, rows);
	}

	@Override
	public int selectAuctionTotalContents() {
		return sqlSession.selectOne("auctionMapper.selectAuctionTotalContent");
	}

	@Override
	public int selectBidderCount(HashMap<String, Object> hmap) {
		sqlSession.selectOne("auctionMapper.selectBidderCount", hmap);
		return (Integer)hmap.get("result");
	}

	@Override
	public Auction selectOneAuction(int pno) {
		return sqlSession.selectOne("auctionMapper.selectOneAuction", pno);
	}
	
	@Override
	public int insertProduct(Auction auction) {
		return sqlSession.insert("auctionMapper.insertProduct", auction);
	}

	@Override
	public int insertAuction(Auction auction) {
		return sqlSession.insert("auctionMapper.insertAuction", auction);
	}

	


}
