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

import com.health.dto.CommentDTO;
import com.health.dto.QuestionDTO;
import com.health.dto.TogetherDTO;
import com.health.mapper.TogetherMapper;

@Service
public class TogetherServiceImpl implements TogetherService {

	@Autowired
	TogetherMapper togetherMapper;

	List<TogetherDTO> list;
	List<QuestionDTO> list2;
	Map<String, Object> map;

	TogetherDTO togetherDto;
	QuestionDTO questionDto;

	// 댓글 삭제하기
	@Override
	public int commentDelete(String commentNo) {
		
		int i = togetherMapper.commentDelete(commentNo);
		
		return i;
	}
	
	// 댓글 수정
	@Override
	public int commentUpdate(String bcontent, String commentNo) {
		int i = togetherMapper.commentUpdate(bcontent,commentNo);
		return i;
	}

	// 같이 운동해요 댓글 달기
	@Override
	public int insertCommentWrite(CommentDTO commentDto) {

		int i = togetherMapper.insertCommentWrite(commentDto);

		return i;
	}

	// 같이 운동해요 게시물 댓글 select 하기
	@Override
	public ArrayList<CommentDTO> commentListAll(String bid) {

		Map<String, Object> map = new HashMap<String, Object>();
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		list = togetherMapper.commentListAll(bid);

		return (ArrayList<CommentDTO>) list;
	}

	// 같이 운동해요 게시물 삭제 Delete하기
	@Override
	public int BoardDelete(String bid) {

		int i = togetherMapper.deleteBoardDelete(bid);
		return i;
	}

	// 같이 운동해요 게시물 수정 Update하기
	@Override
	public int BoardModify(TogetherDTO togetherDto) {

		// 원본파일 이름
//		String orgfileName = file.getOriginalFilename();
//
//		if (file.getSize() != 0) { // 파일 사이즈가 0이 아니면ㄴ
//			// 파일 저장위치
//			String fileUrl = "C:/workspace/health_project/src/main/resources/static/upload/";
//			// 이름에 시간 추가
//			long time = System.currentTimeMillis();
//			// 신규파일 이름
//			String uploadFileName = String.format("%d_%s", time, orgfileName);
//			File f = new File(fileUrl + uploadFileName);
//			try {
//				file.transferTo(f);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			// 파일 이름 저장
//			togetherDto.setFileName(uploadFileName);
//
//		} else {
//			// 기존 파일 이름을 그대로 저장시키면 됨
//		}

		int i = togetherMapper.updateBoardModify(togetherDto);

		return i;

	}

	// 같이 운동해요 게시물 수정할 게시물 불러오기
	@Override
	public Map<String, Object> BoardModifyView(String bid, String search) {

		map = new HashMap<String, Object>();
		// cotent 1개 가져오기
		togetherDto = togetherMapper.selctBoardContentView(bid);

		map.put("togetherDto", togetherDto);
		map.put("search", search);

		return map;
	}

	// 같이 운동해요 게시물 1개 보기
	@Override
	public Map<String, Object> BoardContentView(String bid, String search) {
		// 조회수 증가 1 만들기
		togetherMapper.updateUpHit(bid);

		map = new HashMap<String, Object>();
		// cotent 1개 가져오기
		togetherDto = togetherMapper.selctBoardContentView(bid);

		map.put("togetherDto", togetherDto);
		map.put("search", search);

		return map;
	}

	// 같이 운동해요 List 불러오기
	@Override
	public Map<String, Object> BoardListAll(String search) {

		list = new ArrayList<TogetherDTO>();
		map = new HashMap<String, Object>();

		// 검색이 없을때
		if (search == null || search.equals("")) {
			list = togetherMapper.selectBoardListAll();
		} else {
			list = togetherMapper.selectBoardListSearchAll(search);
		}

		map.put("list", list);

		return map;
	}

	// 같이 운동해요 작성후 DB 업로드
	@Override
	public int BoardWrite(TogetherDTO togetherDto, MultipartFile file) {

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
			togetherDto.setFileName(uploadFileName);
		} else {
			togetherDto.setFileName("");
		}
		int i = togetherMapper.insertBoardwrite(togetherDto);

		return i;
	}

	


}
