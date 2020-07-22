package com.kh.bunny.QNA.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QComment implements Serializable {

	private static final long serialVersionUID = 9090L;
	
	private int qcNo;
	private int qNo;
	private String qcWriter;
	private String qcContent;
	private Date qcDate;
	private int ref_qcNo;
	private int qcLevel;

}
