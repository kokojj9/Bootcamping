package com.kh.bootcamping.board.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CookieController {

	/***
	 * 쿠키 생성 메서드
	 * @param saveId 사용자가 입력한 아이디
	 * @param response
	 */
	public void saveIdCookie(String saveId, HttpServletResponse response) {
	    Cookie saveIdCookie = new Cookie("saveId", saveId);
	    saveIdCookie.setMaxAge(60 * 60 * 24); // 1 day
	    saveIdCookie.setPath("/"); // 쿠키가 사이트 전역에서 유효하도록 설정
	    saveIdCookie.setHttpOnly(true); // 클라이언트 측 스크립트에서 쿠키에 접근하지 못하도록 설정
	    response.addCookie(saveIdCookie);
	}

	/***
	 * 쿠키 삭제 메서드
	 * @param response
	 */
	public void deleteIdCookie(HttpServletResponse response) {
	    Cookie saveIdCookie = new Cookie("saveId", "");
	    saveIdCookie.setMaxAge(0); // 쿠키 만료
	    saveIdCookie.setPath("/"); // 경로 설정 일치
	    response.addCookie(saveIdCookie);
	}
	
}
