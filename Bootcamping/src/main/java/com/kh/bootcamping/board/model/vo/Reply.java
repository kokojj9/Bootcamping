package com.kh.bootcamping.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
@AllArgsConstructor
@Builder
public class Reply {
	
	private int replyNo;
	private int boardNo;
	private int memberNo;
	private String replyContent;
	private Date enrollDate;
	private String status;
	

}
