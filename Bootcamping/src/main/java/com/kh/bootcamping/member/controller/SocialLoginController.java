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

import com.kh.bootcamping.common.template.PropertyTemplate;
import com.kh.bootcamping.member.model.service.MemberService;
import com.kh.bootcamping.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class SocialLoginController {
	
	private final MemberService memberService;
	private final PropertyTemplate pt;
	
	@GetMapping("kakaoLoginForm")
	public String forwardKakao() {
		String client_id = pt.getProperties().getProperty("client_id");
		StringBuilder sb = new StringBuilder();
		sb.append("https://kauth.kakao.com/oauth/authorize?client_id=" + client_id);   
		sb.append("&redirect_uri=http://localhost:8001/bootcamping/kakaoLogin");
		sb.append("&response_type=code&scope=profile_image,profile_nickname");
		
		return "redirect:" + sb.toString();
	}
	
	@GetMapping("kakaoLogin")
	public String kakaoLogin(String code, HttpSession session) throws IOException, ParseException {
		String accessToken = getToken(code);
		
		Member sm = getUserInfo(accessToken);
		
		if(memberService.login(sm) != null) {
			session.setAttribute("loginMember", sm);
		} else {
			if(memberService.insertMember(sm) > 0) {
				session.setAttribute("loginMember", sm);
			} else {
				session.setAttribute("errorMsg", "회원가입에 실패하였습니다.");
				return "common/errorPage";
			}
		}
		
		return "redirect:/";
	}
	
	public String getToken(String code) throws IOException, ParseException {
		String client_id = pt.getProperties().getProperty("client_id");
		String tokenUrl = "https://kauth.kakao.com/oauth/token?";
		
		URL url = new URL(tokenUrl);
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		
		urlConnection.setRequestMethod("POST");
		urlConnection.setDoOutput(true);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		StringBuilder sb = new StringBuilder();
				
		sb.append("client_id=" + client_id);
		sb.append("&grant_type=authorization_code");
		sb.append("&redirect_uri=http://localhost:8001/bootcamping/kakaoLogin");
		sb.append("&code=" + code);
		
		bw.write(sb.toString());
		bw.flush();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String line = "";
		String responseDate = "";
		
		while((line = br.readLine()) != null) {
			responseDate += line;
		}
		
		JSONParser parser = new JSONParser();
		JSONObject element = (JSONObject)parser.parse(responseDate);
		
		String accessToken = element.get("access_token").toString();
		
		br.close();
		bw.close();
		
		return accessToken;
	}
	
	public Member getUserInfo(String accessToken) throws IOException, ParseException {
		String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
		
		URL url = new URL(userInfoUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setRequestMethod("GET");
		urlConnection.setRequestProperty("Authorization", "bearer " + accessToken);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseDate = br.readLine();
		Member sm = new Member();
		JSONObject responseObj = (JSONObject)new JSONParser().parse(responseDate);
		sm.setMemberId(responseObj.get("id").toString());
		
		return sm;
	}
	
	
	
}
