package com.kh.bootcamping.board.model.service;

import java.util.List;

import com.kh.bootcamping.board.model.vo.Board;
import com.kh.bootcamping.board.model.vo.Reply;
import com.kh.bootcamping.common.model.vo.PageInfo;

public class BoardServiceImpl implements BoardService {

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Board> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int increaseCount(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Board selectBoard(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int select(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Reply> selectReply(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Board> findTopBoard() {
		// TODO Auto-generated method stub
		return null;
	}

}
