package com.kh.bootcamping.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	@GetMapping(value="reviewList", produces="application/json; charset=UTF-8")
	public String selectReview(String campNo) {
		return new Gson().toJson(reviewService.selectReview(campNo));
	}
	
	/**
	 * 리뷰 상세 조회
	 */
	@GetMapping("review")
	public ModelAndView reviewList(@RequestParam("campNo") String campNo, @RequestParam(value="page", defaultValue="1") int page, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(reviewService.selectReviewCount(campNo), page, 3, 5);
		
		if(!reviewService.selectReviewList(pi, campNo).isEmpty()) {
					mv.addObject("review", reviewService.selectReviewList(pi, campNo));
					mv.addObject("pageInfo", pi);
					mv.addObject("campNo", campNo);
					
					mv.setViewName("review/reviewList");
					
		} else {
			mv.addObject("errorMsg", "리뷰가 존재하지 않습니다.").setViewName("common/errorPage");		
		}
		
		return mv;
		
	}
	
	
	/**
	 * 리뷰 수정
	 */
	@PostMapping("updateForm.review")
	public ModelAndView selectReviewOne(int reservationNo, ModelAndView mv) {
		
		System.out.println(reservationNo);
		mv.addObject("review", reviewService.selectReviewOne(reservationNo)).setViewName("review/updateReview");
	
		System.out.println(reviewService.selectReviewOne(reservationNo));
		
		return mv;
	}
	
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)Math.random() * 90000 + 10000;
		
		String changeName = ext + currentTime + ranNum;
		
		String savePath = session.getServletContext().getRealPath("/resources/reviewImg/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
 		return "resources/reviewImg/" + changeName;
		
	}
	
	
}
