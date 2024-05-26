package com.kh.bootcamping.member.model.service;

import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;

import com.kh.bootcamping.member.model.vo.Member;
import com.kh.bootcamping.member.model.vo.MyPageInfo;
import com.kh.bootcamping.member.model.vo.ResponseData;

public interface MemberService {

	Member login(Member member);

	int insertAuthCode(Map<String, String> auth);

	int insertMember(Member member);

	ResponseEntity<ResponseData> checkMemberEmail(Map<String, String> map, HttpServletRequest request) throws MessagingException;

	ResponseEntity<ResponseData> checkAuthCode(Map<String, String> auth);

	ResponseEntity<ResponseData> checkMemberId(String memberId);

	MyPageInfo searchMyPage(String memberId);

	int editMember(Member member);

	String searchId(String email);

	String searchPwd(Member member);

	String validateMail(String email, HttpServletRequest request) throws MessagingException;

}
