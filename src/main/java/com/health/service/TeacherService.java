package com.health.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.health.dto.ApplicationDTO;
import com.health.dto.ReviewDTO;
import com.health.dto.TeacherDTO;

public interface TeacherService {

	int admissionSubmit(TeacherDTO teacherDto, MultipartFile file);
	Map<String, Object> teacherContentView(String bid);
	Map<String, Object> teacherOKListAll(String search);
	
	// 리뷰 작성
	int reviewWrite(ReviewDTO reviewDto);
	
	// 회원 -> 강사 수강 신청서 제출
	int applicationWrite(ApplicationDTO dto);

}
