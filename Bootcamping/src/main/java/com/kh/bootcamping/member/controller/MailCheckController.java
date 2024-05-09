package com.kh.bootcamping.member.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Properties;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bootcamping.member.model.service.MemberService;

@Controller
public class MailCheckController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSenderImpl sender;
	
	/***
	 * 인증코드 전송 메서드
	 * @param email 사용자가 입력한 이메일
	 * @param request 
	 * @throws MessagingException
	 */
	@ResponseBody
	@PostMapping("mail")
	public void sendMail(String email, HttpServletRequest request) throws MessagingException {
		JavaMailSenderImpl impl = new JavaMailSenderImpl();
		
		// 계정 설정
		/*
		impl.setHost("smtp.gmail.com");
		impl.setPort(587);
		impl.setUsername(username);
		impl.setPassword(password);
		외부파일로 관리
		*/ 
		
		// 옵션 설정
		Properties prop = new Properties();
		prop.put("mail.smtp.auth", true);
		prop.put("mail.smtp.starrls.enable", true);
		
		impl.setJavaMailProperties(prop);
		
		sender = impl;
		
		// 인증코드 만들기 메서드로 따로 빼기
		
		String remoteAddr = request.getRemoteAddr();
		
		Random r = new Random();
		int i = r.nextInt(100000);
		Format f = new DecimalFormat("000000");	
		String code = f.format(i);
		// 메세지 정보 세팅
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		// 이메일을 조회해서 있는지 확인부터해야하나???
		// 이메일, 인증코드 DB저장
		//memberService.insertAuthCode(email, code);
		
		// 메세지 생성
		
		helper.setTo(email);
		helper.setSubject("인증번호 전송");
		helper.setText("인증번호 : " + code);
		
		sender.send(message);
		
		
	}
	
	/***
	 * 회원가입 이메일 인증메서드
	 * @param email 사용자가 입력한 이메일
	 * @param authCode 사용자가 입력한 인증코드
	 */
	@ResponseBody
	@GetMapping("mail")
	public void checkCode(String email, int authCode) {
		/*
		if(authCode.equals(memberService.checkEmail())) {
			//이메일 인증성공
		} else {
			//인증 실패
		}
		*/
	}
	
	
	
	
	
	
}
