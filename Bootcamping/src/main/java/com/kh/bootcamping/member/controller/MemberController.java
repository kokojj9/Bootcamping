package com.kh.bootcamping.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bootcamping.member.model.service.MemberService;
import com.kh.bootcamping.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("loginForm")
	public String forwardToLoginPage() {
		return "member/login";
	}
	
	//로그인 메서드
	@PostMapping("member.login")
	public ModelAndView login(Member member, String rememberId,
							  HttpSession session, ModelAndView mv) {
		
		Member loginMember = memberService.login(member);
		
		if(rememberId.equals("true")) {
			saveId(member.getMemberId());
		}
		
		if(loginMember != null && bcryptPasswordEncoder.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
			session.setAttribute("loginMember", loginMember);
			mv.setViewName("redirect:/");
		} else {
			
		}
		
		return mv;
	}
	
	protected void saveId(String saveId) {
		
	}
	//쿠키 생성 메서드
	
	//쿠키 삭제 메서드
	
	//회원가입 메서드
	
	//마이페이지 메서드
	
	
	
	
}
