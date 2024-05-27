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
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bootcamping.camping.model.service.CampingService;
import com.kh.bootcamping.common.template.PropertyTemplate;

@Controller
public class CampingForwardController {
	
	@Autowired
	private CampingService campingService;	

	
	@Autowired
	private PropertyTemplate pt;
	
	/**
	 * 캠핑장 상세조회
	 */
	@GetMapping("detailCamping")
	public String detailCamping(@RequestParam("contentId") String campNo, Model model) throws IOException {
		
		if(campingService.detailCamping(campNo) != null) {
			
			String url = "http://apis.data.go.kr/B551011/GoCamping/imageList";
				   url += "?serviceKey=" + pt.getProperties().getProperty("service_key");
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
	@GetMapping("reservation")
	public String campingReservation(@RequestParam("siteNo") int siteNo, String startDate, String endDate, @RequestParam(value="countPeople", defaultValue="1") int countPeople, int sitePrice, Model model) {
		
		if(campingService.campingReservation(siteNo) != null) {
			  
			model.addAttribute("reserSite", campingService.campingReservation(siteNo));
			model.addAttribute("checkInDate", startDate);
			model.addAttribute("checkOutDate", endDate);
			model.addAttribute("people", countPeople);
			model.addAttribute("sitePrice", sitePrice);

			return "reservation/reservation";
		}
		
		return "redirect:/";
		
	}
		
	
}
