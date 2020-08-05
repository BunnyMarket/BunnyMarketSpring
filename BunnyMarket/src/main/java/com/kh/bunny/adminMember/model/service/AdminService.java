package com.kh.bunny.adminMember.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bunny.adminMember.model.vo.adminMember;

public interface AdminService {

	List<Map<String, String>> selectAdminList(int cPage, int numPerPage);

	int selectAdminTotalContents();
	
	int selectOneStatusOn(String userId);
	int selectOneStatusOff(String userId);

	int insertadminMember(adminMember am);
	
	adminMember selectOne(String adminId);

	List<Map<String, Object>> chartCategoryCount();
	
	List<Map<String, Object>> chartMonthCount();
	
}
