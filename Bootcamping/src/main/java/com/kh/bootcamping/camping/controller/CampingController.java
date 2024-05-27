package com.kh.bootcamping.camping.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.bootcamping.camping.model.service.CampingService;
import com.kh.bootcamping.camping.model.vo.CampingCheck;
import com.kh.bootcamping.camping.model.vo.ResponseData;
import com.kh.bootcamping.camping.model.vo.Site;
import com.kh.bootcamping.camping.model.vo.WishList;
import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.common.template.Pagination;
import com.kh.bootcamping.common.template.PropertyTemplate;
import com.kh.bootcamping.reservation.model.vo.ReservationInfo;

@RestController
@RequestMapping("camping")
@CrossOrigin("*")
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
    public ResponseEntity<ResponseData> selectDate(ReservationInfo reservationInfo) {
	    
    	List<Site> site = campingService.selectDate(reservationInfo);
    	
    	HttpHeaders header = new HttpHeaders();
    	header.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
    	
    	ResponseData rd = ResponseData.builder()
    								  .data(site)
    								  .message("성공")
    								  .responseCode("C-00")
    								  .build();
    	
		return new ResponseEntity<ResponseData>(rd, header, HttpStatus.OK);
	}

	
	
	/**
	 * 캠핑장 검색
	 */

	@GetMapping(value="searchCamping")
	public ResponseEntity<ResponseData> searchCamping(@RequestParam(value="page", defaultValue="1") int page, String keyword) {
		
		 PageInfo pi = Pagination.getPageInfo(campingService.selectSearchCount(keyword), page, 8, 3);
		
		 HashMap<String, Object> map = new HashMap();
		 
		 map.put("searchCampingList", campingService.searchList(pi, keyword));
	     
		 map.put("pageInfo", pi);
		
		 HttpHeaders header = new HttpHeaders();
		 header.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
		
		 ResponseData rd = ResponseData.builder()
				 					   .data(map)
				 					   .message("성공")
				 					   .responseCode("C-00")
				 					   .build();
		 
		 return new ResponseEntity<ResponseData>(rd, header, HttpStatus.OK);
	
	}
	
	/**
	 * 캠핑장 체크박스 조회
	 */
	@GetMapping(value="checkedCamping", produces="application/json; charset=UTF-8")
	public ResponseEntity<ResponseData> checkedCamping(@RequestParam(value="page", defaultValue="1") int page, CampingCheck campingCheck) {
		
		PageInfo pi = Pagination.getPageInfo(campingService.checkCampingCount(campingCheck), page, 8, 3);
		
		System.out.println(campingCheck);
		
		System.out.println(campingService.checkCampingCount(campingCheck));
		
		HashMap<String, Object> map = new HashMap();
		
		map.put("checkCamping", campingService.checkCamping(pi, campingCheck));
		
		map.put("pageInfo", pi);
		
		HttpHeaders header = new HttpHeaders();
		header.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
	
		ResponseData rd = ResponseData.builder()
				 					  .data(map)
				 					  .message("성공")
				 					  .responseCode("C-00")
				 					  .build();
		 
		return new ResponseEntity<ResponseData>(rd, header, HttpStatus.OK);
		
	}
	
	/**
	 * 캠핑장 찜하기
	 */
	@PostMapping("insert.heart")
	public ResponseEntity<ResponseData> insertHeart(WishList wishList) {
		
		int result = campingService.insertHeart(wishList);
		
		HttpHeaders header = new HttpHeaders();
		header.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
		
		ResponseData rd = ResponseData.builder()
									  .data(result)
									  .message("성공")
									  .responseCode("C-00")
									  .build();
		
		return new ResponseEntity<ResponseData>(rd, header, HttpStatus.OK);
		
	}
	
	/**
	 * 캠핑장 찜취소
	 */
	@PostMapping("delete.heart")
	public ResponseEntity<ResponseData> deleteHeart(WishList wishList) {
		
		int result = campingService.deleteHeart(wishList);
		
		HttpHeaders header = new HttpHeaders();
		header.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
		
		ResponseData rd = ResponseData.builder()
									  .data(result)
									  .message("성공")
									  .responseCode("C-00")
									  .build();
		
		return new ResponseEntity<ResponseData>(rd, header, HttpStatus.OK);
		
	}
	
	
}