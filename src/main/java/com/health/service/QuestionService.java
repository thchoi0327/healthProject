package com.health.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.health.dto.QuestionDTO;

public interface QuestionService {

	int BoardDelete(String bid);

	int BoardModify(QuestionDTO questionDto);

	Map<String, Object> BoardModifyView(String bid, String search);

	Map<String, Object> BoardContentView(String bid, String search);

	Map<String, Object> BoardListAll(String search);

	int BoardWrite(QuestionDTO questionDto, MultipartFile file);


}
