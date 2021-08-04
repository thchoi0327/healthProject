package com.health.service;

import java.util.ArrayList;
import com.health.dto.TeacherDTO;
import com.health.dto.UserDTO;

public interface AdminService {

	// 모든 등업(상관x) 강사 테이블 가져오기
	ArrayList<TeacherDTO> teacherAllList();
	
	// 강사 등업
	int teacherUpgrade(String bid,String tname);
	
	// 강사인 사람들만 가져옴
	ArrayList<TeacherDTO> teacherOkList();
	
	// 모든 유저 리스트 가져옴
	ArrayList<UserDTO> allUserList();
	
	// 강사 취소/삭제
	int teacherDelete(String bid,String tname);
	TeacherDTO teacherView(String bid);
	
	ArrayList<UserDTO> allUserNickGet();
}
