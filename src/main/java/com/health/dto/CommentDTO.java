package com.health.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentDTO {

	private String bid; // boardDto
	private String sname;
	private String bcontent;
	private Timestamp bdate;
	private String commentNo;
	private String user_grade;
	
}
