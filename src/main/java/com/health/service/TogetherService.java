package com.health.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.health.dto.CommentDTO;
import com.health.dto.TogetherDTO;

public interface TogetherService {

	int BoardDelete(String bid);
	
	int BoardModify(TogetherDTO togetherDto);
	
	Map<String, Object> BoardModifyView(String bid, String search);
	
	Map<String, Object> BoardContentView(String bid, String search);
	
	Map<String, Object> BoardListAll(String search);
	
	int BoardWrite(TogetherDTO togetherDto, MultipartFile file);

	ArrayList<CommentDTO> commentListAll(String bid);

	int insertCommentWrite(CommentDTO commentDto);

	int commentDelete(String commentNo);

	int commentUpdate(String bcontent, String commentNo);


}
