package com.health.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.health.dto.QuestionDTO;

@Mapper
public interface QuestionMapper {

	int insertBoardwrite(QuestionDTO questionDto);

	List<QuestionDTO> selectBoardListAll();

	List<QuestionDTO> selectBoardListSearchAll(String search);

	QuestionDTO selctBoardContentView(String bid);

	int updateBoardModify(QuestionDTO questionDto);
	
	int deleteBoardDelete(String bid);

	void updateUpHit(String bid);


}
