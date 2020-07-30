package com.kh.bunny.product.model.vo;

import java.io.Serializable;

import com.kh.bunny.product.model.vo.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PComment implements Serializable{
	
	private static final long serialVersionUID = 1009L;
	
	private int pcmno;
	private int pno;
	private String pcWriter;
	private String pcContent;
	private String pcDate;
	private int ref_pcmno;
	private int pcLevel;
	
	
}
