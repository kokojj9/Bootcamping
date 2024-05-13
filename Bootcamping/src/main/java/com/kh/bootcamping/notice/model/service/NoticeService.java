package com.kh.bootcamping.notice.model.service;

import java.util.List;

import com.kh.bootcamping.notice.model.vo.Notice;

public interface NoticeService {
	
	// *공지사항은 페이징 처리를 하지 않을 예정
	
	// 공지사항 목록조회
	List<Notice> selectList();
	
	//공지사항 글 작성
	int insert(Notice notice);
	
	// 공지사항 상세보기
	Notice selectNotice(int Notice);
	
	// 공지사항 글 삭제하기
	int delete(int NoticeNo);
	
	// 공지사항 글 수정하기
	int update(Notice notice);
	
	
	
	

}
