package com.kh.bootcamping.review.model.service;

import java.util.List;

import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.review.model.vo.Review;

public interface ReviewService {

	List<Review> selectReview (String campNo);
	
	int selectReviewCount(String campNo);
	
	List<Review> selectReviewList(PageInfo pi, String campNo);
	
	Review selectReviewOne(int reservationNo);
	
	int deleteReivew (int reservationNo);

}
