package com.kh.bootcamping.notice.model.vo;

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
public class Notice {
	
	private int boardNo;
	private String categoryNo;
	private int memberNo;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	

}
