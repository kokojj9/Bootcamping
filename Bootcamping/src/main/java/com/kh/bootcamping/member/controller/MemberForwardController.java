package com.kh.bootcamping.member.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.bootcamping.board.model.service.BoardService;
import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.common.template.Pagination;
import com.kh.bootcamping.member.model.service.MemberService;
import com.kh.bootcamping.member.model.vo.Member;
import com.kh.bootcamping.reservation.model.service.ReservationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberForwardController {

	private final MemberService memberService;
	private final ReservationService reservationService;
	private final BoardService boardService;
	
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
	public String forwardMyWishList(Model model, String memberId, int page) {
		
		
		return "member/myWishlist";
	}
	
	@GetMapping("myReservations")
	public String forwardMyReservations(Model model, String memberId, int page) {
		
		PageInfo pi = reservationService.getReservationPageInfo(memberId, page, 10, 5);
		
		model.addAttribute("reservationlist", reservationService.selectReservationList(pi, memberId));
		model.addAttribute("pageInfo", pi);
		return "member/myReservations";
	}
	
	@GetMapping("myBoards")
	public String forwardMyBoards(Model model, String memberId, int page) {
		
		PageInfo pi = boardService.getBoardPageInfo(memberId, page, 10, 5);

		model.addAttribute("boardslist", boardService.selectBoardList(pi, memberId));
		model.addAttribute("pageInfo", pi);
		
		return "member/myBoards";
	}
	
	@GetMapping("myTradeList")
	public String forwardMyTradeList(Model model, String memberId, int page) {
		
		return "member/myTradeList";
	}
	
	@PostMapping("/search-id")
	public String searchId(Model model, String email) {
		String memberId = memberService.searchId(email);

		if(memberId != null) {
			model.addAttribute("memberId", memberId);
		}
		
		return "member/resultSearchId";
	}
	
	@PostMapping("/search-password")
	public String searchPwd(HttpSession session, Member member) {
		if(memberService.searchPwd(member) != null) return "member/editPwd";
		session.setAttribute("errorMsg", "아이디와 이메일이 일치하지 않습니다.");
		
		return "member/searchMemberPwd";
	}
	

}
