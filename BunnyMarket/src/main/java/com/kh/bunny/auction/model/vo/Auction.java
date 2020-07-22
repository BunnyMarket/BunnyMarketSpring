package com.kh.bunny.auction.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.bunny.product.model.vo.Product;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class Auction extends Product implements Serializable {

	private static final long serialVersionUID = 10123L;
	
	private String aeDate;
	private int pno;
	private int pTime;
	
	public Auction() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Auction(int pno, String pWriter, int pcno, String pImg, String pTitle, String pContent, int pPrice,
			String pDate, int pStatus, int pType, String pAddress, int pTotal, String pBuyer) {
		super(pno, pWriter, pcno, pImg, pTitle, pContent, pPrice, pDate, pStatus, pType, pAddress, pTotal, pBuyer);
	}
	public Auction(int pno, String pWriter, int pcno, String pImg, String pTitle, String pContent, int pPrice,
			String pDate, int pStatus, int pType, String pAddress, int pTotal, String pBuyer, String aeDate, int pno2, int pTime) {
		super(pno, pWriter, pcno, pImg, pTitle, pContent, pPrice, pDate, pStatus, pType, pAddress, pTotal, pBuyer);
		this.aeDate = aeDate;
		pno = pno2;
		this.pTime = pTime;
	}
	public Auction(String aeDate, int pno, int pTime) {
		super();
		this.aeDate = aeDate;
		this.pno = pno;
		this.pTime = pTime;
	}
	
	@Override
	public String toString() {
		return "Auction [aeDate=" + aeDate + ", pno=" + pno + ", getPWriter()=" + getPWriter() + ", getPcno()="
				+ getPcno() + ", getPImg()=" + getPImg() + ", getPTitle()=" + getPTitle() + ", getPContent()="
				+ getPContent() + ", getPPrice()=" + getPPrice() + ", getPDate()=" + getPDate() + ", getPStatus()="
				+ getPStatus() + ", getPType()=" + getPType() + ", getPAddress()=" + getPAddress() + ", getPTotal()="
				+ getPTotal() + ", getPBuyer()=" + getPBuyer() + "]";
	}
	
}
