package com.kh.bootcamping.member.model.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

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
	
	@NotBlank(message = "아이디는 필수 입력 항목입니다.")
    @Pattern(regexp = "^[a-zA-Z0-9]+$", message = "아이디는 영문자와 숫자만 포함할 수 있습니다.")
    @Size(min = 5, message = "아이디는 최소 5자 이상이어야 합니다.")
    private String memberId;

    @NotBlank(message = "비밀번호는 필수 입력 항목입니다.")
    @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[!@#$%^&*])[a-zA-Z\\d!@#$%^&*]{8,}$",
             message = "비밀번호는 영문자, 숫자, 특수문자를 포함하여 8자 이상이어야 합니다.")
    private String memberPwd;

    @NotBlank(message = "이메일은 필수 입력 항목입니다.")
    @Email(message = "올바른 이메일 형식이어야 합니다.")
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
