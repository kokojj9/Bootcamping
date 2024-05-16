package com.kh.bootcamping.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {
	
	private String memberNo;
	private String memberId;
	private String memberPwd;
	private String email;
	private String enrollDate;
	private String updateDate;
	private String status;
	private String privilege;
	private String social;
	private String postCode;
	private String roadAddress;
	private String detailAddress;
		
}
