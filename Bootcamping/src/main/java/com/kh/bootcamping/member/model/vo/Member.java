package com.kh.bootcamping.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class Member {
	
	private String memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String BirthDay;
	private String phone;
	private String address;
	private String email;
	private String enrollDate;
	private String updateDate;
	private String status;
		
}
