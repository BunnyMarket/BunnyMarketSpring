package com.kh.bunny.adminMember.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.adminMember.model.DAO.AdminDAO;
import com.kh.bunny.adminMember.model.vo.adminMember;


@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public List<Map<String, String>> selectAdminList(int cPage, int numPerPage){
		return adminDAO.selectAdminList(cPage, numPerPage);
	}
	
	@Override
	public int selectAdminTotalContents(){
		return adminDAO.selectAdminTotalContents();
	}
	
	@Override
	public int selectOneStatusOn(String userId){
		System.out.println("service"+userId);
		
		return adminDAO.selectOneStatusOn(userId);
	}
	
	@Override
	public int selectOneStatusOff(String userId) {
		System.out.println("service"+userId);
		return adminDAO.selectOneStatusOff(userId);
	}
	
	@Override
	public int insertadminMember(adminMember am) {
		System.out.println("memberService" +am);
		return adminDAO.insertadminMember(am);
	}
	
	@Override
	public adminMember selectOne(String adminId) {
		System.out.println("memberService" +adminId);
		return adminDAO.selectOne(adminId);
	}

	@Override
	public List<Map<String, Object>> chartCategoryCount() {	
		return adminDAO.selectChartCategoryCount();
	}


	@Override
	public List<Map<String, Object>> chartMonthCount() {
		return adminDAO.selectChartMonthCount();
	}
}
