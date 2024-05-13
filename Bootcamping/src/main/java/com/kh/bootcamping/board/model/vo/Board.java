package com.kh.bootcamping.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;

import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
@Builder
public class Board {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date updateDate;
	private String status;
	private int memberNo;
	private String categoryCode;
	private int count;
	

}
