package com.health.service;

import java.util.ArrayList;

import com.health.dto.ApplicationDTO;
import com.health.dto.MessageDTO;
import com.health.dto.TeacherDTO;
import com.health.dto.UserDTO;

public interface UserService {
	//회원가입
	int JoinUser(UserDTO userDto);
	
	//로그인
	UserDTO LoginCheck(String user_id, String user_pw);
	
	//아이디중복체크
	UserDTO idCheck(String user_id);

	//닉네임 중복체크
	UserDTO nickCheck(String user_nick);
	
	// 모든 쪽지 가져오기
	ArrayList<MessageDTO> getAllMsg(String userNick);

	MessageDTO contentViewMsg(String mid);

	// 수강 신청서 모두 가져오기
	ArrayList<ApplicationDTO> getApplication(String ateacherNick);

	// 수강 신청서 하나 가져오기
	ApplicationDTO getApplicationContent(String aid);
	
	// 내 정보 가져오기
	UserDTO getMyInfo(String user_nick);
	
	// 강사 정보 가져오기
	TeacherDTO getMyTeacherInfo(String user_nick);

	// 유저 패스워드 변경
	int changeUserPW(UserDTO dto);


	
}
