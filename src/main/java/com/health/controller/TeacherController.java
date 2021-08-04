package com.health.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.health.dto.ApplicationDTO;
import com.health.dto.ReviewDTO;
import com.health.dto.TeacherDTO;
import com.health.service.TeacherService;

@Controller
public class TeacherController {

	Map<String, Object> map;

	@Autowired
	TeacherService teacherService;

	// ----강사------------------------------------------------------------------------

	// ******여기에 리뷰리스 끌어오기
	// 강사 1명 상세보기
	@RequestMapping("/lessonBoard/teacher_contentView")
	public String teahcer_contentView(Model model, String bid,String num) {
		model.addAttribute("map", teacherService.teacherContentView(bid));
		model.addAttribute("num", num);
		return "lessonBoard/teacher_contentView";
	}
	
	// 리뷰 DB 작성
	@RequestMapping(value = "/lessonBoard/review_write.do", method = RequestMethod.POST)
	public String review_write(ReviewDTO reviewDto,String num,RedirectAttributes redirect) {
		int i = teacherService.reviewWrite(reviewDto);
		redirect.addAttribute("bid", reviewDto.getBid());
		redirect.addAttribute("num", num);
		
		return "redirect:/lessonBoard/teacher_contentView";
	}
	
	
	// 강사 리스트 페이지(회원이보는)
	@RequestMapping("/lessonBoard/lessonBoard02")
	public String teacher_list(Model model, @RequestParam @Nullable String search) {

		Map<String, Object> map = new HashMap<String, Object>();
		map = teacherService.teacherOKListAll(search);
		model.addAttribute("map", map);
		return "lessonBoard/lessonBoard02";
	}

	// 강사 정보 DB업로드 insert
	@RequestMapping(value="/lessonBoard/teacher_admission.do",method=RequestMethod.POST)
	public String teacher_admission(TeacherDTO teacherDto, MultipartFile file, Model model,RedirectAttributes redirect) {

		int i = teacherService.admissionSubmit(teacherDto, file);
		if ( i==1 ) {
			redirect.addAttribute("msg","신청서를 제출하였습니다.");
		}else {
			redirect.addAttribute("msg", "신청서 제출에 실패하였습니다.");
		}
		redirect.addAttribute("location", "/user/rootAccess");

		return "redirect:/util/messageAccess";
	}

	// 강사 등록페이지로 연결
	@RequestMapping(value = "/lessonBoard/teacher_admissionView.do", method = RequestMethod.POST)
	public String teacher_admissionView() {
		return "lessonBoard/teacher_admissionView";
	}
	
	
	// 강사 포인트 증가 ?
	@RequestMapping(value="/lessonBoard/updatePoint",method = RequestMethod.POST)
	public void UpdatePoint(String sname,String category) {
		System.out.println(sname+" "+category);
	}
	
	
	
	// 회원 -> 강사 수강 신청서 제출
	@RequestMapping(value="/lessonBoard/applicationWrite.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> applicationWrite(ApplicationDTO dto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int i = teacherService.applicationWrite(dto);
		if ( i == 1) {
			map.put("result", "true");
		}else {
			map.put("result", "false");
		}
		return map;
	}
	
	
	

}
