package com.kh.bunny.point.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PointHistory implements Serializable {

	private int phno;
	private int userId;
	private int bpno;
	private int upno;
	private int nowPoint;
}
