package com.kh.bunny.deal.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Deal implements Serializable {

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
}
