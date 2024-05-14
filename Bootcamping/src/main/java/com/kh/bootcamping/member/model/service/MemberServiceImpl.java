package com.kh.bootcamping.member.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bootcamping.member.model.dao.MemberRepository;
import com.kh.bootcamping.member.model.vo.Member;
import com.kh.bootcamping.member.model.vo.MyPageInfo;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
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

}
