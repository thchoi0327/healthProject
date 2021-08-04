package com.health.siteUtil;

import com.health.dto.UserDTO;

public interface Email {
	
	String emailCheck(String emailAdr);

	int searchUserId(UserDTO dto);

	int searchUserPw(UserDTO dto);
}
