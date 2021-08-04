package com.health.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LessonDTO {

	private String name;
	private String gender;
	private String goal;
	private String age;
	private String day;
	private String wishtime;
	private String tgender;
	private String wish;
	private String place;
	private String memo;
	private Timestamp time;
	
	
	
}
