package com.kh.bunny.product.model.dao;

import java.util.ArrayList;
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
	public List<Object> selectPCommentList(int pno) {
		return sqlSession.selectList("productMapper.selectPCommentList", pno);
	}

	@Override
	public int insertPComment(PComment pcomment) {
		return sqlSession.insert("productMapper.insertPComment", pcomment);
	}

	@Override
	public int updatePComemnt(PComment pcomment) {
		return sqlSession.update("productMapper.", pcomment);
	}

	@Override
	public int deletePComment(int pcmno) {
		return sqlSession.delete("productMapper.", pcmno);
	}



}
