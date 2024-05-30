package com.kh.bootcamping.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.bootcamping.common.template.ResponseTemplate;
import com.kh.bootcamping.member.model.service.MemberService;
import com.kh.bootcamping.member.model.vo.ResponseData;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/mail")
public class MailCheckController {
	
	private final MemberService memberService;
	private final ResponseTemplate responseTemplate;

	@ResponseBody
	@PostMapping
	public ResponseEntity<ResponseData> sendMail(@RequestBody Map<String, String> map
												 , HttpServletRequest request) throws MessagingException {
		String email = map.get("email");
		
		if(email == null || email.trim().isEmpty()) {
			return responseTemplate.fail("이메일을 확인해주세요", HttpStatus.BAD_REQUEST);
		}
		
		return memberService.checkMemberEmail(map, request);
	}
	
	@ResponseBody
	@PostMapping("/searchPwdMail")
	public String searchPwdMail(String email, HttpServletRequest request) throws MessagingException {
		return memberService.validateMail(email, request);
	}
	
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
