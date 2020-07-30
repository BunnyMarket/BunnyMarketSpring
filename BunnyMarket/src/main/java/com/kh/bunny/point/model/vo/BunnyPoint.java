package com.kh.bunny.point.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BunnyPoint implements Serializable {

	private static final long serialVersionUID = 123558L;
	
	private int bpno;
	private String userid;
	private Date bpdate;
	private int bpoint;
	private int bpstatus;
	
}
