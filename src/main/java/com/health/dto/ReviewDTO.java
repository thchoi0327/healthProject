package com.health.dto;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDTO {

	private String tname;
	private String subject;
	private String score;
	private String sname;
	private String rating;
	private String bid;
	private Timestamp rdate;
	
}
