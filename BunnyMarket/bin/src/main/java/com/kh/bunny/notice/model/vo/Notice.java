package com.kh.bunny.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.sun.xml.internal.ws.api.message.Attachment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice implements Serializable {

	private static final long serialVersionUID = 13L;
	
	private int nno;
	private String nTitle;
	private String nContent;
	private Date nDate;
	private int nTotal;
	
}
