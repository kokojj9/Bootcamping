package com.kh.bootcamping.member.model.service;

import java.util.Map;

import com.kh.bootcamping.member.model.vo.Member;

public interface MemberService {

	Member login(Member member);

	int insertAuthCode(Map<String, String> auth);

	int insertMember(Member member);

	String checkMemberEmail(String email);

	String checkAuthCode(Map<String, String> auth);

}
