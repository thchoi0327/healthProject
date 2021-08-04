package com.health.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.health.dto.ApplicationDTO;
import com.health.dto.ReviewDTO;
import com.health.dto.TeacherDTO;

@Mapper
public interface TeacherMapper {

	int insertAdmissionSubmit(TeacherDTO teacherDto);

	List<TeacherDTO> selectteacherListSearchAll(String search);
	
	
	// 선생님 1명 자세히 보기
	TeacherDTO selectTeacherContentView(String bid);
	ArrayList<TeacherDTO> selectTeacherReview(String bid);

	
	// 회원들이 보는 grade=3인 선생님들
	List<TeacherDTO> selectteacherOKListAll();
	
	
	List<TeacherDTO> selectteacherOKListSearchAll(String search);
	
	// 리뷰 작성
	int insertReviewWrite(ReviewDTO reviewDto);

	void updatePoint(String score,String bid);

	
	// 회원-> 강사 수강신청서 제출
	int applicationWrite(ApplicationDTO dto);

}
