package com.kh.bootcamping.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
				              HttpSession session, ModelAndView mv,
				              HttpServletResponse response) {
		
		Member loginMember = memberService.login(member);
		
		if(rememberId.equals("true")) saveIdCookie(member.getMemberId(), response);
		else deleteIdCookie(response);
				
		if(loginMember != null && bcryptPasswordEncoder.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
			session.setAttribute("loginMember", loginMember);
			mv.setViewName("redirect:/");
		} else {
			// model.addAttribute 메소드체인이 가능함
			mv.addObject("errorMsg", "로그인 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//쿠키 생성 메서드
	protected void saveIdCookie(String saveId, HttpServletResponse response) {
		Cookie saveIdCookie = new Cookie("saveId", saveId);
		saveIdCookie.setMaxAge(1*60*60*24);
		
		response.addCookie(saveIdCookie);
	}
	
	//쿠키 삭제 메서드
	protected void deleteIdCookie(HttpServletResponse response) {
		Cookie saveIdCookie = new Cookie("saveId","");
		saveIdCookie.setMaxAge(0);
		
		response.addCookie(saveIdCookie);
	}
	
	//회원가입 메서드
	@GetMapping("enrollForm")
	public String forwardToEnrollForm() {
		return "member/enrollForm";
	}
	
	//마이페이지 메서드
	
	
	
	
}
