package com.kh.bootcamping.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.bootcamping.member.model.vo.Member;

@Repository
public class MemberRepository {

	public Member login(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("memberMapper.login", member);
	}

	public String checkMemberEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.checkMemberEmail", email);
	}

	public int insertAuthCode(SqlSessionTemplate sqlSession, Map<String, String> auth) {
		return sqlSession.insert("memberMapper.insertAuthCode", auth);
	}

	public String checkAuthCode(SqlSessionTemplate sqlSession, Map<String, String> auth) {
		return sqlSession.selectOne("memberMapper.checkAuthCode", auth);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}
	
}
