package com.kh.bunny.adminMember.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.bunny.notice.model.vo.Notice;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class adminMember implements	Serializable{

	private static final long serialVersionUID = 100L;
	
	private String adminId;
	private String adminPw;
	private int aStatus;

}
