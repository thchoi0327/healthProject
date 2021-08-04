package com.health.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.health.dto.ReviewDTO;

@Mapper
public interface ReviewMapper {

	void insertReveiwWrite(ReviewDTO reviewDto);

	List<ReviewDTO> selectReviewListAll();
	//선생님이름으로 리뷰 검색할때 
	List<ReviewDTO> selectReviewListSearch(String tname);

	
	
	
}
