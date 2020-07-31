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

	@Override
	public int updateReport(Report r) {
		int result = 0;
		
		try {
		result = reportDAO.updateReport(r);
		
		if(result == REPORT_SERVICE_ERROR)throw new ReportException();
	}catch(Exception e) {
		throw new ReportException("신고글 수정 오류 발생!" + e.getMessage());
	}
    
		return result;
}

	@Override
	public int deleteReport(int rno) {
		int result = reportDAO.deleteReport(rno);
		
		if(result == REPORT_SERVICE_ERROR)throw new ReportException();
		else if(result > REPORT_SERVICE_ERROR)result = REPORT_SERVICE_COMPLETE;
		else throw new ReportException("신고글 삭제 실패!");
		
		return result;
	}
	
	
	
	
	
	
	
	
}