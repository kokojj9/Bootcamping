package com.kh.bootcamping.member.model.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.bootcamping.member.model.dao.MemberMapper;
import com.kh.bootcamping.member.model.vo.Member;
import com.kh.bootcamping.member.model.vo.MyPageInfo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

<<<<<<< Updated upstream
	//private final MemberRepository memberRepository;
	//private final SqlSessionTemplate sqlSession;
=======
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
>>>>>>> Stashed changes
	private final MemberMapper memberMapper;
	
	@Override
	public Member login(Member member) {
		return memberMapper.login(member);
	}
	@Override
	public int insertAuthCode(Map<String, String> auth) {
		return memberMapper.insertAuthCode(auth);
	}
	@Override
	public int insertMember(Member member) {
		return memberMapper.insertMember(member);
	}
	@Override
	public String checkMemberEmail(String email) {
		return memberMapper.checkMemberEmail(email);
	}
	@Override
	public String checkAuthCode(Map<String, String> auth) {
		return memberMapper.checkAuthCode(auth);
	}
	@Override
<<<<<<< Updated upstream
	public String checkMemberId(String memberId) {
		return memberMapper.checkMemberId(memberId);
=======
	public String validateMail(String email, HttpServletRequest request) throws MessagingException {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		Map<String, String> auth = new HashMap<String, String>();
		setupMailSender();

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
>>>>>>> Stashed changes
	}
	@Override
	public MyPageInfo searchMyPage(String memberId) {
		return memberMapper.searchMyPage(memberId);
	}
	@Override
	public int editMember(Member member) {
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
	
	
	/*
	@Override
	public Member login(Member member) {
		return memberRepository.login(sqlSession, member);
	}

	@Override
	public int insertAuthCode(Map<String, String> auth) {
		return memberRepository.insertAuthCode(sqlSession, auth);
	}

	@Override
	public int insertMember(Member member) {
		return memberRepository.insertMember(sqlSession, member);
	}

	@Override
	public String checkMemberEmail(String email) {
		return memberRepository.checkMemberEmail(sqlSession, email);
	}

	@Override
	public String checkAuthCode(Map<String, String> auth) {
		return memberRepository.checkAuthCode(sqlSession, auth);
	}

	@Override
	public String checkMemberId(String memberId) {
		return memberRepository.checkMemberId(sqlSession, memberId);
	}

	@Override
	public MyPageInfo searchMyPage(String memberId) {
		return memberRepository.searchMyPage(sqlSession, memberId);
	}

	@Override
	public int editMember(Member member) {
		return memberRepository.editMember(sqlSession, member);
	}

	@Override
	public String searchId(String email) {
		return memberRepository.searchId(sqlSession, email);
	}

	@Override
	public String searchPwd(Member member) {
		return memberRepository.searchPwd(sqlSession, member);
	}
	*/
}
