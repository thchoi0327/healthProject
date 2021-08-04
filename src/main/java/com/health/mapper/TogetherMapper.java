package com.health.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.health.dto.CommentDTO;
import com.health.dto.TogetherDTO;

@Mapper
public interface TogetherMapper {

	int insertBoardwrite(TogetherDTO togetherDto);

	List<TogetherDTO> selectBoardListAll();

	List<TogetherDTO> selectBoardListSearchAll(String search);

	TogetherDTO selctBoardContentView(String bid);

	int updateBoardModify(TogetherDTO togetherDto);

	int deleteBoardDelete(String bid);

	void updateUpHit(String bid);

	List<CommentDTO> commentListAll(String bid);

	int insertCommentWrite(CommentDTO commentDto);

	int commentDelete(String commentNo);

	int commentUpdate(String bcontent, String commentNo);

}
