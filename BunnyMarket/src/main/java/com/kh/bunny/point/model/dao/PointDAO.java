package com.kh.bunny.point.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.bunny.member.model.vo.Member;
import com.kh.bunny.point.model.vo.BunnyPoint;
import com.kh.bunny.product.model.vo.Product;

public interface PointDAO {

	int pointChargeInsert(BunnyPoint bunnyPoint);

	int selectOneNowPoint(String userId);

	List<Map<String, String>> selectMyPoint(String userId, int pPage, int numPerPage);

	int selectPointTotalContents(String userId);

	Product selectOneProduct(int pno);

}
