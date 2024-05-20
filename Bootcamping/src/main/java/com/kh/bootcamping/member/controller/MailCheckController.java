package com.kh.bootcamping.member.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bootcamping.common.template.PropertyTemplate;
import com.kh.bootcamping.member.model.service.MemberService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MailCheckController {
	
	private final MemberService memberService;

	private final PropertyTemplate pt;
	
	/**
	 * 인증코드 전송 메서드
	 * @param email 사용자가 입력한 이메일
	 * @param request 
	 * @throws MessagingException
	 */
	@ResponseBody
	@PostMapping(value="mail", produces = "html/text; charset=UTF-8")
	public String sendMail(String email, HttpServletRequest request) throws MessagingException {
		if(memberService.checkMemberEmail(email) != null) {
			return "NNNNN";
		} else {
			
			Map<String, String> auth = new HashMap<String, String>();
			JavaMailSenderImpl impl = new JavaMailSenderImpl();
			Properties prop = new Properties();

			impl.setPort(Integer.parseInt(pt.getProperties().getProperty("port")));
			impl.setUsername(pt.getProperties().getProperty("username"));
			impl.setPassword(pt.getProperties().getProperty("password"));
			impl.setHost(pt.getProperties().getProperty("host"));
			
			prop.put("mail.smtp.ssl.trust", pt.getProperties().getProperty("host"));
			prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.auth", "true");
			
			impl.setJavaMailProperties(prop);
			
			String code = getAuthCode();
			String remoteAddr = request.getRemoteAddr();
			
			auth.put("remoteAddr", remoteAddr);
			auth.put("email", email);
			auth.put("code", code);
			if(memberService.insertAuthCode(auth) == 0) return "NNNNN";
			
			MimeMessage message = impl.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			
			helper.setTo(email);
			helper.setSubject("인증번호 전송");
			helper.setText("인증번호 : " + code);
			impl.send(message);
			
			return "YYYYY";
		}
	}
	
	/**
	 * 인증코드 생성 메서드
	 * @return
	 */
	private String getAuthCode() {
		Random r = new Random();
		int i = r.nextInt(100000);
		Format f = new DecimalFormat("000000");	
		
		return f.format(i);
	}
	
	/***
	 * 회원가입 이메일 인증메서드
	 * @param email 사용자가 입력한 이메일
	 * @param authCode 사용자가 입력한 인증코드
	 */
	@ResponseBody
	@GetMapping("mail")
	public String checkCode(String email, String authCode, HttpServletRequest request) {
		String remoteAddr = request.getRemoteAddr();
		
		Map<String, String> auth = new HashMap<String, String>();
		auth.put("authCode", authCode);
		auth.put("email", email);
		auth.put("remoteAddr", remoteAddr);
		
		if(authCode.equals(memberService.checkAuthCode(auth))) {
			return "YYYYY";
		} else {
			return "NNNNN";
		}
	}
	
	
	
	
	
	
}
