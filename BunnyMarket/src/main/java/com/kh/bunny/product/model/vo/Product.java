package com.kh.bunny.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product implements Serializable {
	
	private static final long serialVersionUID = 1001L;
	
	private	int pno;      
	private String pWriter;  
	private int pcno;     
	private String pImg;    
	private String pTitle;   
	private String pContent;
	private String pPrice;   
	private Date pDate;   
	private int pStatus;  
	private int pType;    
	private String pAddress; 
	private int pTotal;   
	private String pBuyer;  

}
