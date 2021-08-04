package com.health.dto;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApplicationDTO {

	private int aid;
	private String ateacherNick;
	private String astudentNick;
	private String astudentTel;
	private String awantStartDate;
	private String awantEndDate;
	private String awantTime;
	private String astudentText;
	private Timestamp awriteDate;
	
	
}
