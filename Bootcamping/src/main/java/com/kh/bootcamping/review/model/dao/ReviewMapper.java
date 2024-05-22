package com.kh.bootcamping.review.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.bootcamping.review.model.vo.Review;

@Mapper
public interface ReviewMapper {
	
	List<Review> selectReview(String campNo);
	
	int selectReviewCount(String campNo);

	List<Review> selectReviewList(String campNo, RowBounds rowBounds);
	
	Review selectReviewOne(int reservationNo);
	
	int updateReview(Review review);
	
	int deleteReivew(int reservationNo);
	
}
