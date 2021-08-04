package com.health.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.health.dto.MessageDTO;
import com.health.dto.TeacherDTO;
import com.health.dto.UserDTO;

@Mapper
public interface AdminMapper {

	// 등업(상관 x)강사리스트 모두뽑기
	ArrayList<TeacherDTO> teacherListAll();
	// 강사 등업 신청 승인
	int teacherUpgrade(String bid);
	void userUpgrade(String tname);
	
	// 등업이 완료된 강사 리스트 뽑기
	ArrayList<TeacherDTO> teacherOkList();
	// 모든 회원 리스트
	ArrayList<UserDTO> allUserList();
	// 강사에서 삭제(등급 다운그레이드)
	int teacherDelete(String bid);
	int userDownGrade(String tname);
	
	
	// 특정 강사 자세히보기
	TeacherDTO teacherContentView(String bid);
	// 모든 유저 닉네임 가져오기
	ArrayList<UserDTO> allUserNickGet();
	

}
