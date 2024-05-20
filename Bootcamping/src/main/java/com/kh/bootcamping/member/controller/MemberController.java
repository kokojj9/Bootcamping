package com.kh.bootcamping.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bootcamping.board.model.service.BoardService;
import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.common.template.Pagination;
import com.kh.bootcamping.member.model.service.MemberService;
import com.kh.bootcamping.member.model.vo.Member;
import com.kh.bootcamping.reservation.model.service.ReservationService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MemberController {

	private final MemberService memberService;
	
	private final ReservationService reservationService;
	
	private final BoardService boardService;
	
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("loginForm")
	public String forwardToLoginPage() {
		return "member/login";
	}
	
	/**
	 * 로그인 메서드 내부에서 쿠키저장 메서드를 호출함
	 * @param member 아이디, 비밀번호 필드에 로그인정보가 들어있음
	 * @param rememberId 쿠키에 저장할 아이디
	 * @param session
	 * @param mv
	 * @param response
	 * @return
	 */
	@PostMapping("members/login")
	public ModelAndView login(Member member, @RequestParam(defaultValue = "false")String rememberId,
				              HttpSession session, ModelAndView mv,
				              HttpServletResponse response) {
		
		Member loginMember = memberService.login(member);
		
		if(rememberId.equals("true")) saveIdCookie(member.getMemberId(), response);
		else deleteIdCookie(response);
				
		if(loginMember != null && bcryptPasswordEncoder.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
			session.setAttribute("loginMember", loginMember);
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "로그인 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.setAttribute("loginMember", null);
		return "redirect:/";
	}
	
	/***
	 * 쿠키 생성 메서드
	 * @param saveId 사용자가 입력한 아이디
	 * @param response
	 */
	private void saveIdCookie(String saveId, HttpServletResponse response) {
		Cookie saveIdCookie = new Cookie("saveId", saveId);
		saveIdCookie.setMaxAge(1*60*60*24);
		response.addCookie(saveIdCookie);
	}
	
	/***
	 * 쿠키 삭제 메서드
	 * @param response
	 */
	private void deleteIdCookie(HttpServletResponse response) {
		Cookie saveIdCookie = new Cookie("saveId","");
		saveIdCookie.setMaxAge(0);
		response.addCookie(saveIdCookie);
	}
	
	//회원가입 화면 포워딩 메서드
	@GetMapping("enrollForm")
	public String forwardToEnrollForm() {
		return "member/enrollForm";
	}
	
	//아이디 중복체크
	@ResponseBody
	@GetMapping("members/{memberId}")
	public String checkMemberId(@PathVariable(name = "memberId") String memberId) {
		return memberService.checkMemberId(memberId);
	}
	
	//회원 가입 메서드
	@PostMapping("members")
	public ModelAndView insertMember(Member member, HttpSession session, ModelAndView mv) {
		
		if(member.getEmail().equals("") && member.getMemberId().equals("") && member.getMemberPwd().equals("")) {
			mv.addObject("alertMsg", "회원 가입에 실패했습니다.").setViewName("common/errorPage");
		} else {
			String encPwd = bcryptPasswordEncoder.encode(member.getMemberPwd());
			member.setMemberPwd(encPwd);
			
			if(memberService.insertMember(member) > 0) {
				session.setAttribute("alertMsg", "회원가입에 성공했습니다.");
				mv.setViewName("redirect:/");
			} else {
				mv.addObject("alertMsg", "회원 가입에 실패했습니다.").setViewName("common/errorPage");
			}
		}
		
		return mv;
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
	
	// 회원정보 수정 로그인 메서드 활용
	@ResponseBody
	@PostMapping("members/editPassword")
	public String editPassword(Member member) {
		Member loginMember = memberService.login(member);
		
		if(loginMember != null && bcryptPasswordEncoder.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
			return "YYYYY";
		}
			return "NNNNN";
	}
	
	/**
	 * 회원 정보 수정 메서드
	 * @param member
	 * @param postcode
	 * @param roadAddress
	 * @param detailAddress
	 * @return
	 */
	@ResponseBody
	@PostMapping("members/edit")
	public String editMember(Member member) {
		String result = "NNNNN";
		
		if(member != null) {
			if(member.getChangePwdType().equals("Y")) {
				String encPwd = bcryptPasswordEncoder.encode(member.getMemberPwd());
				member.setMemberPwd(encPwd);
			}
			
			result = memberService.editMember(member) > 0 ? "YYYYY" : "NNNNN";
		}
		
		return result;
	}
	
	/**
	 * 마이페이지 예약 내역 리스트
	 * @param model
	 * @param memberId
	 * @param page
	 * @return
	 */
	@GetMapping("reservations")
	public String selectMemberReservationList(Model model, String memberId, int page) {
		
		PageInfo pi = Pagination.getPageInfo(reservationService.selectReservationListCount(memberId), 
											 page,
											 10,
											 5);
		
		model.addAttribute("reservationlist", reservationService.selectReservationList(pi, memberId));
		model.addAttribute("pageInfo", pi);
		
		return "member/myReservationList";
	}
	
	/**
	 * 마이페이지 내가 쓴 글 리스트
	 * @param model
	 * @param memberId
	 * @param page
	 * @return
	 */
	@GetMapping("boards")
	public String selectMemberBoardList(Model model, String memberId, int page) {
		
		PageInfo pi = Pagination.getPageInfo(boardService.selectBoardListCount(memberId), 
				 page,
				 10,
				 5);

		model.addAttribute("boardslist", boardService.selectBoardList(pi, memberId));
		model.addAttribute("pageInfo", pi);
		
		return "member/myBoardList";
	}
	
	@GetMapping("searchIdForm")
	public String forwardSearchId() {
		return "member/searchMemberId";
	}
	
	@GetMapping("searchPwdForm")
	public String forwardSearchPwd() {
		return "member/searchMemberPwd";
	}
	
	@PostMapping("members/searchId")
	public String searchId(Model model, String email) {
		String memberId = memberService.searchId(email);
		if(memberId != null) {
			model.addAttribute("memberId", memberId);
			return "member/resultSearchId";
		}
		
		return "common/errorPage";
	}
	
	
	
	
	
	
	
	
}
