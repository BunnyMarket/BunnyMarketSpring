package com.kh.bunny.deal.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.bunny.product.model.vo.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Deal extends Product implements Serializable {
	
	private static final long serialVersionUID = 4175120348183150933L;
	
	private int dno;
	private int pno;
	private String dsId;
	private String dbId;
	private String dAddress;
	private Date dDate;
	private int dMethod;
	private int dsStatus;
	private int dbStatus;
	private String dDelNum;
	private Date extDate;
	private int price;
	
	public Deal(int pno, String pWriter, int pcno, String pImg, String pTitle, String pContent, int pPrice,
			String pDate, int pStatus, int pType, String pAddress, int pTotal, String pBuyer, int bPrice,
			String pCategory) {
		super(pno, pWriter, pcno, pImg, pTitle, pContent, pPrice, pDate, pStatus, pType, pAddress, pTotal, pBuyer, bPrice,
				pCategory);

	}
	
	
}
