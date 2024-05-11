package com.kh.bootcamping.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.bootcamping.member.model.vo.KakaoMember;

@Controller
public class SocialLoginController {
	
	
	
	@GetMapping("kakaoLogin")
	public String kakaoLogin(String code, HttpSession session) throws IOException, ParseException {
		String accessToken = getToken(code);
		
		KakaoMember sm = getUserInfo(accessToken);
		
		/*
		 * sm을 들고 Service -> Dao -> DB에서 sm 에서 id 값만 SELECT해서 회원정보 있는지 조회
		 * 
		 * 있으면 -> 로그인
		 * 
		 * 없으면 - > 회원가입
		 * 
		 */
		
		session.setAttribute("loginUser", sm);
		
		
		return "redirect:kakao";
	}
	
	public String getToken(String code) throws IOException, ParseException {
		
		String tokenUrl = "https://kauth.kakao.com/oauth/token?";
		
		URL url = new URL(tokenUrl);
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		urlConnection.setRequestMethod("POST");
		urlConnection.setDoOutput(true);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		
		StringBuilder sb = new StringBuilder();

		sb.append("client_id=85c39dbc1ec627a28e9a0f8c3d432556");
		sb.append("&grant_type=authorization_code");
		sb.append("&redirect_uri=http://localhost:8001/spring/code");
		sb.append("&code=" + code);
		
		bw.write(sb.toString());
		bw.flush();
		
		//System.out.println(urlConnection.getResponseCode());
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String line = "";
		String responseDate = "";
		
		while((line = br.readLine()) != null) {
			responseDate += line;
		}
		
		//System.out.println(responseDate);
		JSONParser parser = new JSONParser();
		JSONObject element = (JSONObject)parser.parse(responseDate);
		
		String accessToken = element.get("access_token").toString();
		
		//System.out.println(accessToken);
		
		br.close();
		bw.close();
		
		return accessToken;
	}

	public KakaoMember getUserInfo(String accessToken) throws IOException, ParseException {
		
		String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
		
		URL url = new URL(userInfoUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setRequestMethod("GET");
		urlConnection.setRequestProperty("Authorization", "bearer " + accessToken);
		
		//System.out.println(urlConnection.getResponseCode());
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseDate = br.readLine();
		
		System.out.println(responseDate);
		
		JSONObject responseObj = (JSONObject)new JSONParser().parse(responseDate);
		
		KakaoMember sm = new KakaoMember();
		
		sm.setId(responseObj.get("id").toString());
		JSONObject propObj = (JSONObject)responseObj.get("properties");
		sm.setNickName(propObj.get("nickname").toString());
		sm.setThumbnailImage(propObj.get("thumbnail_image").toString());
		
		return sm;
	}
	
	
	
}
