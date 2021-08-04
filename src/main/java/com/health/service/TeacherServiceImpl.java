package com.health.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.health.dto.ApplicationDTO;
import com.health.dto.ReviewDTO;
import com.health.dto.TeacherDTO;
import com.health.mapper.TeacherMapper;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	TeacherMapper teacherMapper;
	
	List<TeacherDTO> list;

	// 강사 1명 보기
	@Override
	public Map<String, Object> teacherContentView(String bid) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		TeacherDTO teacherDto = teacherMapper.selectTeacherContentView(bid);
		ArrayList<TeacherDTO> list = teacherMapper.selectTeacherReview(bid);
		
		map.put("tdto", teacherDto);
		map.put("rlist", list);
		return map;
	}
	
	// 리뷰 작성
	@Override
	public int reviewWrite(ReviewDTO reviewDto) {
		int i = teacherMapper.insertReviewWrite(reviewDto);
		teacherMapper.updatePoint(reviewDto.getScore(),reviewDto.getBid());
		return i;
	}


	// 강사리스트 DB에서 불러오기
	@Override
	public Map<String, Object> teacherOKListAll(String search) {
		
		list = new ArrayList<TeacherDTO>();
		Map<String, Object> map = new HashMap<String, Object>();

		// 검색이 없을때
		if (search == null || search.equals("")) {
			list = teacherMapper.selectteacherOKListAll();
		} else {
			list = teacherMapper.selectteacherOKListSearchAll(search);
		}
		map.put("list", list);

		return map;	}

	// 강사등록서를 DB에 insert
	@Override
	public int admissionSubmit(TeacherDTO teacherDto, MultipartFile file) {

		// 원본파일 이름
		String filename = file.getOriginalFilename();
		// 확장자명 가져오기
		String fileNameExtension = FilenameUtils.getExtension(filename).toLowerCase();
		if (FilenameUtils.getExtension(filename).toLowerCase() != "") {
			// 파일저장위치
			String fileUrl = "C://workspace/health_project/src/main/resources/static/img/uploadTeacher/";

			// 신규 파일이름 (32자리이름생성.확장자명)
			String uploadFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
			File f = new File(fileUrl + uploadFileName);
			// 파일업로드
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();

			}
			// 파일이름저장
			teacherDto.setFileName(uploadFileName);
		} else {
			teacherDto.setFileName("");
		}
		

		return teacherMapper.insertAdmissionSubmit(teacherDto);
	}

	
	// 회원-> 강사 수강신청서 제출
	@Override
	public int applicationWrite(ApplicationDTO dto) {
		return teacherMapper.applicationWrite(dto);
	}


	

}
