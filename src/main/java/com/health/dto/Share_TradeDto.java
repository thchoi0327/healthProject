package com.health.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Share_TradeDto {
	
	private int shareTrade_num;
	private String shareTrade_id;
	private String shareTrade_category;
	private String shareTrade_nick;
	private String shareTrade_title;
	private String shareTrade_content;
	private String shareTrade_region;
	private String shareTrade_tel;
	private int shareTrade_money;
	private int shareTrade_hit;
	private String shareTrade_file;
	private Timestamp shareTrade_date;
}
