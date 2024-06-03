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
	
	@GetMapping("loginForm")
	public String forwardToLoginPage() {
		return "member/login";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.setAttribute("loginMember", null);
		return "redirect:/";
	}

	@GetMapping("enrollForm")
	public String forwardToEnrollForm() {
		return "member/enrollForm";
	}

	@GetMapping("myPage")
	public String forwardMyPage(Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		model.addAttribute("myPageInfo", memberService.searchMyPage(loginMember.getMemberId()));
		return "member/myPage";
	}
	
	@GetMapping("editForm")
	public String forwardEditMember(Member member, Model model) {
		return "member/editForm";
	}
	
	@GetMapping("searchIdForm")
	public String forwardSearchId() {
		return "member/searchMemberId";
	}
	
	@GetMapping("searchPwdForm")
	public String forwardSearchPwd() {
		return "member/searchMemberPwd";
	}
	
	@GetMapping("myWishList")
	public String forwardMyWishList(Model model, String memberId, int page) {
		
		
		return "member/myWishlist";
	}
	
	@GetMapping("myReservations")
	public String forwardMyReservations(Model model, int page, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		PageInfo pi = reservationService.getReservationPageInfo(loginMember.getMemberId(), page, 10, 5);

		model.addAttribute("reservationlist", reservationService.selectReservationList(pi, loginMember.getMemberId()));
		model.addAttribute("pageInfo", pi);
		return "member/myReservations";
	}
	
	@GetMapping("myBoards")
	public String forwardMyBoards(Model model, int page, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		PageInfo pi = boardService.getBoardPageInfo(loginMember.getMemberId(), page, 10, 5);

		model.addAttribute("boardList", boardService.selectBoardList(pi, loginMember.getMemberId()));
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
