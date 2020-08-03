package com.kh.bunny.QNA.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QNA implements Serializable{
	
	private static final long serialVersionUID = 9999L;
	private int qno;
	private String qWriter;
	private String qTitle;
	private String qContent;
	private Date qDate;
	private String ck;
}
