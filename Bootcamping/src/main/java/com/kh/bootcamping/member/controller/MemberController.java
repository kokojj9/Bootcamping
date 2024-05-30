package com.kh.bootcamping.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bootcamping.common.template.ResponseTemplate;
import com.kh.bootcamping.member.model.service.MemberService;
import com.kh.bootcamping.member.model.vo.Member;
import com.kh.bootcamping.member.model.vo.ResponseData;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/members")
public class MemberController {

	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	private final MemberService memberService;
	private final ResponseTemplate responseTemplate;
	
	@PostMapping("/login")
	public ModelAndView login(Member member, @RequestParam(defaultValue = "false")String rememberId,
				              HttpSession session, ModelAndView mv,
				              HttpServletResponse response) {
		
		Member loginMember = memberService.login(member);
		
		if (loginMember != null && bcryptPasswordEncoder.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
			session.setAttribute("loginMember", loginMember);
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "로그인 실패").setViewName("redirect:/loginForm");
		}
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/check-id/{memberId}")
	public ResponseEntity<ResponseData> checkMemberId(@PathVariable String memberId) {
		if (memberId == null || memberId.trim().isEmpty()) {
			return responseTemplate.fail("잘못된 요청", HttpStatus.BAD_REQUEST);
		}
		
		return memberService.checkMemberId(memberId);
	}
	
	@PostMapping("/register")
	public ModelAndView insertMember(@Valid Member member, BindingResult br
			                         ,HttpSession session, ModelAndView mv) {
		
		if(member.getMemberId() == null || member.getMemberPwd() == null || member.getEmail() == null) {
            mv.addObject("alertMsg", "유효성 검사 실패").setViewName("redirect:/enrollForm");
		} else {
			
			if(memberService.insertMember(member) > 0) {
				session.setAttribute("alertMsg", "회원가입에 성공했습니다.");
				mv.setViewName("redirect:/");
			} else {
				mv.addObject("alertMsg", "회원 가입에 실패했습니다.").setViewName("common/errorPage");
			}
		}
		
		return mv; 
	}
	
	@ResponseBody
	@PostMapping(value = "/edit-password", produces = "application/json; charset=UTF-8")
	public ResponseEntity<ResponseData> editPassword(@RequestBody Member member) {
		if(member != null) {
			Member loginMember = memberService.login(member);
			
			if(loginMember != null && bcryptPasswordEncoder.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
				return responseTemplate.success("비밀번호 인증 성공", "YY", null);
			} else {
				return responseTemplate.success("비밀번호 인증 실패", "NN", null);
			}
		} else {
			return responseTemplate.fail("비밀번호 인증오류", HttpStatus.BAD_REQUEST);
		}
	}
	
	@ResponseBody
	@PostMapping("/edit")
	public String editMember(Member member, HttpSession session) {
		String result = "NN";
		if(member != null) {
			result = memberService.editMember(member) > 0 ? "YY" : "NN";
		}
		session.setAttribute("loginMember", memberService.login(member));
	
		return result;
	}
	
		

}
