package com.kh.bootcamping.review.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.review.model.dao.ReviewMapper;
import com.kh.bootcamping.review.model.dao.ReviewRepository;
import com.kh.bootcamping.review.model.vo.Review;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	private final ReviewRepository reviewRepository;
	private final ReviewMapper reviewMapper;
	
	@Override
	public List<Review> selectReview(String campNo) {
		return reviewMapper.selectReview(campNo);
	}

	@Override
	public int selectReviewCount(String campNo) {
		return reviewMapper.selectReviewCount(campNo);
	}

	@Override
	public List<Review> selectReviewList(PageInfo pi, String campNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return reviewMapper.selectReviewList(campNo, rowBounds);
	}

	@Override
	public Review selectReviewOne(int reservationNo) {
		return reviewMapper.selectReviewOne(reservationNo);
	}
	
	@Override
	public int updateReview(Review review) {
		return reviewMapper.updateReview(review);
	}


	@Override
	public int deleteReivew(int reservationNo) {
		return reviewMapper.deleteReivew(reservationNo);
	}


}
