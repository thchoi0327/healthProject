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

import com.health.dto.QuestionDTO;
import com.health.mapper.QuestionMapper;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionMapper questionMapper;

	List<QuestionDTO> list;
	Map<String, Object> map;

	QuestionDTO questionDto;
	
	// Question 게시물 삭제
	@Override
	public int BoardDelete(String bid) {
		int i = questionMapper.deleteBoardDelete(bid);
		return i;
	}
	// Question 게시물 수정
	@Override
	public int BoardModify(QuestionDTO questionDto) {
		// 원본파일 이름
//		if (file.getOriginalFilename() != null) {
//			String orgfileName = file.getOriginalFilename();
//	
//			if (file.getSize() != 0) { // 파일 사이즈가 0이 아니면ㄴ
//				// 파일 저장위치
//				String fileUrl = "C:/workspace/health_projectlast/src/main/resources/static/img/uploadLesson/";
//				// 이름에 시간 추가
//				long time = System.currentTimeMillis();
//				// 신규파일 이름
//				String uploadFileName = String.format("%d_%s", time, orgfileName);
//				File f = new File(fileUrl + uploadFileName);
//				try {
//					file.transferTo(f);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//				// 파일 이름 저장
//				questionDto.setFileName(uploadFileName);
//	
//			} else {
//				// 기존 파일 이름을 그대로 저장시키면 됨
//			}
//		}

		int i = questionMapper.updateBoardModify(questionDto);

		return i;

	}
	
	// Question 수정페이지
	@Override
	public Map<String, Object> BoardModifyView(String bid, String search) {
		map = new HashMap<String, Object>();
		// cotent 1개 가져오기
		questionDto = questionMapper.selctBoardContentView(bid);

		map.put("questionDto", questionDto);
		map.put("search", search);

		return map;
	}

	// Question 게시물 보기
	@Override
	public Map<String, Object> BoardContentView(String bid, String search) {
		// 조회수 증가 1 만들기
		questionMapper.updateUpHit(bid);

		map = new HashMap<String, Object>();
		// cotent 1개 가져오기
		questionDto = questionMapper.selctBoardContentView(bid);

		map.put("questionDto", questionDto);
		map.put("search", search);

		return map;
	}

	// Question 게시물 전체보기
	@Override
	public Map<String, Object> BoardListAll(String search) {
	
		list = new ArrayList<QuestionDTO>();
		map = new HashMap<String, Object>();

		// 검색이 없을때
		if (search == null || search.equals("")) {
			list = questionMapper.selectBoardListAll();
		} else {
			list = questionMapper.selectBoardListSearchAll(search);
		}

		map.put("list", list);

		return map;
	}

	// Question 게시물 작성
	@Override
	public int BoardWrite(QuestionDTO questionDto, MultipartFile file) {
		
		System.out.println("boardWrite에 접근함");
		// 원본파일 이름
		String filename = file.getOriginalFilename();
		System.out.println(filename);
		// 확장자명 가져오기
		String fileNameExtension = FilenameUtils.getExtension(filename).toLowerCase();
		if (FilenameUtils.getExtension(filename).toLowerCase() != "") {
			// 파일저장위치
			String fileUrl = "C:/workspace/health_project/src/main/resources/static/img/uploadLesson/";

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
			questionDto.setFileName(uploadFileName);
		} else {
			questionDto.setFileName("");
		}
		int i = questionMapper.insertBoardwrite(questionDto);

		return i;

	}

}
