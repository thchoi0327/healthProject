package com.health.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.health.dto.MessageDTO;
import com.health.dto.TeacherDTO;
import com.health.dto.UserDTO;
import com.health.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper mapper;
	
	
	
	// 강사신청서리스트 끌어오기
	@Override
	public ArrayList<TeacherDTO> teacherAllList() {
		return mapper.teacherListAll();
	}

	
	// 강사신청서 승인
	@Override
	public int teacherUpgrade(String bid,String tname) {
		mapper.userUpgrade(tname);
		int i = mapper.teacherUpgrade(bid);
		return i;
	}
	
	
	// 강사승인완료된 강사리스트뽑기
	@Override
	public ArrayList<TeacherDTO> teacherOkList(){
		return mapper.teacherOkList();
	}

	
	// 모든 회원 다 끌어오기
	@Override
	public ArrayList<UserDTO> allUserList() {
		return mapper.allUserList();
	}

	// 강사 삭제(강사 취소)
	@Override
	public int teacherDelete(String bid,String tname) {
		// 유저테이블 등급 내리기
		mapper.userDownGrade(tname);
		
		return mapper.teacherDelete(bid);
	}


	@Override
	public TeacherDTO teacherView(String bid) {
		return mapper.teacherContentView(bid);
	}

	
	// 모든 유저 닉네임만 가져오기 (쪽지 쓸려구)
	@Override
	public ArrayList<UserDTO> allUserNickGet() {
		return mapper.allUserNickGet();
	}

}
