package com.health.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.health.dto.CommentDTO;
import com.health.dto.QuestionDTO;
import com.health.service.QuestionService;
import com.health.service.TogetherService;

@Controller
public class QuestionController {

	Map<String, Object> map;

	@Autowired
	QuestionService questionService;
	
	@Autowired
	TogetherService togetherService;

	// ----Question-------------------------------------------------------------------------------------------

	// Question 게시물 삭제하기 DB Delete
	@RequestMapping(value="/lessonBoard/question_delete.do",method=RequestMethod.POST)
	public String question_delete(@RequestParam String bid,RedirectAttributes redirect){
		int i = questionService.BoardDelete(bid);
		if (i == 1) {
			redirect.addAttribute("msg", "게시글을 삭제하였습니다.");
		}else {
			redirect.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
		}
		redirect.addAttribute("location", "/lessonBoardAccess");
		return "redirect:/util/messageAccess";
	}

	// Question 게시물 수정하기 DB Update
	@RequestMapping(value="/lessonBoard/QnAUpdate.do",method=RequestMethod.POST)
	public String question_modify(QuestionDTO questionDto, String bid,RedirectAttributes redirect){
		int i = questionService.BoardModify(questionDto);
		if (i == 1) {
			redirect.addAttribute("msg", "게시글을 수정하였습니다.");
		}else {
			redirect.addAttribute("msg", "게시글 수정에 실패하였습니다.");
		}
		redirect.addAttribute("location", "/lessonBoardAccess");
		return "redirect:/util/messageAccess";
	}

	// Question 게시물 한개 보기
	@RequestMapping(value="/lessonBoard/question_contentView",method=RequestMethod.POST)
	public String question_contentView(Model model, @RequestParam @Nullable String search,@RequestParam @Nullable String bid) {
		Map<String, Object> map = questionService.BoardContentView(bid, search);
		ArrayList<CommentDTO> clist = togetherService.commentListAll(bid);

		model.addAttribute("map", map);
		model.addAttribute("clist",clist); 

		return "lessonBoard/question_contentView";
	}
	
	

	// Question 리스트 페이지
	@RequestMapping("/questionBoard/question_list")
	public String question_list(Model model, @RequestParam @Nullable String search) {

		map = questionService.BoardListAll(search);

		model.addAttribute("map", map);

		return "lessonBoard/question_list";
	}

	// Question 작성후 DB로 업로드
	@RequestMapping(value="/lessonBoard/question_write.do",method=RequestMethod.POST)
	public String question_write(QuestionDTO questionDto, MultipartFile file, RedirectAttributes redirect) {
		
		int i = questionService.BoardWrite(questionDto, file);
		if (i == 1) {
			redirect.addAttribute("msg", "게시글이 등록되었습니다.");
		}else {
			redirect.addAttribute("msg", "게시글 등록에 실패하였습니다.");
		}
		redirect.addAttribute("location","/lessonBoardAccess");
		return "redirect:/util/messageAccess";
	}

	// Question 작성페이지로 연결
	@RequestMapping(value="/lessonBoard/question_writeView.do",method=RequestMethod.POST)
	public String question_writeView() {
		return "lessonBoard/question_writeView";
	}
	
	
	
}
