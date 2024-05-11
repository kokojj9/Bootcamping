package com.kh.bootcamping.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.bootcamping.review.model.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@ResponseBody
	@GetMapping(value="camping/reviewList", produces="application/json; charset=UTF-8")
	public String selectReview(String campNo) {
		System.out.println(reviewService.selectReview(campNo));
		return new Gson().toJson(reviewService.selectReview(campNo));
	}
	
	
}
