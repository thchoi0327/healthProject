package com.health.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
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

import com.health.dto.CommentDTO;
import com.health.dto.TogetherDTO;
import com.health.service.TogetherService;

@Controller
public class TogetherController {

	Map<String, Object> map;

	@Autowired
	TogetherService togetherService;

	// ----같이운동해요-------------------------------------------------------------------------------------------

	// 같이 운동해요 게시물 삭제하기 DB Delete
	@RequestMapping(value="/lessonBoard/togetherEx_delete.do",method=RequestMethod.POST)
	public String togetherEx_delete(String bid,RedirectAttributes redirect){
		int i = togetherService.BoardDelete(bid);
		if (i == 1) {
			redirect.addAttribute("msg", "게시글을 삭제하였습니다.");
		}else {
			redirect.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
		}
		redirect.addAttribute("location", "/lessonBoardAccess");
		return "redirect:/util/messageAccess";
	}

	// 같이 운동해요 게시물 수정하기 DB Update
	@RequestMapping(value="/lessonBoard/togetherUpdate.do",method=RequestMethod.POST)
	public String togetherEx_modify(TogetherDTO togetherDto,String bid,RedirectAttributes redirect){
			
		int i = togetherService.BoardModify(togetherDto);
		if (i == 1) {
			redirect.addAttribute("msg", "게시글을 수정하였습니다.");
		}else {
			redirect.addAttribute("msg", "게시글 수정에 실패하였습니다.");
		}
		redirect.addAttribute("location", "/lessonBoardAccess");
		return "redirect:/util/messageAccess";
	}
	
	
	// 같이 운동해요 게시물 한개 보기
	@RequestMapping(value="/lessonBoard/together_contentView",method=RequestMethod.POST)
	public String togetherEx_contentView(Model model, @RequestParam @Nullable String search,
			@RequestParam @Nullable String bid) {

		Map<String, Object> map = togetherService.BoardContentView(bid, search);
		ArrayList<CommentDTO> clist = togetherService.commentListAll(bid);

		model.addAttribute("map", map);
		model.addAttribute("clist", clist);

		return "lessonBoard/togetherEx_contentView";
	}

	
	
	
	
	
	
	
	
	// 댓글 달기
	@RequestMapping(value="/lessonBoard/comment_Write.do",method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> comment_Write(CommentDTO commentDto,Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int i = togetherService.insertCommentWrite(commentDto);
		if (i == 1) {
			map.put("result", "true");
		}else {
			map.put("result", "false");
		}
		map.put("result", "true");
		return map;
	}

	// 댓글 삭제하기
		@RequestMapping(value="/lessonBoard/comment_Delete.do",method=RequestMethod.POST)
		@ResponseBody
		public HashMap<String, Object> comment_Delete(@RequestParam String commentNo){
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			int i = togetherService.commentDelete(commentNo);
			if (i == 1) {
				map.put("result", "true");
			}else {
				map.put("result", "false");
			}
			map.put("result", "true");
			
			return map;
		}
		// 댓글 수정하기
		@RequestMapping(value="/lessonBoard/commentUpdate.do",method=RequestMethod.POST)
		@ResponseBody
		public HashMap<String, Object> comment_Update(String commentNo,String bcontent){
			System.out.println("들어옴");
			HashMap<String, Object> map = new HashMap<String, Object>();
			int i = togetherService.commentUpdate(bcontent,commentNo);
			if (i == 1) {
				map.put("result", "true");
			}else {
				map.put("result", "false");
			}
			map.put("result", "true");
			
			return map;
		}
		
		
		
		
		
		
		
	
	// 같이 운동해요 리스트 페이지
	@RequestMapping("/lessonBoard03")
	public String togetherEx_list(Model model, @RequestParam @Nullable String search) {
		String num = "3";

		map = togetherService.BoardListAll(search);

		model.addAttribute("map", map);
		model.addAttribute("num", num);
		return "/lessonBoardCall";
	}

	// 같이운동해요 작성후 DB로 업로드
	@RequestMapping(value="/lessonBoard/togetherEx_write.do",method=RequestMethod.POST)
	public String togetherEx_write(TogetherDTO togetherDto, MultipartFile file, RedirectAttributes redirect) {

		int i = togetherService.BoardWrite(togetherDto, file);
		if (i == 1) {
			redirect.addAttribute("msg", "게시글이 등록되었습니다.");
		}else {
			redirect.addAttribute("msg", "게시글 등록에 실패하였습니다.");
		}
		redirect.addAttribute("location","/lessonBoardAccess");
		return "redirect:/util/messageAccess";
	}

	// 같이운동해요 작성페이지로 연결
	@RequestMapping(value="/lessonBoard/togetherEx_writeView.do",method=RequestMethod.POST)
	public String togetherEx_wirteView() {
		return "lessonBoard/togetherEx_writeView";
	}

}
