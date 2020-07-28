package com.kh.bunny.product.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.product.model.dao.ProductDAO;
import com.kh.bunny.product.model.vo.PComment;
import com.kh.bunny.product.model.vo.Product;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;
	
	@Override
	public List<Map<String, String>> selectProductList(int pPage, int numPerPage) {
		return productDAO.selectProductList(pPage, numPerPage);
	}

	@Override
	public int selectProductTotalContents() {
		return productDAO.selectProductTotalContents();
	}

	@Override
	public Product selectOneProduct(int pno) {
		return productDAO.selectOneProduct(pno);
	}

	@Override
	public int insertProduct(Product product) {
		return productDAO.insertProduct(product);
	}

	@Override
	public int updateProduct(Product product) {
		return productDAO.updateProduct(product);
	}

	@Override
	public int deleteProduct(int pno) {
		return productDAO.deleteProduct(pno);
	}

	@Override
	public List<Object> selectPCommentList(int pno) {
		return productDAO.selectPCommentList(pno);
	}

	@Override
	public int insertPComment(PComment pcomment) {
		return productDAO.insertPComment(pcomment);
	}

	@Override
	public int updatePComemnt(PComment pcomment) {
		return productDAO.updatePComemnt(pcomment);
	}

	@Override
	public int deletePComment(int pcmno) {
		return productDAO.deletePComment(pcmno);
	}

	@Override
	public int selectOneReplyPno(int pcmno) {
		return productDAO.selectOneReplyPno(pcmno);
	}



}
