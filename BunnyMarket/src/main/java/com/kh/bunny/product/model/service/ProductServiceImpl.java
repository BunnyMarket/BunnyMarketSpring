package com.kh.bunny.product.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.product.model.dao.ProductDAO;
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
		return null;
	}

	@Override
	public int insertProduct(Product product) {
		return 0;
	}

	@Override
	public int updateProduct(Product product) {
		return 0;
	}

	@Override
	public int deleteProduct(int pno) {
		return 0;
	}

}
