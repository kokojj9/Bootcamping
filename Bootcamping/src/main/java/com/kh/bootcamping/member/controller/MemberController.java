package com.kh.bootcamping.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.bootcamping.member.model.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("loginForm")
	public String forwardToLoginPage() {
		return "member/login";
	}
	
	//로그인 메서드
	
	//쿠키 생성 메서드
	
	//쿠키 삭제 메서드
	
	//회원가입 메서드
	
	//마이페이지 메서드
	
	
	
	
}
