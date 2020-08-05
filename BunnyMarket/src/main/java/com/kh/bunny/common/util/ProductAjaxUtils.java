package com.kh.bunny.common.util;

import java.util.Map;

import org.springframework.stereotype.Controller;

// 페이지 처리 전용 객체! 
@Controller
public class ProductAjaxUtils {
	
	public static String getPageBar(int totalContents, int pPage, int numPerPage, Map<String, Integer> conditionMap, String url ){
		String pageBar = "";
		int pageBarSize = 6; // 5개씩 페이지 목록을 보여주세요 
		pPage = pPage==0?1:pPage;
		
		//총페이지수 구하기
		int totalPage = 0;
		if(totalContents != 0) {
			totalPage = (int)Math.ceil((double)totalContents/numPerPage); 
		} else {
			totalPage = 1;
		}
		
		//1.pageBar작성
		//pageBar순회용변수 
		int pageNo = ((pPage - 1)/pageBarSize) * pageBarSize +1;
		//종료페이지 번호 세팅
		int pageEnd = pageNo+pageBarSize-1;			
		
		System.out.println("totalPage : "+totalPage);
		System.out.println("pageStart["+pageNo+"] ~ pageEnd["+pageEnd+"]");
		
		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";
		//[이전]section
		if(pageNo == 1 ){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'><</a>";
			pageBar += "</li>";
		}
		else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'><</a>";
			pageBar += "</li>";
		}
		
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			if(pPage == pageNo ){
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>"+pageNo+"</a>";
				pageBar += "</li>";
			} 
			else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}
		
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>></a>";
			pageBar += "</li>";
			
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging("+pageNo+")'>></a> ";
			pageBar += "</li>";
		}
		
		pageBar += "</ul>";
		
		//2.스크립트 태그 작성
		//fn_paging함수
		pageBar += "<script>";
		pageBar += "function fn_paging(pPage,numPerPage){";
		pageBar += "location.href='"+url+"?pcno="+conditionMap.get("pcno")+"&order="+conditionMap.get("order")+"&pPage='+pPage;";
		pageBar += "}";
		pageBar += "</script>";
		
		return pageBar; //boardList.jsp에 가서 <c:out value = >에 값을 준다. 
	}

}
