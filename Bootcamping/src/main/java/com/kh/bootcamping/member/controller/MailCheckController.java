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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
	
	@Value("${username}")
    private String adminName;

    @Value("${password}")
    private String adminPassword;
    
    @Value("${host}")
    private String host;
    
    @Value("${port}")
    private String port;
	
	/***
	 * 인증코드 전송 메서드
	 * @param email 사용자가 입력한 이메일
	 * @param request 
	 * @throws MessagingException
	 */
	@ResponseBody
	@PostMapping("mail")
	public String sendMail(String email, HttpServletRequest request) throws MessagingException {
		// 이메일 중복 확인
		if(memberService.checkMemberEmail(email) == null) {
			return "fail";
		} else {

			JavaMailSenderImpl impl = new JavaMailSenderImpl();
			
			impl.setHost(host);
			impl.setPort(Integer.parseInt(port));
			impl.setUsername(adminName);
			impl.setPassword(adminPassword);
			
			// 옵션 설정
			Properties prop = new Properties();
			prop.put("mail.smtp.auth", true);
			prop.put("mail.smtp.starrls.enable", true);
			
			impl.setJavaMailProperties(prop);
			
			sender = impl;
			
			// 인증코드 생성
			String code = getAuthCode();
			// 신청자 아이피 포트 번호 추출
			String remoteAddr = request.getRemoteAddr();
			
			Map<String, String> auth = new HashMap<String, String>();
			auth.put("code", code);
			auth.put("email", email);
			auth.put("remoteAddr", remoteAddr);
			
			// 이메일, 인증코드 DB저장
			if(memberService.insertAuthCode(auth) > 0) {
				return "fail";
			}
			
			// 메세지 정보 세팅
			MimeMessage message = sender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			
			// 메세지 생성
			helper.setTo(email);
			helper.setSubject("인증번호 전송");
			helper.setText("인증번호 : " + code);
			
			sender.send(message);
			
			return "success";
		}
	}
	
	// 인증코드 생성 메서드
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
			return "인증 성공";
		} else {
			return "인증 실패";
		}
	}
	
	
	
	
	
	
}
