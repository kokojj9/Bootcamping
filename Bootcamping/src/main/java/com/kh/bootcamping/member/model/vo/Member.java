package com.kh.bootcamping.member.model.vo;

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
public class Member {
	
	private String memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String birthDay;
	private String phone;
	private String address;
	private String email;
	private String enrollDate;
	private String updateDate;
	private String status;
		
}
