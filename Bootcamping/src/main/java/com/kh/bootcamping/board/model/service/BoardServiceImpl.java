package com.kh.bootcamping.board.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.board.model.dao.BoardRepository;
import com.kh.bootcamping.board.model.vo.Board;
import com.kh.bootcamping.board.model.vo.Reply;
import com.kh.bootcamping.common.model.vo.PageInfo;


@Service
public class BoardServiceImpl implements BoardService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardRepository boardRepository;
	
	
	@Override
	public int selectListCount() {
		
		return boardRepository.selectListCount(sqlSession);
	}

	@Override
	public List<Board> selectList(PageInfo pi) {
		
		
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
