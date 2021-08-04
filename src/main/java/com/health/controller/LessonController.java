package com.health.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.health.dto.LessonDTO;
import com.health.service.QuestionService;
import com.health.service.TeacherService;
import com.health.service.TogetherService;
import com.health.service.UserService;

@Controller
public class LessonController {

	Map<String, Object> map;

	@Autowired
	TeacherService teacherService;

	@Autowired
	TogetherService togetherService;

	@Autowired
	QuestionService questionService;

	@Autowired
	UserService userService;

	// 동수꺼
	// 붙임------------------------------------------------------------------------------------
	// 운동소개
	@RequestMapping("/introduce")
	public String introduce() {
		return "lessonBoard/introduce";
	}

	@RequestMapping("/golf")
	public String golf() {
		return "lessonBoard/golf";
	}

	@RequestMapping("/health")
	public String health() {
		return "lessonBoard/health";
	}

	@RequestMapping("/swim")
	public String swim() {
		return "lessonBoard/swim";
	}

	@RequestMapping(value = "/innerPaging", method = RequestMethod.POST)
	public String innerPaging(String num, Model model, HttpServletRequest request) {
		if (num.equals("1")) {
			return "lessonBoard/golf";
		} else if (num.equals("2")) {
			return "lessonBoard/health";
		} else if (num.equals("3")) {
			return "lessonBoard/swim";
		} else if (num.equals("4")) {
			// 강사 소개 리스트 페이지
			String search = "골프";
			map = teacherService.teacherOKListAll(search);
			model.addAttribute("map", map);
			return "lessonBoard/lessonBoard02";

		} else if (num.equals("5")) {
			// 강사 소개 리스트 페이지
			String search = "헬스";
			map = teacherService.teacherOKListAll(search);
			model.addAttribute("map", map);
			return "lessonBoard/lessonBoard02";

		} else if (num.equals("6")) {
			// 강사 소개 리스트 페이지
			String search = "수영";
			map = teacherService.teacherOKListAll(search);
			model.addAttribute("map", map);
			return "lessonBoard/lessonBoard02";

		} else {

			return "redirect:/";
		}
	}
	// ----리뷰-------------------------------------------------------------------------------------------



	// 강습 리뷰페이지로 보냄
	@RequestMapping("/review_writeView")
	public String review_writeView() {
		return "lessonBoard/review_writeView";
	}

	// ----강습신청서-------------------------------------------------------------------------------------------

	// 강습신청서 게시판연결
	@RequestMapping("/lessonBoardAccess")
	public String lessonBoard() {
		return "lessonBoard/lessonBoard";
	}

	// 강습신청서 작성페이지로 연결
	@RequestMapping("/application")
	public String application(LessonDTO lessonDto, @Nullable MultipartFile file) {
		return "lessonBoard/application";
	}

	// 강습신청서 작성완료 페이지로 연결
	@RequestMapping("/application_view")
	public String application_view(LessonDTO lessonDto, @Nullable MultipartFile file) {
		return "lessonBoard/application_view";
	}

	// 강습신청서 작성후 DB로 업로드
	@RequestMapping("/application_write")
	public String application_write(LessonDTO lessonDto, MultipartFile file, Model model) {
		System.out.println("wirte페이지에 접근함");

//		lessonService.applicationWrite(lessonDto, file);

		model.addAttribute("dto", lessonDto);
		return "lessonBoard/application_view";
	}

	// ---기존 만들어져 있던 부분-------------

	@RequestMapping(value = "/lessonBoardCall", method = RequestMethod.POST)
	public String lessonBoardCall(String num, HttpServletRequest request, Model model) {
		if (num.equals("1")) {
			return "lessonBoard/lessonBoard01";
		} else if (num.equals("2")) {
			// 강사 소개 리스트 페이지
			String search = request.getParameter("search");
			map = teacherService.teacherOKListAll(search);
			model.addAttribute("map", map);
			return "lessonBoard/lessonBoard02";
		} else if (num.equals("3")) {
			// 같이 운동해요 페이지
			String search = request.getParameter("search");
			map = togetherService.BoardListAll(search);
			model.addAttribute("map", map);
			return "lessonBoard/lessonBoard03";
		} else if (num.equals("4")) {
			// 운동 Q&A 페이지
			String search = request.getParameter("search");
			map = questionService.BoardListAll(search);
			model.addAttribute("map", map);
			return "lessonBoard/lessonBoard04";
		} else {
			return "redirect:/";
		}

	}
}
