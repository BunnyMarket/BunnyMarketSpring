package com.kh.bunny.point.model.exception;

public class PointException extends RuntimeException {

	public PointException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PointException(String message) {
		super("Product 에러 발생 : " + message);
	}

	
}
