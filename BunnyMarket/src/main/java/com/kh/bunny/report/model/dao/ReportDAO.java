package com.kh.bunny.report.model.dao;

import java.util.List;
import java.util.Map;

public interface ReportDAO {
   
	List<Map<String, String>> selectReportList(int cPage, int numPerPage);
	
	int selectReportTotalContents();
}
