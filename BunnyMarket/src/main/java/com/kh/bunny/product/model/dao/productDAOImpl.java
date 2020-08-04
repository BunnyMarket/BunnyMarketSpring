package com.kh.bunny.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bunny.product.model.vo.PComment;
import com.kh.bunny.product.model.vo.Product;

@Repository("productDAO")
public class productDAOImpl implements ProductDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectProductList(int pPage, int numPerPage) {
		RowBounds rows = new RowBounds((pPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("productMapper.selectProductList", null, rows);
	}

	@Override
	public int selectProductTotalContents() {
		return sqlSession.selectOne("productMapper.selectProductTotalContent");
	}

	@Override
	public Product selectOneProduct(int pno) {
		return sqlSession.selectOne("productMapper.selectOneProduct", pno);
	}

	@Override
	public int insertProduct(Product product) {
		return sqlSession.insert("productMapper.insertProduct", product);
	}

	@Override
	public int updateProduct(Product product) {
		return sqlSession.update("productMapper.updateProduct", product);
	}

	@Override
	public int deleteProduct(int pno) {
		return sqlSession.delete("productMapper.deleteProduct", pno);
	}
	
	@Override
	public int updateCount(int pno) {
		return sqlSession.update("productMapper.updateTotalCount",pno);
	}

	@Override
	public List<Object> selectPCommentList(int pno) {
		return sqlSession.selectList("productMapper.selectPCommentList", pno);
	}

	@Override
	public int insertPComment(PComment pcomment) {
		return sqlSession.insert("productMapper.insertPComment", pcomment);
	}

	@Override
	public int updatePComment(PComment pcomment) {
		return sqlSession.update("productMapper.updatePComment", pcomment);
	}

	@Override
	public int deletePComment(int pcmno) {
		return sqlSession.delete("productMapper.deletePComment", pcmno);
	}

	@Override
	public int insertRePComment(PComment pcomment) {
		return sqlSession.insert("productMapper.insertRePComment", pcomment);
	}

	@Override
	public int selectOneReplyPcmno(int pcmno) {
		return sqlSession.selectOne("productMapper.selectOneReplyPcmno", pcmno);
	}

	@Override
	public String selectOneReplyPcWriter(int pcmno) {
		return sqlSession.selectOne("productMapper.selectOneReplyPcWriter", pcmno);
	}

	@Override
	public PComment selectOnePComment(int pno) {
		return sqlSession.selectOne("productMapper.selectOnePComment", pno);
	}

	@Override
	public List<Object> selectProductListMap() {
		return sqlSession.selectList("productMapper.selectProductListMap");
	}

	@Override
	public int sellCount(String pWriter) {
		
		return sqlSession.selectOne("productMapper.sellCount", pWriter);
	}
	
	@Override
	public List<Map<String, String>> selectTradeList(int aPage, int numPerPage,String nickName) {

		RowBounds rows = new RowBounds((aPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("productMapper.selectTradeList", nickName, rows);
	}
	
	@Override
	public int selectTradeTotalContents(String nickName) {
		return sqlSession.selectOne("productMapper.selectTradeTotalContent",nickName);
	}

	@Override
	public List<Map<String, String>> selectLoveList(int aPage, int numPerPage, String nickName) {
		
		RowBounds rows = new RowBounds((aPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("productMapper.selectLoveList", nickName, rows);
	}

	@Override
	public int selectLoveTotalContents(String nickName) {
		return sqlSession.selectOne("productMapper.selectLoveTotalContent",nickName);
	}

	@Override
	public List<Map<String, String>> selectCompleteProductList(int aPage, int numPerPage, String nickName) {
		RowBounds rows = new RowBounds((aPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("productMapper.selectCompleteProductList", nickName, rows);
	}

	@Override
	public int selectCompleteProductTotalContents(String nickName) {
		return sqlSession.selectOne("productMapper.selectCompleteProductTotalContents",nickName);
	}

	@Override
	public int selectOnemakeZero(int pno) {
		return sqlSession.update("productMapper.selectOnemakeZero", pno);
	}

	public int productPuserchase(Product product) {
		return sqlSession.update("productMapper.purchaseProduct", product);
	}

	@Override
	public List<Map<String, String>> sellCompleteProductList(int aPage, int numPerPage, String nickName) {
		RowBounds rows = new RowBounds((aPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("productMapper.sellCompleteProductList", nickName, rows);
	}

	@Override
	public List<Map<String, String>> goTradeProduct(int aPage, int numPerPage, String nickName) {
		RowBounds rows = new RowBounds((aPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("productMapper.goTradeProduct", nickName, rows);
	}
	
	@Override
	public List<Object> searchProductList(String keyword, String condition) {
		HashMap<String, String> hmap = new HashMap<>();
		
		hmap.put("keyword", keyword);
		hmap.put("condition", condition);
		
		return sqlSession.selectList("productMapper.searchProductList", hmap);
	}

	@Override
	public List<Map<String, String>> selectProductTypeList(int aPage, int numPerPage, Map<String, Integer> conditionMap) {
		RowBounds rows = new RowBounds((aPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("productMapper.selectProductTypeList", conditionMap, rows);
	}

	@Override
	public int selectProductTypeTotalContents(Map<String, Integer> conditionMap) {
		return sqlSession.selectOne("productMapper.selectProductTypeTotalContents", conditionMap);

	}

	@Override
	public Integer selectTypeCount(int pcno) {
		return sqlSession.selectOne("productMapper.selectTypeCount", pcno);
	}
}
