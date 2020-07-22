package com.kh.bunny.auction.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.bunny.product.model.vo.Product;

public class Auction extends Product implements Serializable {

	private static final long serialVersionUID = 10123L;
	
	private String aeDate;
	private int pno;
	
	public Auction() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Auction(int pno, String pWriter, int pcno, String pImg, String pTitle, String pContent, int pPrice,
			Date pDate, int pStatus, int pType, String pAddress, int pTotal, String pBuyer) {
		super(pno, pWriter, pcno, pImg, pTitle, pContent, pPrice, pDate, pStatus, pType, pAddress, pTotal, pBuyer);
	}
	public Auction(int pno, String pWriter, int pcno, String pImg, String pTitle, String pContent, int pPrice,
			Date pDate, int pStatus, int pType, String pAddress, int pTotal, String pBuyer, String aeDate, int pno2) {
		super(pno, pWriter, pcno, pImg, pTitle, pContent, pPrice, pDate, pStatus, pType, pAddress, pTotal, pBuyer);
		this.aeDate = aeDate;
		pno = pno2;
	}
	public Auction(String aeDate, int pno) {
		super();
		this.aeDate = aeDate;
		this.pno = pno;
	}
	public String getAeDate() {
		return aeDate;
	}
	public void setAeDate(String aeDate) {
		this.aeDate = aeDate;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
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
