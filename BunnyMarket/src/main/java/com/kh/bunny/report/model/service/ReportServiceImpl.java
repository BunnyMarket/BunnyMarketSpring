package com.kh.bunny.report.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.report.model.dao.ReportDAO;
import com.kh.bunny.report.model.exception.ReportException;
import com.kh.bunny.report.model.vo.Report;


@Service("ReportService")
public class ReportServiceImpl implements ReportService {

	@Autowired
	ReportDAO reportDAO;
	
	@Override
	public List<Map<String, String>> selectReportList(int cPage, int numPerPage) {
		
		return reportDAO.selectReportList(cPage,numPerPage);
	}

	@Override
	public int selectReportTotalContents() {
		
		return reportDAO.selectReportTotalContents();
	}

	@Override
	public int insertReport(Report r) {
		int result =0;
		System.out.println("service : " + r.getRNo());
		result = reportDAO.insertReport(r);
		
		if(result == REPORT_SERVICE_ERROR) throw new ReportException();
		
		return result;
	}

	@Override
	public int selectCurrentRno() {
	
		return reportDAO.selectCurrentRno();
	}

	@Override
	public Report selectOneReport(int rNo) {
		
		return reportDAO.selectOneReport(rNo);
	}

}
