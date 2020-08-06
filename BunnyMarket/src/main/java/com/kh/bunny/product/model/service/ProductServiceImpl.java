package com.kh.bunny.product.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.product.model.dao.ProductDAO;
import com.kh.bunny.product.model.exception.ProductException;
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
		Product p = productDAO.selectOneProduct(pno);
		
		if(p != null){
			int result = productDAO.updateCount(pno);
		}
		return p;
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
	public int updatePComment(PComment pcomment) {
		return productDAO.updatePComment(pcomment);
	}

	@Override
	public int deletePComment(int pcmno) {
		return productDAO.deletePComment(pcmno);
	}

	@Override
	public int selectOneReplyPcmno(int pcmno) {
		return productDAO.selectOneReplyPcmno(pcmno);
	}

	@Override
	public String selectOneReplyPcWriter(int pcmno) {
		return productDAO.selectOneReplyPcWriter(pcmno);
	}

	@Override
	public PComment selectOnePComment(int pno) {
		return productDAO.selectOnePComment(pno);
	}

	@Override
	public List<Object> selectProductListMap() {
		return productDAO.selectProductListMap();
	}

	@Override
	public int sellCount(String pWriter) {
		
		return productDAO.sellCount(pWriter);
	}
	
	@Override
	public List<Map<String, String>> selectTradeList(int aPage, int numPerPage, String nickName) {
		
		return productDAO.selectTradeList(aPage, numPerPage, nickName);
	}
	
	@Override
	public int selectTradeTotalContents(String nickName) {
		return productDAO.selectTradeTotalContents(nickName);
	}

	@Override
	public List<Map<String, String>> selectLoveList(int aPage, int numPerPage, String nickName) {
		// TODO Auto-generated method stub
		return productDAO.selectLoveList(aPage, numPerPage, nickName);
	}

	@Override
	public int selectLoveTotalContents(String nickName) {
		// TODO Auto-generated method stub
		return productDAO.selectLoveTotalContents(nickName);
	}

	@Override
	public List<Map<String, String>> selectCompleteProductList(int aPage, int numPerPage, String nickName) {
		// TODO Auto-generated method stub
		return productDAO.selectCompleteProductList(aPage, numPerPage, nickName);
	}

	@Override
	public int selectCompleteProductTotalContents(String nickName) {
		// TODO Auto-generated method stub
		return productDAO.selectCompleteProductTotalContents(nickName);
	}
	@Override
	public int selectOnemakeZero(int pno) {
		return productDAO.selectOnemakeZero(pno);
	}

	@Override
	public int productPurchase(Product product) {
		
		int result = 0;
		
		try {

			result = productDAO.productPurchase(product);
			if(result == PRODUCT_SERVICE_ERROR) throw new ProductException("상품 구매 중 에러 발생");
			
			result = productDAO.productPurchaseUpdateMember(product);
			if(result == PRODUCT_SERVICE_ERROR) throw new ProductException("상품 구매 중 에러 발생");
			
			result = productDAO.productPurchaseInsertUPoint(product);
			if(result == PRODUCT_SERVICE_ERROR) throw new ProductException("상품 구매 중 에러 발생");
			
			result = productDAO.productPurchaseInsertHistory(product);
			if(result == PRODUCT_SERVICE_ERROR) throw new ProductException("상품 구매 중 에러 발생");
			
			
		} catch (Exception e) {
			throw new ProductException("상품 구매 중 문제 발생함." + e.getMessage());
		}
		
		return result;
	}

	@Override
	public List<Map<String, String>> sellCompleteProductList(int aPage, int numPerPage, String nickName) {
		// TODO Auto-generated method stub
		return productDAO.sellCompleteProductList(aPage, numPerPage, nickName);
	}

	@Override
	public List<Map<String, String>> goTradeProduct(int aPage, int numPerPage, String nickName) {
		return productDAO.goTradeProduct(aPage, numPerPage, nickName);
	}
	
	@Override
	public List<Object> searchProductList(String keyword, String condition, int pPage, int numPerPage) {
		return productDAO.searchProductList(keyword, condition, pPage, numPerPage);
	}
	
	@Override
	public List<Integer> selectTypeCount() {
		
		List<Integer> list = new ArrayList<Integer>();
		
		for(int i = 1; i < 8; i++) {
			list.add(productDAO.selectTypeCount(i));
		}
		
		return list;
	}
	
	@Override
	public List<Map<String, String>> selectProductTypeList(int aPage, int numPerPage, Map<String, Integer> conditionMap) {
		return productDAO.selectProductTypeList(aPage, numPerPage, conditionMap);
	}

	@Override
	public int selectProductTypeTotalContents(Map<String, Integer> conditionMap) {
		return productDAO.selectProductTypeTotalContents(conditionMap);

	}


	@Override
	public int selectSproductTotalContents(String keyword, String condition) {
		return productDAO.selectSproductTotalContents(keyword, condition);
	}

	@Override
	public int giveMeDno(int pno) {
		return productDAO.giveMeDeal(pno);
	}

	@Override
	public int productPurchaseRequest(Product p) {
		
		int result = 0;
		
		
		return result;
	}
	
	@Override
	public List<Product> selectProductTopList() {
		return productDAO.selectProductTopList();
	}
}
