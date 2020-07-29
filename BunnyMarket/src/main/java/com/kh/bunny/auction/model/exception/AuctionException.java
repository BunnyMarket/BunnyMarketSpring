package com.kh.bunny.auction.model.exception;

public class AuctionException extends RuntimeException {

	public AuctionException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AuctionException(String message) {
		super("Auction 에러 발생 : " + message);
	}

	
}
