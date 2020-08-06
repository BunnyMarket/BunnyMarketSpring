package com.kh.bunny.QNA.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QComment implements Serializable {

	private static final long serialVersionUID = 9090L;
	
	private int qcno;
	private int qno;
	private String qWriter;
	private String qcContent;
	private String qcDate;
	private int ref_qcno;
	private int qcLevel;
	private String photo;

}
