package com.kh.bunny.QNA.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bunny.QNA.model.vo.QComment;
import com.kh.bunny.QNA.model.vo.QNA;

public interface QNAService {
   static int QNA_SERVICE_ERROR = 0;
   static int QNA_SERVICE_COMPLETE = 1;
   
   List<Map<String, String>> selectQNAList (int cPage, int numPerPage, String userId);
   
   int selectQNATotalContents();
   
   int insertQNA(QNA qna);
   
   QNA selectOneQNA(int qNo);
   
   int updateQNA(QNA qna);
   
   int deleteQNA(int qNo);

   int selectCurrentQno();

   int insertQComment(QComment qcomment);

   // 댓글 목록 불러오기
   List<Object> selectQCommentList(int qno);

   // 댓글 수정
   int updateQComment(QComment qcomment);

   //댓글 삭제
   int selectOneReplyQcno(int qcno);

   int deleteQComment(int qcno);

   List<Map<String, String>> selectQnAList (int cPage, int numPerPage);
}
