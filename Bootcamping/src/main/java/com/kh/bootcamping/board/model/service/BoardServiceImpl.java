package com.kh.bootcamping.board.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.board.model.dao.BoardMapper;
import com.kh.bootcamping.board.model.vo.Board;
import com.kh.bootcamping.board.model.vo.Reply;
import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.common.template.Pagination;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

	private final BoardMapper boardMapper;
	private final Pagination pagination;
	
	@Override
	public int selectListCount() {
		return boardMapper.selectListCount();
	}

	@Override
	public List<Board> selectList(PageInfo pi) {
		
		int offset=(pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds= new RowBounds(offset,pi.getBoardLimit());
		return boardMapper.selectList(rowBounds);
	}

	@Override
	public int increaseCount(int boardNo) {
		return 0;
	}

	@Override
	public Board selectBoard(int boardNo) {
		return null;
	}

	@Override
	public int select(Board board) {
		return 0;
	}

	@Override
	public int delete(int boardNo) {
	
		
		return 0;
	}

	@Override
	public int update(Board board) {
		return 0;
	}

	@Override
	public List<Reply> selectReply(int boardNo) {
		return null;
	}

	@Override
	public int insertReply(Reply reply) {
		return 0;
	}

	@Override
	public List<Board> findTopBoard() {
		return null;
	}
	
	// 아래 메서드는 박재인이 작업함
	@Override
	public PageInfo getBoardPageInfo(String memberId, int page, int boardLimit, int pageLimit) {
		int count = boardMapper.selectBoardListCount(memberId);
		
		return pagination.getPageInfo(count, page, boardLimit, pageLimit);
	}
	
	@Override
	public List<Board> selectBoardList(PageInfo pi, String memberId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return boardMapper.seleBoardList(memberId, rowBounds);
	}

}
