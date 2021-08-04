package com.health.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TeacherDTO {

	private String tid;
	private String tname;
	private String subject;
	private String introduce;
	private String area;
	private String license;
	private String tdate;
	private String fileName;
	private String grade;
	private String bid;
	private int point;
	
}
