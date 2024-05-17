package com.kh.bootcamping.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bootcamping.review.model.vo.Review;

@Repository
public class ReviewRepository {
	
	public List<Review> selectReview(SqlSession sqlSession, String campNo){
		return sqlSession.selectList("reviewMapper.selectReview", campNo);
	}

	public int selectReviewCount(SqlSession sqlSession, String campNo) {
		return sqlSession.selectOne("reviewMapper.selectReviewCount", campNo);
	}
	
	public List<Review> selectReviewList(SqlSession sqlSession, String campNo, RowBounds rowBounds){
		return sqlSession.selectList("reviewMapper.selectReviewList", campNo, rowBounds);
	}
	
	public Review selectReviewOne(SqlSession sqlSession, int reservationNo) {
		return sqlSession.selectOne("reviewMapper.selectReviewOne", reservationNo);
	}
	
	public int deleteReivew(SqlSession sqlSession, int reservationNo) {
		return sqlSession.update("reviewMapper.deleteReivew", reservationNo);
	}
	
	
	
}
