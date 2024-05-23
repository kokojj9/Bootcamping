package com.kh.bootcamping.member.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.bootcamping.member.model.service.MemberService;
import com.kh.bootcamping.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberForwardController {

	private final MemberService memberService;
	
	// 로그인 포워딩 메서드
	@GetMapping("loginForm")
	public String forwardToLoginPage() {
		return "member/login";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.setAttribute("loginMember", null);
		return "redirect:/";
	}

	//회원가입 화면 포워딩 메서드
	@GetMapping("enrollForm")
	public String forwardToEnrollForm() {
		return "member/enrollForm";
	}

	//마이페이지 메서드
	@GetMapping("myPage")
	public String forwardMyPage(String memberId, Model model) {
		model.addAttribute("myPageInfo", memberService.searchMyPage(memberId));
		return "member/myPage";
	}
	
	// 회원 정보 수정 페이지 포워딩 메서드
  @GetMapping("editForm")
	public String forwardEditMember(Member member, Model model) {
		return "member/editForm";
	}
	
	// 아이디 찾기 포워딩 메서드
	@GetMapping("searchIdForm")
	public String forwardSearchId() {
		return "member/searchMemberId";
	}
	
	// 비밀번호 찾기 포워딩 메서드
	@GetMapping("searchPwdForm")
	public String forwardSearchPwd() {
		return "member/searchMemberPwd";
	}
	
	@GetMapping("myWishList")
	public String forwardMyWishList() {
		return "member/myWishlist";
	}
	
	@GetMapping("myReservations")
	public String forwardMyReservations() {
		return "member/myReservations";
	}
	
	@GetMapping("myBoards")
	public String forwardMyBoards() {
		return "member/myBoards";
	}
	
	@GetMapping("myTradeList")
	public String forwardMyTradeList() {
		return "member/myTradeList";
	}

}
