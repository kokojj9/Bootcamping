package com.kh.bootcamping.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bootcamping.board.model.service.BoardService;
import com.kh.bootcamping.board.model.vo.Board;
import com.kh.bootcamping.common.model.vo.PageInfo;
import com.kh.bootcamping.common.template.Pagination;
import com.kh.bootcamping.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {
	
	// 게시판은 페이징처리를 할 예정 
	@Autowired
	private BoardService boardService;
	
	
	//header.jsp에서 클릭시 => 1 =>list.board(처음 게시판 들어갈 때)
	// 페이징바에서 눌렀다 => list.board?page=요청페이지
	@RequestMapping("boardList")
	public String selectAll(@RequestParam(value="page",defaultValue="1")
							int page,
								Model model) {
		// 총개수 == DB가서 조회
		// 요청페이지 == ?
		// 한페이지에 몇개 ==5
		// 페이징 바 몇개 ==5
		
		PageInfo pi=Pagination.getPageInfo(boardService.selectListCount() ,
											page, 
											5, 
											5);
		model.addAttribute("board", boardService.selectList(pi));
		model.addAttribute("pageInfo",pi);
		
		System.out.println(boardService.selectList(pi));
		
		System.out.println("페이징 인포:"+pi);
		
		
		
		return "board/boardList";
	}
	
	
	// 게시글 등록 양식으로 보내주는 메소드
	@RequestMapping("add.board")
	public String insert() {
		
		return "board/boardEnrollForm";
	}
	
	// 게시글 등록
	@PostMapping("insert.Board") 
	public String update (HttpSession session,Board board, Model model,MultipartFile upfile) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberNo = loginMember.getMemberNo();
		board.setMemberNo(memberNo);
		String category=board.getCategoryName();
		
		switch(category) {
		case "자유" 			: board.setCategoryCode("C1"); break;
		case "후기" 			: board.setCategoryCode("C2"); break;
		case "꿀팁" 			: board.setCategoryCode("C3"); break;
		case "자랑" 			: board.setCategoryCode("C4"); break;
		}
			boardService.select(board);
			
		if(boardService.update(board)> 0) {
			model.addAttribute("alertMsg","게시글이 등록되었습니다");
		} else {
			model.addAttribute("alertMsg","게시글이 등록되지 않았습니다");
		}
		return "board/boardList";
		
	}
	/*
	// 첨부파일 정보 받아오기
 public String saveFile(MultipartFile upfile, HttpSession session) throws IllegalStateException, IOException {
		
		String originName = upfile.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
	//	String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)Math.random()*90000 + 10000;
//		String changeName = currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/uploadedFiles");
		
//		upfile.transferTo(new File(savePath + changeName));
	
//		return "resources/uploadedFiles" + changeName;
 

	}
	
	
	 */
	
}

