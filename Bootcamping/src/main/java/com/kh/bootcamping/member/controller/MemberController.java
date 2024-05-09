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
	
	/***
	 * 로그인 메서드 내부에서 쿠키저장 메서드를 호출함
	 * @param member 아이디, 비밀번호 필드에 로그인정보가 들어있음
	 * @param rememberId 쿠키에 저장할 아이디
	 * @param session
	 * @param mv
	 * @param response
	 * @return
	 */
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
			mv.addObject("errorMsg", "로그인 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/***
	 * 쿠키 생성 메서드
	 * @param saveId 사용자가 입력한 아이디
	 * @param response
	 */
	private void saveIdCookie(String saveId, HttpServletResponse response) {
		Cookie saveIdCookie = new Cookie("saveId", saveId);
		saveIdCookie.setMaxAge(1*60*60*24);
		
		response.addCookie(saveIdCookie);
	}
	
	/***
	 * 쿠키 삭제 메서드
	 * @param response
	 */
	private void deleteIdCookie(HttpServletResponse response) {
		Cookie saveIdCookie = new Cookie("saveId","");
		saveIdCookie.setMaxAge(0);
		
		response.addCookie(saveIdCookie);
	}
	
	//회원가입 화면 포워딩 메서드
	@GetMapping("enrollForm")
	public String forwardToEnrollForm() {
		return "member/enrollForm";
	}
	
	//회원 가입 메서드
	
	//마이페이지 메서드
	
	
	
	
}
