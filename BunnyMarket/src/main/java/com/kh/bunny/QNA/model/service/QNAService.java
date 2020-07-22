package com.kh.bunny.QNA.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bunny.QNA.model.vo.QNA;

public interface QNAService {
   static int QNA_SERVICE_ERROR = 0;
   static int QNA_SERVICE_COMPLETE = 1;
   
   List<Map<String, String>> selectQNAList (int cPage, int numPerPage);
   
   int selectQNATotalContents();
   
   int insertQNA(QNA qna);
   
   QNA selectOneQNA(int qNo);
   
   int updateQNA(QNA qna);
   
   int deleteQNA(int qNo);
   
}
