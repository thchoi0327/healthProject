package com.health.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.health.dto.ApplicationDTO;
import com.health.dto.MessageDTO;
import com.health.dto.TeacherDTO;
import com.health.dto.UserDTO;
import com.health.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper mapper;
	
	//-----------------< 회원가입 >---------------------------------
	@Override
	public int JoinUser(UserDTO userDto) {
		return mapper.joininsert(userDto);
	}
	
	//아이디 중복체크
	@Override
	public UserDTO idCheck(String user_id) {
		return mapper.selectUserid(user_id);
	}
	// 닉네임 중복체크
	@Override
	public UserDTO nickCheck(String user_nick) {
		return mapper.selectUsernick(user_nick);
	}
	
	//-----------------< 로그인 >---------------------------------
	@Override
	public UserDTO LoginCheck(String user_id, String user_pw) {
		
		return mapper.selectLoginCheck(user_id,user_pw);
	}

	// 마이페이지 진입 / 쪽지 가져오기
	@Override
	public ArrayList<MessageDTO> getAllMsg(String userNick) {
		return mapper.getAllMsg(userNick);
	}

	// 메세지 하나 가져오기 및 읽음 처리하기
	@Override
	public MessageDTO contentViewMsg(String mid) {
		mapper.msgRead(mid);
		return mapper.getContentViewMsg(mid);
	}

	// 모든 수강신청서 가져오기
	@Override
	public ArrayList<ApplicationDTO> getApplication(String ateacherNick) {
		return mapper.getAllApplication(ateacherNick);
	}

	// 수강 신천서 한개 가져오기
	@Override
	public ApplicationDTO getApplicationContent(String aid) {
		return mapper.getApplicationContent(aid);
	}

	// 내 정보 가져오기
	@Override
	public UserDTO getMyInfo(String user_nick) {
		
		return mapper.getMyInfo(user_nick);
	}

	// 강사 정보 가져오기
	@Override
	public TeacherDTO getMyTeacherInfo(String user_nick) {
		
		return mapper.getTeacherInfo(user_nick);
	}

	// 유저 패스워드 변경
	@Override
	public int changeUserPW(UserDTO dto) {
		
		return mapper.changeUserPw(dto);
	}

	

	

}//class
