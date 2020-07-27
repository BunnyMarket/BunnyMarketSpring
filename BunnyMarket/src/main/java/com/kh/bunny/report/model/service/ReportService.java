package com.kh.bunny.report.model.service;

import java.util.List;
import java.util.Map;

public interface ReportService {

	static int BOARD_SERVICE_ERROR = 0;
	static int BOARD_SERVICE_COMPLETE = 1;
	
	List<Map<String, String>> selectReportList(int cPage, int numPerPage);
	
	int selectReportTotalContents();
	

}
