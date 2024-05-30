package com.kh.bootcamping.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.bootcamping.member.model.service.MemberService;
import com.kh.bootcamping.member.model.vo.ResponseData;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/mail")
public class MailCheckController {
	
	private final MemberService memberService;
	
	/**
	 * 인증코드 전송 메서드
	 * @param email 사용자가 입력한 이메일
	 * @param request 
	 * @throws MessagingException
	 */
	@ResponseBody
	@PostMapping
	public ResponseEntity<ResponseData> sendMail(@RequestBody Map<String, String> map
												 , HttpServletRequest request) throws MessagingException {
		return memberService.checkMemberEmail(map, request);
	}
	
	/***
	 * 비밀번호 찾기 메일 인증 메서드
	 * @param email
	 * @param request
	 * @return
	 * @throws MessagingException
	 */
	@ResponseBody
	@PostMapping("/searchPwdMail")
	public String searchPwdMail(String email, HttpServletRequest request) throws MessagingException {
		return memberService.validateMail(email, request);
	}
	
	/***
	 * 회원가입 이메일 인증메서드
	 * @param email 사용자가 입력한 이메일
	 * @param authCode 사용자가 입력한 인증코드
	 */
	@ResponseBody
	@GetMapping
	public ResponseEntity<ResponseData> checkCode(String email, String authCode
												  ,HttpServletRequest request) {
		Map<String, String> auth = new HashMap<String, String>();
		String remoteAddr = request.getRemoteAddr();
		
		auth.put("remoteAddr", remoteAddr);
		auth.put("email", email);
		auth.put("authCode", authCode);
		
		return memberService.checkAuthCode(auth);
	}

}
