package com.health.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.health.dto.LessonDTO;

@Mapper
public interface LessonMapper {

	void insertBoardwrite(LessonDTO lessonDto);

}
