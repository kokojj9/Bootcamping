package com.kh.bootcamping.member.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.member.model.dao.MemberRepository;
import com.kh.bootcamping.member.model.vo.Member;
import com.kh.bootcamping.member.model.vo.MyPageInfo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

	private final MemberRepository memberRepository;
	
	private final SqlSessionTemplate sqlSession;
	
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

}
