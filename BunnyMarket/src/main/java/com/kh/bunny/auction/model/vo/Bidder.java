package com.kh.bunny.auction.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bidder implements Serializable {

	private static final long serialVersionUID = 100124L;

	private int bno;
	private int pno;
	private String userId;
	private int bPrice;
	private int bStatus;
	
	public Bidder(int pno, String userId, int bPrice) {
		super();
		this.pno = pno;
		this.userId = userId;
		this.bPrice = bPrice;
	}
	
	
}
