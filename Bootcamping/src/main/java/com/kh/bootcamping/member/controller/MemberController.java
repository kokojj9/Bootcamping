package com.kh.bootcamping.member.controller;

import java.nio.charset.Charset;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bootcamping.board.controller.CookieController;
import com.kh.bootcamping.board.model.service.BoardService;
import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.common.template.Pagination;
import com.kh.bootcamping.member.model.service.MemberService;
import com.kh.bootcamping.member.model.vo.Member;
import com.kh.bootcamping.member.model.vo.ResponseData;
import com.kh.bootcamping.reservation.model.service.ReservationService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/members")
public class MemberController {

	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	private final ReservationService reservationService;
	private final CookieController cookieController;
	private final MemberService memberService;
	private final BoardService boardService;
	
	/**
	 * 로그인 메서드 내부에서 쿠키저장 메서드를 호출함
	 * @param member 아이디, 비밀번호 필드에 로그인정보가 들어있음
	 * @param rememberId 쿠키에 저장할 아이디
	 * @param session
	 * @param mv
	 * @param response
	 * @return
	 */
	@PostMapping("/login")
	public ModelAndView login(Member member, @RequestParam(defaultValue = "false")String rememberId,
				              HttpSession session, ModelAndView mv,
				              HttpServletResponse response) {
		
		Member loginMember = memberService.login(member);
		
		if(rememberId.equals("true")) cookieController.saveIdCookie(member.getMemberId(), response);
		else cookieController.deleteIdCookie(response);
				
		if(loginMember != null && bcryptPasswordEncoder.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
			session.setAttribute("loginMember", loginMember);
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "로그인 실패").setViewName("redirect:/loginForm");
		}
		
		return mv;
	}
	
	//아이디 중복체크
	@ResponseBody
	@GetMapping("/check-id/{memberId}")
	public ResponseEntity<ResponseData> checkMemberId(@PathVariable String memberId) {
		ResponseData rd = new ResponseData(); 
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
		
		if(memberService.checkMemberId(memberId) == null) {
			rd = ResponseData.builder().responseCode("YY")
						     .resultMessage("사용 가능한 아이디입니다")
						     .build();
		} else {
			rd = ResponseData.builder().responseCode("NN")
						     .resultMessage("사용할 수 없는 아이디입니다.(아이디 중복)")
						     .build();
		}
		
		return new ResponseEntity<ResponseData>(rd, headers, HttpStatus.OK);
	}
	
	//회원 가입 메서드
	@PostMapping("/register")
	public ModelAndView insertMember(@Valid Member member, BindingResult br
			                         ,HttpSession session, ModelAndView mv) {
		
		if(member.getMemberId() == null || member.getMemberPwd() == null || member.getEmail() == null) {
            mv.addObject("alertMsg", "유효성 검사 실패").setViewName("common/errorPage");
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
	
	// 회원정보 수정 로그인 메서드 활용
	@ResponseBody
	@PostMapping("/edit-Password")
	public String editPassword(Member member) {
		
		Member loginMember = memberService.login(member);
		
		if(loginMember != null && bcryptPasswordEncoder.matches(member.getMemberPwd(), loginMember.getMemberPwd())) {
			return "YY";
		}
			return "NN";
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
	@PostMapping("/edit")
	public String editMember(Member member, HttpSession session) {
		String result = "NNNNN";
		
		if(member != null) {
			if(member.getChangePwdType().equals("Y")) {
				String encPwd = bcryptPasswordEncoder.encode(member.getMemberPwd());
				member.setMemberPwd(encPwd);
			}
			
			result = memberService.editMember(member) > 0 ? "YYYYY" : "NNNNN";
		}
		session.setAttribute("loginMember", memberService.login(member));
		
		return result;
	}
	
		

}
