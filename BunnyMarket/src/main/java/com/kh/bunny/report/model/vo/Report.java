package com.kh.bunny.report.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.bunny.product.model.vo.Product;
import com.kh.bunny.report.model.vo.Report;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report extends Product implements Serializable{

	private static final long serialVersionUID = 1999L;
    
	private int rNo;
	private int rcNo;
	private String rWriter;    // 신고자
	private String reported;  // 신고 당한 사람
	private int pno;
	private String rTitle;
	private String rContent;
	private Date rDate;
	private String rcContent;
	public Report(int pno, String pWriter, int pcno, String pImg, String pTitle, String pContent, int pPrice,
			String pDate, int pStatus, int pType, String pAddress, int pTotal, String pBuyer, int bPrice,
			String pCategory, int dMethod, int dno) {
		super(pno, pWriter, pcno, pImg, pTitle, pContent, pPrice, pDate, pStatus, pType, pAddress, pTotal, pBuyer, bPrice,
				pCategory, dMethod, dno);
		// TODO Auto-generated constructor stub
	}
	
	
}
