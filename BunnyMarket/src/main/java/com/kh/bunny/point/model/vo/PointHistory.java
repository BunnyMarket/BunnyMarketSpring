package com.kh.bunny.point.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PointHistory extends BunnyPoint implements Serializable {

	private static final long serialVersionUID = 123555L;
	private int phno;
	private String userId;
	private int bpno;
	private int upno;
	private int nowPoint;
	private int upsno;
	private Date updt;
	
	public PointHistory(int bpno, String userId, Date bpDate, int bPoint, int bpStatus) {
		super(bpno, userId, bpDate, bPoint, bpStatus);
		// TODO Auto-generated constructor stub
	}
	
	
}
