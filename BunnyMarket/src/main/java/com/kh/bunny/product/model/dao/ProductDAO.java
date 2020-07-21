package com.kh.bunny.product.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.bunny.product.model.vo.Product;

public interface ProductDAO {
	// 상품 게시글 리스트 보기 
	List<Map<String, String>> selectProductList(int pPage, int numPerPage);
	
	// 상품 게시글 총 수 
	int selectProductTotalContents();
	
	// 상품 게시글 상세보기 
	Product selectOneProduct(int pno);
	
	// 상품 게시글 생성 
	int insertProduct(Product product); 

	// 상품 게시글 수정 
	int updateProduct(Product product);
	
	// 상품 게시글 삭제 
	int deleteProduct(int pno);
}
