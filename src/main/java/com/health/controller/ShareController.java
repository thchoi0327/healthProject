package com.health.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.health.dto.Share_LendDto;
import com.health.dto.Share_TradeDto;
import com.health.service.ShareService;

@Controller
public class ShareController {

	 Map<String, Object> map;
	
	@Autowired
	ShareService shareservice;
	
	
	
	@RequestMapping("/shareBoardAccess")
	public String shareBoardAccess() {
		return "shareBoard/shareBoard";
	}
	
	@RequestMapping(value = "/shareBoard/write_view_trade.do", method=RequestMethod.POST)
	   public String write_view_trade() {
		
	   return "shareBoard/write_view_trade";
	   }
	
	@RequestMapping(value = "/shareBoard/write_view_lend.do", method=RequestMethod.POST)
	   public String write_view_lend() {
	   return "shareBoard/write_view_lend";
	   }
	
	
	
	
	// 글 작성 완료 // db넣기
	@RequestMapping(value="/shareBoard/write_trade.do", method=RequestMethod.POST)
	   public String write(Share_TradeDto sharetradedto ,MultipartFile file,RedirectAttributes redirect) {
		  int i = shareservice.boardWrite(sharetradedto,file);
		  if (i == 1) {
			  redirect.addAttribute("msg", "게시글을 작성하였습니다.");
		  }else {
			  redirect.addAttribute("msg", "게시글 작성에 실패하였습니다.");
		  }
		  redirect.addAttribute("location", "/shareBoardAccess");
		  return "redirect:/util/messageAccess";
	   }
	
	@RequestMapping(value="/shareBoard/write_lend.do", method=RequestMethod.POST)
	   public String write_lend(Share_LendDto sharelenddto ,MultipartFile file,RedirectAttributes redirect) {
			System.out.println("들어옴");
		 int i = shareservice.lendboardWrite(sharelenddto,file);
		  if (i == 1) {
			  redirect.addAttribute("msg", "게시글 작성에 성공하였습니다.");
		  }else {
			  redirect.addAttribute("msg", "게시글 작성에 실패하였습니다.");
		  }
		  redirect.addAttribute("location", "/shareBoardAccess");
	      return "redirect:/util/messageAccess";
		 
		 
	   }
	
	
	
	
	
	
	//구매 판매 글 보기
	@RequestMapping(value="/shareboard/content_view", method=RequestMethod.POST)
	   public String content_view(String shareTrade_num,Model model) {
		  map = shareservice.boardContent_view(shareTrade_num);
	      model.addAttribute("map",map);
	      return "shareBoard/content_view_trade";
	   }
	//빌림 빌려줌 글 보기
	@RequestMapping(value="/shareboard/content_view_lend",method=RequestMethod.POST)
	   public String content_view_lend(String shareLend_num,Model model) {
		  map = shareservice.lendboardContent_view(shareLend_num);
	      model.addAttribute("map",map);
	      return "shareBoard/content_view_lend";
	   }
	// 검색
	@RequestMapping("/search")
	public String searchList(String opt,String search,Model model) {
		ArrayList<Share_TradeDto> list = shareservice.searchList(opt, search);
		
		model.addAttribute("list",list);
		return "shareBoard/search_view";
	}
	
	
	
	
	
	// 구매/판매 게시판 삭제
	@RequestMapping(value="/shareBoard/tradeDelete.do",method=RequestMethod.POST)
	public String shareTradeDelete(String shareTrade_num,Model model) {
		int i = shareservice.tradeBoardDelte(shareTrade_num);
		if (i == 1) {
			model.addAttribute("msg", "게시글 삭제에 성공하였습니다.");
		}else {
			model.addAttribute("msg", "게시글 삭제에 실패하였습니다");
		}
		 model.addAttribute("location", "/shareBoardAccess");
		return "util/message"; 
	}
	
	// 대여/빌림 게시판 삭제
	@RequestMapping(value="/shareBoard/lendDelete.do",method=RequestMethod.POST)
	public String shareLendDelete(String shareLend_num,Model model) {
		int i = shareservice.lendBoardDelete(shareLend_num);
		if (i == 1) {
			model.addAttribute("msg", "게시글 삭제에 성공하였습니다.");
		}else {
			model.addAttribute("msg", "게시글 삭제에 실패하였습니다");
		}
		model.addAttribute("location", "/shareBoardAccess");
		return "util/message"; 
	}
	
	
	
	
	
	
	
	
	
	// 구매/판매 게시글 수정
	@RequestMapping(value="/shareBoard/tradeUpdate.do",method=RequestMethod.POST)
	public String shareTradeUpdate(HttpServletRequest request,Model model) {
	    int i = shareservice.tradeBoardUpdate(request);
	    if (i == 1) {
	    	model.addAttribute("msg", "게시글을 수정하였습니다.");
	    }else {
	    	model.addAttribute("msg", "게시글 수정에 실패하였습니다");
	    }
	    model.addAttribute("location", "/shareBoardAccess");
		
		return "util/message";
	}
	
	// 빌림/빌려 게시글 수정
	@RequestMapping(value="/shareBoard/lendUpdate.do",method=RequestMethod.POST)
	public String shareLendUpdate(HttpServletRequest request,Model model) {
		int i = shareservice.lendBoardUpdate(request);
		if (i == 1) {
			model.addAttribute("msg", "게시글을 수정하였습니다.");
		}else {
			model.addAttribute("msg", "게시글 수정에 실패하였습니다");
		}
		model.addAttribute("location", "/shareBoardAccess");
		
		return "util/message";
	}
	
	
	
	@RequestMapping(value="/shareBoardCall", method=RequestMethod.POST)
	public String lessonBoardCall(String num,Model model) {
		if (num.equals("1")) {
			// 여기서 DB들렷다 Model에 담고 보내면 됩니당.
			List<Share_TradeDto> tradelist = shareservice.buyList();
			
			model.addAttribute("tradelist",tradelist);
			return "shareBoard/shareBoard01";
		}else if (num.equals("2")) {
			List<Share_TradeDto> tradelist = shareservice.sellList();
			
			model.addAttribute("tradelist",tradelist);
			return "shareBoard/shareBoard02";
		}else if (num.equals("3")) {
			List<Share_LendDto> lendlist = shareservice.lendList();
			
			model.addAttribute("lendlist",lendlist);
			return "shareBoard/shareBoard03";
		}else if (num.equals("4")) {
			List<Share_LendDto> lendlist = shareservice.rentList();
			
			model.addAttribute("lendlist",lendlist);
			return "shareBoard/shareBoard04";
		}else {
			
			return "redirect:/";
		}
	}

}
