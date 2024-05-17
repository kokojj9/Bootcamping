
package com.kh.bootcamping.board.model.service;

import java.util.List;

import com.kh.bootcamping.board.model.vo.Board;
import com.kh.bootcamping.board.model.vo.Reply;
import com.kh.bootcamping.common.model.vo.PageInfo;


public interface BoardService {
	
	// 최종목적 : 게시글 목록조회 + 페이징 처리
	
	// 1.게시글 총 개수 조회(먼저 조회수를 올리고 목록이 나온다)
	int selectListCount();
	
	// 2.게시글 목록조회
	List<Board> selectList(PageInfo pi);
	
	//---------------------------
	
	// 게시글 상세보기
	
	//1.조회수
	int increaseCount(int boardNo);
	
	//2.게시글 상세조회
	Board selectBoard(int boardNo);
	
	//---------------------------
	
	// 게시글 작성
	int select(Board board);
	
	// ------------------------------
	
	// 게시글 삭제하기
	int delete(int boardNo);
	
	// ------------------------------
	
	// 게시글 수정하기
	int update(Board board);
	
	
	
	//----------------댓글관련
	List<Reply> selectReply(int boardNo);
	
	int insertReply(Reply reply);
	
	//---------------
	List<Board> findTopBoard();

	int selectBoardListCount(String memberId);

	List<Board> selectBoardList(PageInfo pi, String memberId);
	
	
	
	
	
	
}

