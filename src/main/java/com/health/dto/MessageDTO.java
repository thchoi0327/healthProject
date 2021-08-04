package com.health.dto;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MessageDTO {

	private int mid;
	private String msendNick;
	private String mreceiveNick;
	private String mcontent;
	private int mcategory;
	private Timestamp mdate;
}
