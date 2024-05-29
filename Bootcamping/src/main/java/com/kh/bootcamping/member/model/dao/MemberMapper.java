package com.kh.bootcamping.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.bootcamping.member.model.vo.Member;
import com.kh.bootcamping.member.model.vo.MyPageInfo;

@Mapper
public interface MemberMapper {

	Member login(Member member);

	int insertAuthCode(Map<String, String> auth);

	int insertMember(Member member);

	String checkMemberEmail(String email);

	String checkAuthCode(Map<String, String> auth);

	String checkMemberId(String memberId);

	List<MyPageInfo> searchMyPage(String memberId);

	int editMember(Member member);

	String searchId(String email);

	String searchPwd(Member member);
	
}
