package com.kh.bootcamping.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @NoArgsConstructor @AllArgsConstructor
public class Review {
	
	private int reservationNo;
	private String reviewContent;
	private String reviewScore;
	private String reviewPath;
	private String createDate;
	private String reviewYn;
	private String memberId;
	

}
