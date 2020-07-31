package com.kh.bunny.QNA.model.exception;

public class QNAException extends RuntimeException {

	public QNAException() {
		
	}
	
	public QNAException(String message) {
		super("QNA 에러 발생 : " + message);
	}
}
