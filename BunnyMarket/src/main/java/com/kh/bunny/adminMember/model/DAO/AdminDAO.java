package com.kh.bunny.adminMember.model.DAO;

import java.util.List;
import java.util.Map;

import com.kh.bunny.adminMember.model.vo.adminMember;

public interface AdminDAO {

	
	List<Map<String, String>> selectAdminList(int cPage, int numPerPage);

	int selectAdminTotalContents();

	int selectOneStatusOn(String userId);

	int selectOneStatusOff(String userId);
	
	int insertadminMember(adminMember am);
	
	adminMember selectOne(String adminId);

	List<Map<String, Object>> selectChartCategoryCount();

	List<Map<String, Object>> selectChartMonthCount();

	List<Object> searchAdminList(String keyword, String condition, int pPage, int numPerPage);

	int selectSAdminMemberTotalContents(String keyword, String condition);
}
