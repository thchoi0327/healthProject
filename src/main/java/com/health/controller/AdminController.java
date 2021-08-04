package com.health.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.health.dto.MessageDTO;
import com.health.dto.UserDTO;
import com.health.service.AdminService;
import com.health.service.MsgService;
import com.health.siteUtil.SiteUtil;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	@Autowired
	MsgService msgService;
	
	// 관리자 페이지 접근
	@RequestMapping("/admin/AdminAccess01")
	public String adminAccess01(HttpSession session,Model model) {
		if ( session.getAttribute("adminCheck") == null ) {
			return "redirect:!aoiwejfoa;iadwefj";
		}
		model.addAttribute("list", service.teacherAllList());
		return "admin/admin01";
		
				
	}
	
	// 강사 리스트 페이지
	@RequestMapping("/admin/AdminAccess02")
	public String adminAccess02(HttpSession session,Model model) {
		if ( session.getAttribute("adminCheck") == null ) {
			return "redirect:!aoiwejfoa;iadwefj";
		}
		model.addAttribute("list", service.teacherOkList());
		return "admin/admin02";
		
	}
	
	// 회원 리스트 페이지
	@RequestMapping(value="/admin/AdminAccess03",method=RequestMethod.POST)
	public String adminAccess03(HttpSession session,Model model) {
		if ( session.getAttribute("adminCheck") == null ) {
			return "redirect:!aoiwejfoa;iadwefj";
		}
		model.addAttribute("list", service.allUserList() );
		return "admin/admin03";
		
	}
	
	// 강사 신청 승인
	@RequestMapping(value="/admin/teacherOk",method=RequestMethod.POST)
	public String teacherOk(HttpSession session,String bid,String tname) {
		if ( session.getAttribute("adminCheck") == null ) {
			return "redirect:!aoiwejfoa;iadwefj";
		}
		int i = service.teacherUpgrade(bid,tname);
		if (i == 1) {
			MessageDTO msgdto = new MessageDTO();
			msgdto.setMsendNick("관리자");
			msgdto.setMreceiveNick(tname);
			msgdto.setMcontent("강사 신청 승인 완료되었습니다.");
			msgService.sendMsg(msgdto);
		}
		
		return "redirect:/admin/AdminAccess01";
		
	}
	
	// 강사 삭제
	@RequestMapping(value="/admin/teacherDelete",method=RequestMethod.POST)
	public String teacherDelete(HttpSession session,String bid,String page,String tname) {
		if ( session.getAttribute("adminCheck") == null ) {
			return "redirect:!aoiwejfoa;iadwefj";
		}
		int i = service.teacherDelete(bid,tname);
		System.out.println(page);
		if (page.equals("1")) {
			return "redirect:/admin/AdminAccess01";
		}
		
		return "redirect:/admin/AdminAccess02";
	}

	
	// 강사 승인 확인리스트에서 자세히보기
	@RequestMapping(value="/admin/teacherCheckView",method=RequestMethod.POST)
	public String teacherCheckView(HttpSession session,String bid,Model model) {
		if ( session.getAttribute("adminCheck") == null ) {
			return "redirect:!aoiwejfoa;iadwefj";
		}
		model.addAttribute("dto", service.teacherView(bid));
		return "admin/teacherCheckView";
		
	}
	
	// 강사 리스트에서 자세히보기(강사클릭)
	@RequestMapping(value="/admin/teacherView",method=RequestMethod.POST)
	public String teacherView(HttpSession session,String bid,Model model) {
		if ( session.getAttribute("adminCheck") == null ) {
			return "redirect:!aoiwejfoa;iadwefj";
		}
		model.addAttribute("dto", service.teacherView(bid));
		return "admin/teacherView";
		
	}
	
	
	
	
	// 전체 회원에게 쪽지 발송
	@RequestMapping(value="/admin/adminNoticeMsg",method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> adminNoticeMsg(String mcontent){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<UserDTO> list = service.allUserNickGet();
		msgService.adminSendAllUser(list,mcontent);
		map.put("result", "true");
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 사이트 닫기
	@RequestMapping(value="/admin/AccessForSiteClose", method=RequestMethod.POST)
	public String SiteClose(String adminFormCheck,HttpSession session) {
		if ( session.getAttribute("adminCheck") == null ) {
			return "redirect:!aoiwejfoa;iadwefj";
		}
		SiteUtil.setSiteOpen(false);
		return "redirect:/admin/AdminAccess01";
	}
	
	// 사이트 열기
	@RequestMapping(value="/admin/AccessForSiteOpen", method=RequestMethod.POST)
	public String SiteOpen(HttpSession session) {
		if ( session.getAttribute("adminCheck") == null ) {
			return "redirect:!aoiwejfoa;iadwefj";
		}
		SiteUtil.setSiteOpen(true);
		return "redirect:/admin/AdminAccess01";
	}

}
