package com.kh.bunny.product.model.exception;

public class ProductException extends RuntimeException {

	public ProductException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductException(String message) {
		super("Product 에러 발생 : " + message);
	}

	
}
