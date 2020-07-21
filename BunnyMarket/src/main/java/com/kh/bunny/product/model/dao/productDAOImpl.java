package com.kh.bunny.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateProduct(Product product) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProduct(int pno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
