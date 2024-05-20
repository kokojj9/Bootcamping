package com.kh.bootcamping.board.model.dao;


import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bootcamping.board.model.vo.Board;

@Repository
public class BoardRepository {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
		
	}
	
	public List<Board> selectList(SqlSessionTemplate sqlSession, RowBounds rowBounds){
		return sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}

}
