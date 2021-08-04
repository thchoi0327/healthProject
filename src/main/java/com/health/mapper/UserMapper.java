package com.health.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.health.dto.ApplicationDTO;
import com.health.dto.MessageDTO;
import com.health.dto.TeacherDTO;
import com.health.dto.UserDTO;

@Mapper
public interface UserMapper {
	//회원가입
	int joininsert(UserDTO dto);

	//로그인
	UserDTO selectLoginCheck(String user_id,String user_pw);
	
	//아이디 중복체크
	UserDTO selectUserid(String user_id);
	
	//닉네임 중복체크
	UserDTO selectUsernick(String user_nick);

	ArrayList<MessageDTO> getAllMsg(String userNick);

	// 메세지 하나 가져오기
	MessageDTO getContentViewMsg(String mid);
	// 메세지 읽음처리
	void msgRead(String mid);

	ArrayList<ApplicationDTO> getAllApplication(String ateacherNick);

	// 수강신청서 하나 가져오기
	ApplicationDTO getApplicationContent(String aid);

	// 유저 id 찾기
	UserDTO searchUserId(UserDTO dto);
	
	// 유저 PW 찾기
	UserDTO searchUserPw(UserDTO dto);

	// 마의 페이지 내 정보 가져오기
	UserDTO getMyInfo(String user_nick);
	
	// 내 강사 정보 가져오기
	TeacherDTO getTeacherInfo(String user_nick);
	
	// 유저 비밀번호 변경
	int changeUserPw(UserDTO dto);
}
