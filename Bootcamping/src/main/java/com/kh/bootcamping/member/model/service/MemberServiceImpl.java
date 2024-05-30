package com.kh.bootcamping.member.model.service;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.common.template.PropertyTemplate;
import com.kh.bootcamping.common.template.ResponseTemplate;
import com.kh.bootcamping.member.model.dao.MemberMapper;
import com.kh.bootcamping.member.model.vo.Member;
import com.kh.bootcamping.member.model.vo.MyPageInfo;
import com.kh.bootcamping.member.model.vo.ResponseData;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	private final MemberMapper memberMapper;
	private final PropertyTemplate pt;
	private final ResponseTemplate responseTemplate;
	
	@Override
	public Member login(Member member) {
		return memberMapper.login(member);
	}
	
	@Override
	public int insertAuthCode(Map<String, String> auth) {
		return memberMapper.insertAuthCode(auth);
	}
	
	// 컨트롤러에서 비즈니스 로직 분리
	@Override
	public int insertMember(Member member) {
		member.setMemberPwd(bcryptPasswordEncoder.encode(member.getMemberPwd()));
		
		return memberMapper.insertMember(member);
	}
	
	@Override
	public ResponseEntity<ResponseData> checkMemberEmail(Map<String, String> map, HttpServletRequest request) {
		try {
			if(validateMail(map.get("email"), request).equals("YY")) {
				String message = memberMapper.checkMemberEmail(map.get("email")) == null ? "인증에 성공하였습니다." : "인증에 실패하였습니다.";
				return responseTemplate.success(message, "YY", null);
			}
			
			return responseTemplate.success("이메일 전송에 실패했습니다.", "NN", null);
		} catch (Exception e) {
			return responseTemplate.fail("서버 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@Override
	public ResponseEntity<ResponseData> checkAuthCode(Map<String, String> auth) {
		try {
			String message = auth.get("authCode").equals(memberMapper.checkAuthCode(auth)) ? "사용 가능한 아이디입니다." : "사용할 수 없는 아이디입니다.(아이디 중복)";
			return responseTemplate.success(message, "YY", null);
		} catch (Exception e) {
			return responseTemplate.fail("서버 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	//인증이메일 전송 메서드
	@Override
	public String validateMail(String email, HttpServletRequest request) throws MessagingException {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		Map<String, String> auth = new HashMap<String, String>();
		setupMailSender(mailSender);

		String code = getAuthCode();
		String remoteAddr = request.getRemoteAddr();

		auth.put("remoteAddr", remoteAddr);
		auth.put("email", email);
		auth.put("code", code);

		if (memberMapper.insertAuthCode(auth) == 0) return "NN";

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

		helper.setTo(email);
		helper.setSubject("인증번호 전송");
		helper.setText("인증번호 : " + code);
		mailSender.send(message);

		return "YY";
	}
	
	private void setupMailSender(JavaMailSenderImpl mailSender) {
		Properties prop = new Properties();
		mailSender.setPort(Integer.parseInt(pt.getProperties().getProperty("port")));
		mailSender.setUsername(pt.getProperties().getProperty("username"));
		mailSender.setPassword(pt.getProperties().getProperty("password"));
		mailSender.setHost(pt.getProperties().getProperty("host"));

		prop.put("mail.smtp.ssl.trust", pt.getProperties().getProperty("host"));
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.auth", "true");

		mailSender.setJavaMailProperties(prop);
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
	
	// 컨트롤러에서 비즈니스 로직 분리
	@Override
	public ResponseEntity<ResponseData> checkMemberId(String memberId) {
		try {
			String message = memberMapper.checkMemberId(memberId) == null ? "사용 가능한 아이디입니다." : "사용 불가능한 아이디입니다(아이디 중복).";
			return responseTemplate.success(message, "YY", null);
		} catch(Exception e) {
			return responseTemplate.fail("서버 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@Override
	public MyPageInfo searchMyPage(String memberId) {
		List<MyPageInfo> myPageInfoList = memberMapper.searchMyPage(memberId);
		
		if (myPageInfoList.isEmpty()) {
			return null;
        }
        
        return myPageInfoList.get(0);
	}
	
	@Override
	public int editMember(Member member) {
		if(member.getChangePwdType().equals("Y")) {
			member.setMemberPwd(bcryptPasswordEncoder.encode(member.getMemberPwd()));
		}
		return memberMapper.editMember(member);
	}
	
	@Override
	public String searchId(String email) {
		return memberMapper.searchId(email);
	}
	
	@Override
	public String searchPwd(Member member) {
		return memberMapper.searchPwd(member);
	}
	
	
}
