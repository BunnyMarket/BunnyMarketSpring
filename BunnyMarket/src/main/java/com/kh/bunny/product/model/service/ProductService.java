package com.kh.bunny.product.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.bunny.product.model.vo.PComment;
import com.kh.bunny.product.model.vo.Product;

public interface ProductService {
	
	// 0은 Error, 1은 Complete!
	static int PRODUCT_SERVICE_ERROR = 0;
	static int PRODUCT_SERVICE_COMPLETE = 1;
	
	//---------------------------------------------------------------------
	
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

	// 상품 게시글의 댓글 목록 불러오기 
	List<Object> selectPCommentList(int pno);
	
	// 댓글 생성 
	int insertPComment(PComment pcomment);
	
	// 댓글 수정 
	int updatePComment(PComment pcomment);
	
	// 댓글 삭제 
	int deletePComment(int pcmno);

	int selectOneReplyPcmno(int pcmno);

	String selectOneReplyPcWriter(int pcmno);

	PComment selectOnePComment(int pno);

	List<Object> selectProductListMap();

	int sellCount(String pWriter);
	
	List<Map<String, String>> selectTradeList(int aPage, int numPerPage,String nickName);
	
	int selectTradeTotalContents(String nickName);

	List<Map<String, String>> selectLoveList(int aPage, int numPerPage, String nickName);

	int selectLoveTotalContents(String nickName);

	List<Map<String, String>> selectCompleteProductList(int aPage, int numPerPage, String nickName);

	int selectCompleteProductTotalContents(String nickName);

	int productPurchase(Product product);

	List<Map<String, String>> sellCompleteProductList(int aPage, int numPerPage, String nickName);
	
	int selectOnemakeZero(int pno);

	List<Map<String, String>> goTradeProduct(int aPage, int numPerPage, String nickName);

	List<Object> searchProductList(String keyword, String condition, int pPage, int numPerPage);
	
	List<Integer> selectTypeCount();
	
	List<Map<String, String>> selectProductTypeList(int aPage, int numPerPage, Map<String, Integer> conditionMap);

	int selectProductTypeTotalContents(Map<String, Integer> conditionMap);

	int selectSproductTotalContents(String keyword, String condition);

	int giveMeDno(int pno);

	int productPurchaseRequest(Product p);
	
	List<Product> selectProductTopList();

}
