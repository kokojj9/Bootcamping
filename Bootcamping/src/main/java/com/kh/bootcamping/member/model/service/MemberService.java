package com.kh.bootcamping.member.model.service;

import java.util.Map;

import com.kh.bootcamping.member.model.vo.Member;
import com.kh.bootcamping.member.model.vo.MyPageInfo;

public interface MemberService {

	Member login(Member member);

	int insertAuthCode(Map<String, String> auth);

	int insertMember(Member member);

	String checkMemberEmail(String email);

	String checkAuthCode(Map<String, String> auth);

	String checkMemberId(String memberId);

	MyPageInfo searchMyPage(String memberId);

	int editMember(Member member);

	String searchId(String email);

	String searchPwd(Member member);

}
