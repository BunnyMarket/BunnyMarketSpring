package com.kh.bunny.report.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bunny.product.model.vo.Product;
import com.kh.bunny.report.model.vo.Report;

public interface ReportService {

	static int REPORT_SERVICE_ERROR = 0;
	static int REPORT_SERVICE_COMPLETE = 1;
	
	List<Map<String, String>> selectReportList(int cPage, int numPerPage);
	
	int selectReportTotalContents();

	int insertReport(Report r);

	int selectCurrentRno();

	Report selectOneReport(int rNo);

	int updateReport(Report r);

	int deleteReport(int rno);

	int insertDirectReport(Report r);

	Product selectOneProduct(int pno);

	List<Object> searchReportList(String keyword, String condition, int pPage, int numPerPage);

	int selectSReportTotalContents(String keyword, String condition);
	
	

}
