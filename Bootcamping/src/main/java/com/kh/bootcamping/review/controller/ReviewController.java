package com.kh.bootcamping.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.common.template.Pagination;
import com.kh.bootcamping.review.model.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	/**
	 * 리뷰 조회
	 */
	@ResponseBody
	@GetMapping(value="camping/reviewList", produces="application/json; charset=UTF-8")
	public String selectReview(String campNo) {
		return new Gson().toJson(reviewService.selectReview(campNo));
	}
	
	/**
	 * 리뷰 상세 조회
	 */
	@GetMapping("review")
	public ModelAndView reviewList(@RequestParam("campNo") String campNo, @RequestParam(value="page", defaultValue="1") int page, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(reviewService.selectReviewCount(campNo), page, 3, 5);
		
		System.out.println(reviewService.selectReviewCount(campNo));
		
		System.out.println(pi);
		
		if(!reviewService.selectReviewList(pi, campNo).isEmpty()) {
					mv.addObject("review", reviewService.selectReviewList(pi, campNo));
					mv.addObject("pageInfo", pi);
					
					mv.setViewName("review/reviewList");
					
		} else {
			mv.addObject("errorMsg", "리뷰가 존재하지 않습니다.").setViewName("common/errorPage");		
		}

		System.out.println(reviewService.selectReviewList(pi, campNo));
		
		return mv;
		
	}
	
}
