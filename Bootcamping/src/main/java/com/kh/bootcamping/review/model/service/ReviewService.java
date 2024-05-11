package com.kh.bootcamping.review.model.service;

import java.util.List;

import com.kh.bootcamping.review.model.vo.Review;

public interface ReviewService {

	List<Review> selectReview (String campNo);
}
