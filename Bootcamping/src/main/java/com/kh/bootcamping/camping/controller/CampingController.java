package com.kh.bootcamping.camping.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.bootcamping.camping.model.service.CampingService;
import com.kh.bootcamping.camping.model.vo.CampingCheck;
import com.kh.bootcamping.camping.model.vo.WishList;
import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.common.template.Pagination;
import com.kh.bootcamping.common.template.PropertyTemplate;
import com.kh.bootcamping.reservation.model.vo.ReservationInfo;

@RestController
@RequestMapping("camping")
public class CampingController {
	
	@Autowired
	private CampingService campingService;
	
	@Autowired
	private PropertyTemplate pt;

	/**
	 * 캠핑장 전체 조회 + 페이징처리
	 */
	@GetMapping
	public ModelAndView camping(@RequestParam(value="page", defaultValue="1") int page,  ModelAndView mv) throws IOException {
		
		PageInfo pi = Pagination.getPageInfo(3825, page, 8, 3);
		
		String url = "http://apis.data.go.kr/B551011/GoCamping/basedList";
		   url += "?serviceKey=" + pt.getProperties().getProperty("service_key");
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
	
	@GetMapping(value="mapCamping",  produces="application/json; charset=UTF-8")
	public String mapCamping() throws IOException {
		
		String url = "http://apis.data.go.kr/B551011/GoCamping/basedList";
			   url += "?serviceKey=" + pt.getProperties().getProperty("service_key");
			   url += "&MobileOS=ETC";
			   url += "&MobileApp=TestApp";
			   url += "&numOfRows=3825";
			   url += "&_type=json";
			   
			   // System.out.println(url);
			   
			   URL requestUrl = new URL(url);
			   HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
			   BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			   String responseJson = br.readLine();
			   
			   br.close();
			   urlConnection.disconnect();
	
		return responseJson;
		
	}
	
	
	

	
	/**
	 * 
	 */
    @PostMapping(value="selectDate", produces="application/json; charset-UTF-8")
    public String selectDate(ReservationInfo reservationInfo) {
	       
		return new Gson().toJson(campingService.selectDate(reservationInfo));
	}

	
	
	/**
	 * 캠핑장 검색
	 */
	@GetMapping(value="searchCamping", produces="application/json; charset=UTF-8")
	public String searchCamping(@RequestParam(value="page", defaultValue="1") int page, String keyword) {
		
		PageInfo pi = Pagination.getPageInfo(campingService.selectSearchCount(keyword), page, 8, 3);
		
		 HashMap<String, Object> map = new HashMap();
		 
		 map.put("searchCampingList", campingService.searchList(pi, keyword));
	     
		 map.put("pageInfo", pi);
		
		 System.out.println(map);
		
		 return new Gson().toJson(map);
	
	}
	
	/**
	 * 캠핑장 체크박스 조회
	 */
	@GetMapping(value="checkedCamping", produces="application/json; charset=UTF-8")
	public String checkedCamping(@RequestParam(value="page", defaultValue="1") int page, CampingCheck campingCheck) {
		
		PageInfo pi = Pagination.getPageInfo(campingService.checkCampingCount(campingCheck), page, 8, 5);
		
		System.out.println(campingCheck);
		
		System.out.println(campingService.checkCampingCount(campingCheck));
		
		HashMap<String, Object> map = new HashMap();
		
		map.put("checkCamping", campingService.checkCamping(pi, campingCheck));
		
		map.put("pageInfo", pi);
		
		System.out.println(map);
		
		return new Gson().toJson(map);
		
	}
	
	/**
	 * 캠핑장 찜하기
	 */
	@PostMapping("insert.heart")
	public String insertHeart(WishList wishList) {
		
		int result = campingService.insertHeart(wishList);
		
		return result > 0 ? "success" : "fail";
	}
	
	/**
	 * 캠핑장 찜취소
	 */
	@PostMapping("delete.heart")
	public String deleteHeart(WishList wishList) {
		
		int result = campingService.deleteHeart(wishList);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	
}