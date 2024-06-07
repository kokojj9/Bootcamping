package com.kh.bootcamping.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.bootcamping.board.model.vo.Board;

@Mapper
public interface BoardMapper {

	int selectListCount();

	List<Board> selectList(RowBounds rowBounds);

	int selectBoardListCount(String memberId);

	List<Board> seleBoardList(String memberId, RowBounds rowBounds);
	
	int select(Board board);

	

}
