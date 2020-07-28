package com.kh.bunny.report.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.bunny.report.model.vo.Report;

public interface ReportDAO {
   
	List<Map<String, String>> selectReportList(int cPage, int numPerPage);
	
	int selectReportTotalContents();

	int insertReport(Report r);

	int selectCurrentRno();

	Report selectOneReport(int rNo);
}
