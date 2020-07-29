package com.kh.bunny.product.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.bunny.product.model.vo.PComment;
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

	// 상품 게시글의 댓글 목록 불러오기  
	List<Object> selectPCommentList(int pno);
	
	// 댓글 생성 
	int insertPComment(PComment pcomment);
	
	// 댓글 수정 
<<<<<<< HEAD
	int updatePComemnt(PComment pcomment);
	
	// 댓글 삭제 
	int deletePComment(int pcmno);

	// 상품 리스트 지도에 불러오기 
	List<Object> selectProductListMap();
=======
	int updatePComment(PComment pcomment);
	
	// 댓글 삭제 
	int deletePComment(int pcmno);

	int insertRePComment(PComment pcomment);

	int selectOneReplyPcmno(int pcmno);

	String selectOneReplyPcWriter(int pcmno);

	PComment selectOnePComment(int pno);


>>>>>>> refs/remotes/origin/dev_auction_ming
}
