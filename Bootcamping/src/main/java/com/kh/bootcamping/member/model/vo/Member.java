package com.kh.bootcamping.member.model.vo;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Member {

	private String memberNo;
	@NotBlank
    private String memberId;
	@NotBlank
    private String memberPwd;
	@NotBlank
    private String email;
	private String enrollDate;
	private String updateDate;
	private String status;
	private String privilege;
	private String social;
	private String postCode;
	private String roadAddress;
	private String detailAddress;
	private String changePwdType;
	
}
