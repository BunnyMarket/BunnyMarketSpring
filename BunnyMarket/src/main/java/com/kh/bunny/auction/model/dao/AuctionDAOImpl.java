package com.kh.bunny.auction.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.auction.model.vo.Auction;
import com.kh.bunny.auction.model.vo.Bidder;
import com.kh.bunny.product.model.vo.PComment;

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

	@Override
	public int insertBidder(Bidder b) {
		return sqlSession.insert("auctionMapper.insertBidder", b);
	}

	@Override
	public int selectOneBidderCount(int pno) {
		return sqlSession.selectOne("auctionMapper.selectOneBidderCount", pno);
	}

	@Override
	public int hasBidderCount(String pno) {
		int pnoI = Integer.parseInt(pno);
		return sqlSession.selectOne("auctionMapper.bidderCount", pnoI);
	}

	@Override
	public List<Map<String, String>> selectAuctionListAddBidder(int aPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((aPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("auctionMapper.selectAuctionListAddBidder", null, rows);
	}

	@Override
	public ArrayList<Bidder> selectAllBidder(int pno) {
		return new ArrayList<Bidder>(sqlSession.selectList("auctionMapper.selectAllBidder", pno));
	}

	@Override
	public int updateCount(int pno) {
		return sqlSession.update("auctionMapper.updateTotalCount",pno);
	}
	
	@Override
	public List<Map<String, String>> selectTradeList(int aPage, int numPerPage,String nickName) {

		RowBounds rows = new RowBounds((aPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("auctionMapper.selectTradeList", nickName, rows);
	}
	
	@Override
	public int selectTradeTotalContents(String nickName) {
		return sqlSession.selectOne("auctionMapper.selectTradeTotalContent",nickName);
	}

	@Override
	public int updateBeforeBidderMember(int pno) {
		return sqlSession.update("auctionMapper.updateBeforeBidderMember", pno);
	}

	@Override
	public int updateBeforeBidder(int pno) {
		return sqlSession.update("auctionMapper.updateBeforeBidder", pno);
	}

	@Override
	public int updateBeforeUsedPoint(int pno) {
		return sqlSession.update("auctionMapper.updateBeforeUsedPoint", pno);
	}

	@Override
	public List<Map<String, String>> completeAuctionList(int aPage, int numPerPage, String nickName) {
		RowBounds rows = new RowBounds((aPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("auctionMapper.completeAuctionList", nickName, rows);
	}

	@Override
	public int selectCompleteAuctionTotalContents(String nickName) {
		return sqlSession.selectOne("auctionMapper.selectCompleteAuctionTotalContents",nickName);
	}

	@Override
	public List<Map<String, String>> sellCompleteAuctionList(int aPage, int numPerPage, String nickName) {
		RowBounds rows = new RowBounds((aPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("auctionMapper.completeAuctionList", nickName, rows);
	}

	@Override
	public List<Map<String, String>> goTradeAuction(int aPage, int numPerPage, String nickName) {
		RowBounds rows = new RowBounds((aPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("auctionMapper.goTradeAuction", nickName, rows);
	}

}
