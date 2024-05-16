package com.kh.bootcamping.review.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.review.model.dao.ReviewRepository;
import com.kh.bootcamping.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewRepository reviewRepository;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Review> selectReview(String campNo) {
		return reviewRepository.selectReview(sqlSession, campNo);
	}

	@Override
	public int selectReviewCount(String campNo) {
		return reviewRepository.selectReviewCount(sqlSession, campNo);
	}

	@Override
	public List<Review> selectReviewList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return reviewRepository.selectReviewList(sqlSession, rowBounds);
	}

}
