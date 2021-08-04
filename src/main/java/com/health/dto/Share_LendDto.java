package com.health.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Share_LendDto {
	
	private int shareLend_num;
	private String shareLend_id;
	private String shareLend_category;
	private String shareLend_nick;
	private String shareLend_title;
	private String shareLend_content;
	private String shareLend_region;
	private String shareLend_tel;
	private int shareLend_money;
	private int shareLend_hit;
	private String shareLend_file;
	private Timestamp shareLend_date;
	
	
}
