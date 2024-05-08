package com.kh.bootcamping.camping.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bootcamping.camping.model.service.CampingService;
import com.kh.bootcamping.camping.model.vo.Camping;

@Controller
public class CampingController {
	
	@Autowired
	private CampingService campinService;
	
	public static final String SERVICE_KEY = "jDeUHHxyvx1AmWI1ZXjA7MNVQr1NcdX4pFo9EHtlICl0kGxbtpaEOHAtX2o%2FzWb7Kf4WWAGX%2BfvCl5pmtkbviQ%3D%3D";

	/**
	 * 캠핑장 전체 조회 + 페이징처리
	 */
	/**
	@RequestMapping(value="camping")
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
	**/
	@GetMapping("camping")
	public String forward() {
		return "camping/campingList";
	}
	

	@ResponseBody
	@GetMapping(value="insertCamping", produces="application/json; charset=UTF-8")
	public String campingInsert() throws IOException {
	
		
		String url = "http://apis.data.go.kr/B551011/GoCamping/basedList";
			   url += "?serviceKey=" + SERVICE_KEY;
			   url += "&MobileOS=ETC";
			   url += "&numOfRows=3825";
			   url += "&MobileApp=TestApp";
			   url += "&_type=json";
			   
			   System.out.println(url);
			   
			   URL requestUrl = new URL(url);
			   HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
			   urlConnection.setRequestMethod("GET");
			   BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			  
			   String responseJson = br.readLine();
	
			   
			   br.close();
			   urlConnection.disconnect();
			   
			   return responseJson;
	}
	
    @PostMapping(value = "realInsert", consumes = "application/json")
    public void realInsert(@RequestBody List<Camping> campingList) {
    	
    	String str = "";

    	for(Camping c : campingList){

	    	str += "INTO TB_CAMP VALUES ('" + c.getCampNo() + "','" +  c.getCampName() + "','" + c.getCampIntro() + "','" + c.getIntro() 
											+ "','" + c.getType() + "','" + c.getAddress() + "','" + c.getDetailAddress() +
											"','" + c.getMapX() + "','" + c.getMapY() + "','" + c.getCampPhone() + "','" + c.getService() + 
											"','" + c.getHomePage() + "','" + c.getReserPage() + "','" + c.getOper() + "','" + c.getOperDate()
											+ "','" + c.getCampImg() + "','" + c.getCampLocation() + "','" + c.getStatus() + "')";
	
    	}

    	System.out.println(str);
	    

    	
    }


}
