package com.kh.bunny.report.model.exception;

public class ReportException extends RuntimeException{

	public ReportException() {
		
	}
	
	public ReportException(String message) {
		super("Report 에러 발생 : " + message);
	}
}
