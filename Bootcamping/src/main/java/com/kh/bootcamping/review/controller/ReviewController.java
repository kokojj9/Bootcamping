package com.kh.bootcamping.review.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.common.template.Pagination;
import com.kh.bootcamping.review.model.service.ReviewService;
import com.kh.bootcamping.review.model.vo.ResponseData;
import com.kh.bootcamping.review.model.vo.Review;

@Controller
@CrossOrigin("*")
public class ReviewController {

   @Autowired
   private ReviewService reviewService;
   
	@Autowired
	private Pagination pagination;
   
   /**
    * 리뷰 조회
    */
   @ResponseBody
   @GetMapping(value="reviewList")
   public ResponseEntity<ResponseData> selectReview(String campNo) {
      
      List<Review> review = reviewService.selectReview(campNo);
      
      HttpHeaders header = new HttpHeaders();
      header.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
   
      ResponseData rd = ResponseData.builder()
                              .data(review)
                              .message("성공")
                              .responseCode("C-00")
                              .build();
       
      return new ResponseEntity<ResponseData>(rd, header, HttpStatus.OK);
      
   
   }
   
   /**
    * 리뷰 상세 조회
    */
   @GetMapping("review")
   public ModelAndView reviewList(@RequestParam("campNo") String campNo, @RequestParam(value="page", defaultValue="1") int page, ModelAndView mv) {
      
      PageInfo pi = pagination.getPageInfo(reviewService.selectReviewCount(campNo), page, 3, 5);
      
      if(!reviewService.selectReviewList(pi, campNo).isEmpty()) {
               
               mv.addObject("review", reviewService.selectReviewList(pi, campNo));
               mv.addObject("pageInfo", pi);
               mv.addObject("campNo", campNo);
               mv.setViewName("review/reviewList");
               
      } else {
         mv.setViewName("review/reviewList");   
      
      }
      
      return mv;
      
   }
   
   
   /**
    * 리뷰 수정 페이지 이동
    */
   @PostMapping("updateForm.review")
   public ModelAndView selectReviewOne(int reservationNo, ModelAndView mv) {
      
      mv.addObject("review", reviewService.selectReviewOne(reservationNo)).setViewName("review/updateReview");

      return mv;
   }
   
   /**
    * 리뷰 수정 페이지
    */
   @PostMapping("update.review")
   public String updateReview(Review review, 
                        MultipartFile reUpfile, 
                        HttpSession session) {
      
      if(!reUpfile.getOriginalFilename().contentEquals("")) {
         
         // 기존 리뷰 이미지 경로 삭제
         if(review.getReviewPath() != null) {
            new File(session.getServletContext().getRealPath(review.getReviewPath())).delete();
         }
         
         // 새로 첨부한 리뷰이미지 업로드
         review.setReviewPath(saveFile(reUpfile, session));
         
      }
      
      if(reviewService.updateReview(review) > 0) {
         session.setAttribute("alertMsg", "리뷰 수정이 완료 되었습니다!");
         return "redirect:/";
      } else {
         session.setAttribute("alertMsg", "리뷰 수정에 실패했습니다");
         return "redirect:/";
      }
      
   }
   
   
   public String saveFile(MultipartFile upfile, HttpSession session) {
      
      String originName = upfile.getOriginalFilename();
      
      String ext = originName.substring(originName.lastIndexOf("."));
      
      String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
      
      int ranNum = (int)Math.random() * 90000 + 10000;
      
      String changeName = currentTime + ranNum + ext;
      
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
   
   
   /**
    * 리뷰 삭제
    */
   @PostMapping("delete.review")
   public String deleteReivew(int reservationNo, HttpSession session, String filePath) {
      
      if(reviewService.deleteReivew(reservationNo) > 0) {
         
         if(!filePath.equals("")) {
            
            new File(session.getServletContext().getRealPath(filePath)).delete();
         }
         
         session.setAttribute("alertMsg", "리뷰 삭제가 완료 되었습니다!");
         return "redirect:/";
         
      } else {
         
         session.setAttribute("errorMsg", "리뷰 삭제 실패");
         return "common.errorPage";
         
      }
      
   }
   
   /**
    * 리뷰 등록 페이지 이동
    */
   @PostMapping("insertForm.review")
   public ModelAndView insertReviewForm(int reservationNo, ModelAndView mv) {
      mv.addObject("review", reviewService.selectReviewOne(reservationNo)).setViewName("review/reviewEnrollForm");
      
      return mv;
   }
   
   /**
    * 리뷰 등록
    *//*
   @PostMapping("insert.review")
   public String insertReview(int reservationNo, String filePath) {
      
   }*/
   
   
   
   
}