package com.kh.bootcamping.member.controller;

import java.nio.charset.Charset;
import java.text.DecimalFormat;
import java.text.Format;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.bootcamping.common.template.PropertyTemplate;
import com.kh.bootcamping.member.model.service.MemberService;
import com.kh.bootcamping.member.model.vo.ResponseData;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/mail")
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
	@PostMapping
	public ResponseEntity<ResponseData> sendMail(@RequestBody Map<String, String> map
												 , HttpServletRequest request) throws MessagingException {
		
		ResponseData rd = new ResponseData(); 
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));

		if(memberService.checkMemberEmail(map.get("email")) != null) {
			rd = ResponseData.builder().ResponseCode("NN")
			            	 .resultMessage("인증번호 발급 실패 (이메일 중복)")
			            	 .build();
		} else {
			rd = ResponseData.builder().ResponseCode(validateMail(map.get("email"), request))
            				 .resultMessage("인증번호 발급 성공")
            				 .build();
		}
		
		return new ResponseEntity<ResponseData>(rd, headers, HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value = "searchPwdMail", produces = "html/text; charset=UTF-8")
	public String searchPwdMail(String email, HttpServletRequest request) throws MessagingException {
		return validateMail(email, request);
	}
	
	//인증이메일 전송 메서드
	private String validateMail(String email, HttpServletRequest request) throws MessagingException {
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
		
		if(memberService.insertAuthCode(auth) == 0) return "NN";
		
		MimeMessage message = impl.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		helper.setTo(email);
		helper.setSubject("인증번호 전송");
		helper.setText("인증번호 : " + code);
		impl.send(message);
		
		return "YY";
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
	@GetMapping
	public ResponseEntity<ResponseData> checkCode(String email, String authCode
												  ,HttpServletRequest request) {
		
		ResponseData rd = new ResponseData(); 
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
		Map<String, String> auth = new HashMap<String, String>();
		
		String remoteAddr = request.getRemoteAddr();
		auth.put("remoteAddr", remoteAddr);
		auth.put("email", email);
		auth.put("authCode", authCode);
		
		if(authCode.equals(memberService.checkAuthCode(auth))) {
			rd = ResponseData.builder().ResponseCode("YY")
				        	 .resultMessage("인증에 성공하였습니다.")
				        	 .build();
		} else {
			rd = ResponseData.builder().ResponseCode("NN")
						     .resultMessage("인증에 실패하였습니다.")
						     .build();
		}
		
		return new ResponseEntity<ResponseData>(rd, headers, HttpStatus.OK);
	}

}
