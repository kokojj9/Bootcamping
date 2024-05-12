package com.kh.bootcamping.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bootcamping.review.model.vo.Review;

@Repository
public class ReviewRepository {
	
	public List<Review> selectReview(SqlSession sqlSession, String campNo){
		return sqlSession.selectList("reviewMapper.selectReview", campNo);
	}

}
