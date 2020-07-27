package com.kh.bunny.report.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bunny.report.model.dao.ReportDAO;


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

}
