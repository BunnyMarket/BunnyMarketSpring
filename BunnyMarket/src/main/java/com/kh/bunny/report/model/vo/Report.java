package com.kh.bunny.report.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.bunny.report.model.vo.Report;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report implements Serializable{

	private static final long serialVersionUID = 1999L;
    
	private int rNo;
	private int rcNo;
	private String rWriter;    // 신고자
	private String reported;  // 신고 당한 사람
	private int pNo;
	private String rTitle;
	private String rContent;
	private Date rDate;
}
