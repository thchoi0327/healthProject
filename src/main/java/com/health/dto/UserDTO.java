package com.health.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_tel;
	private String user_email;
	private String user_gender;
	private String user_grade;
	private String user_nick;
}
