package com.kh.bootcamping.camping.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.bootcamping.camping.model.service.CampingService;
import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.common.template.Pagination;
import com.kh.bootcamping.reservation.model.vo.ReservationInfo;

@Controller
public class CampingController {
	
	@Autowired
	private CampingService campingService;
	
	public static final String SERVICE_KEY = "jDeUHHxyvx1AmWI1ZXjA7MNVQr1NcdX4pFo9EHtlICl0kGxbtpaEOHAtX2o%2FzWb7Kf4WWAGX%2BfvCl5pmtkbviQ%3D%3D";

	/**
	 * 캠핑장 전체 조회 + 페이징처리
	 */
	@RequestMapping("camping")
	public ModelAndView camping(@RequestParam(value="page", defaultValue="1") int page,  ModelAndView mv) throws IOException {
		
		PageInfo pi = Pagination.getPageInfo(3825, page, 8, 5);
		
		String url = "http://apis.data.go.kr/B551011/GoCamping/basedList";
			   url += "?serviceKey=" + SERVICE_KEY;
			   url += "&MobileOS=ETC";
			   url += "&MobileApp=TestApp";
			   url += "&numOfRows=8";
			   url += "&pageNo=" + page;
			   url += "&_type=json";
			   
			   // System.out.println(url);
			   
			   URL requestUrl = new URL(url);
			   HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
			   BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			   String responseJson = br.readLine();
			   
			   mv.addObject("json", responseJson);
			   
			   
			   
			   mv.addObject("pageInfo", pi);
			   
			   mv.setViewName("camping/campingList");
			   
			   br.close();
			   urlConnection.disconnect();
			   
			   return mv;
		
	}
	
	/**
	 * 캠핑장 상세조회
	 */
	@GetMapping("camping/detail")
	public String detailCamping(@RequestParam("contentId") String campNo, Model model) throws IOException {
		
		if(campingService.detailCamping(campNo) != null) {
			
			String url = "http://apis.data.go.kr/B551011/GoCamping/imageList";
				   url += "?serviceKey=" + SERVICE_KEY;
				   url += "&MobileOS=ETC";
				   url += "&MobileApp=TestApp";
				   url += "&contentId=" + campNo;
				   url += "&_type=json";
				   
				   URL requestUrl = new URL(url);
				   HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
				   BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
				   String responseJson = br.readLine();
				   
				   model.addAttribute("campImg", responseJson);
				   
				   br.close();
				   urlConnection.disconnect();

				
				model.addAttribute("camping", campingService.detailCamping(campNo));
				model.addAttribute("site", campingService.siteList(campNo));
				
				
			return "camping/detailCamping";	
			
		} else {
			return "redirect:/";
		}
		


		
	}
	
	/**
	 * 
	 */
    @ResponseBody
    @PostMapping(value="camping/selectDate", produces="application/json; charset-UTF-8")
    public String selectDate(ReservationInfo reservationInfo) {
        
	        System.out.println(reservationInfo);
	       
		return new Gson().toJson(reservationInfo);
	}
	
	
	
	/**
	 * 
	 */
	@GetMapping("reservation")
	public String campingReservation(@RequestParam("siteNo") int siteNo, String checkInDate, String checkOutDate, Model model) {
		
		if(campingService.campingReservation(siteNo) != null) {
			
			model.addAttribute("reserSite", campingService.campingReservation(siteNo));
			model.addAttribute("checkInDate", checkInDate);
			model.addAttribute("checkOutDate", checkOutDate);
			
			System.out.println(checkInDate);
			
			return "reservation/reservation";
		}
		
		return "redirect:/";
		
	}
	
 


}
