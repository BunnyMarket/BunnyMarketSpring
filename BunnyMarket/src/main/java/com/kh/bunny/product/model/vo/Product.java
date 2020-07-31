package com.kh.bunny.product.model.vo;

import java.io.Serializable;
<<<<<<< HEAD
=======
import java.security.Timestamp;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;
>>>>>>> refs/remotes/origin/dev_QNA_lee

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
	private int pPrice;   
	private String pDate;   
	private int pStatus;  
	private int pType;    
	private String pAddress; 
	private int pTotal;   
	private String pBuyer;
	private int bPrice;
	private String pCategory;

}
