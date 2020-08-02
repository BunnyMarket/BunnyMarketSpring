package com.kh.bunny.point.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UsedPoint implements Serializable {

	private static final long serialVersionUID = 123587L;

	private int upno;
	private int pno;
	private int userId;
	private int upsno;
	private int updt;
	private int upPoint;
	
}
