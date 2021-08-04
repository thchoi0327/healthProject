package com.health.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionDTO {

	private String bid;
	private String bname;
	private String title;
	private String bcontent;
	private String subject;
	private String bdate;
	private int bhit;
	private int bgroup;
	private int bstep;
	private int bident;
	private String fileName;
}
