package com.kh.bunny.adminMember.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.bunny.adminMember.model.vo.adminMember;

public interface AdminDAO {

	
	List<Map<String, String>> selectAdminList(int cPage, int numPerPage);

	int selectAdminTotalContents();

	int selectOneStatusOn(String userId);

	int selectOneStatusOff(String userId);
	
	int insertadminMember(adminMember am);
}
