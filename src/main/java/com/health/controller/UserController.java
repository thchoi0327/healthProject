package com.health.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.health.dto.ApplicationDTO;
import com.health.dto.TeacherDTO;
import com.health.dto.UserDTO;
import com.health.service.UserService;
import com.health.service.MsgService;
import com.health.siteUtil.Email;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
public class UserController {

	@Autowired
	UserService service;
	@Autowired
	MsgService msgservice;
	
	@Autowired
	Email email;
    

	
	// 인덱스 페이지
	@RequestMapping("/")
	public String Index() {
		
		return "user/index";
	}
	// 루트 페이지 접근
	@RequestMapping("/user/rootAccess")
	public String rootAccess() {
		return "user/root";
	}
	// 회원가입 페이지 접근 
	@RequestMapping("/user/newMember")
	public String newMember() {
		
		return "user/newMember";
	}
	// ID,PW 찾기 페이지 접근
	@RequestMapping("/user/searchInfo")
	public String searchInfo() {
		
		return "user/searchUser";
	}
	// myPage접근
	@RequestMapping("/user/myPageAccess.do")
	public String myPageAccess(HttpSession session,Model model) {
//		if (session.getAttribute("userNick") == null) {
//			return "redirect:/user/rootAccess";
//		}
		String userNick = (String)session.getAttribute("userNick");
		model.addAttribute("mlist", service.getAllMsg(userNick));
		
		return "user/myPage";
	}
	
	@RequestMapping("/user/myPageAccess02.do")
	public String myPageAccess02(HttpSession session,Model model) {
//		if (session.getAttribute("userNick") == null) {
//			return "redirect:/user/rootAccess";
//		}
		String user_nick = (String)session.getAttribute("userNick");
		UserDTO mydto = service.getMyInfo(user_nick);
		if (mydto.getUser_grade().equals("3")) {
			TeacherDTO teacherdto = service.getMyTeacherInfo(user_nick);
			model.addAttribute("tdto", teacherdto);
		}
		model.addAttribute("dto", service.getMyInfo(user_nick));
		
		return "user/myPage02";
	}
	@RequestMapping("/user/myPageAccess03.do")
	public String myPageAccess03(HttpSession session,Model model) {
//		if (session.getAttribute("userNick") == null) {
//			return "redirect:/user/rootAccess";
//		}
		String ateacherNick = (String)session.getAttribute("userNick");
		model.addAttribute("alist", service.getApplication(ateacherNick) );
		return "user/myPage03";
	}
	
	// 쪽지 자세히 보기
	@RequestMapping(value="/user/myPageMsgView",method=RequestMethod.POST)
	public String myPageMsgView(String mid,Model model) {
		model.addAttribute("msgdto", service.contentViewMsg(mid));
		return "user/contentViewMsg";
	}
	
	// 쪽지 삭제
	@RequestMapping(value="/user/DeleteMsg.do",method=RequestMethod.POST)
	public String DeleteMsg(String mid) {
		msgservice.deleteMsg(mid);
		return "redirect:/user/myPageAccess.do";
	}
	
	// 수강 신청서 자세히 보기
	@RequestMapping(value="/user/appContentView.do",method=RequestMethod.POST)
	public String appContentView(String aid,Model model) {
		
		ApplicationDTO dto = service.getApplicationContent(aid);
		model.addAttribute("dto", dto);
		return "user/appContentView";
	}
	
	
	// 로그인
	@RequestMapping(value="/user/loginCheck", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> loginCheck(HttpSession session,String user_id,String user_pw) {
		HashMap<String, Object> map = new HashMap<String, Object>(); 

		UserDTO userDto = service.LoginCheck(user_id,user_pw);
		if (userDto != null) {
			session.setAttribute("user_grade", userDto.getUser_grade());
			session.setAttribute("userTel", userDto.getUser_tel());
			session.setAttribute("userId", userDto.getUser_id());
			session.setAttribute("userNick", userDto.getUser_nick());
			if (user_id.equals("admin1234") && (userDto.getUser_nick().equals("관리자")) ) {
				session.setAttribute("adminCheck", "adminCheck");
			}
			map.put("result", "true");
		}else {
			map.put("result", "false");
		}
		
		return map;
	}
	
	// 로그아웃
	@RequestMapping(value="/user/logout")
	public String logout(HttpSession session,Model model) {
		session.invalidate();
		model.addAttribute("msg","로그아웃되었습니다.");
		model.addAttribute("location","/user/rootAccess");
		return "util/message";
	}
	
	// 이메일 보내기
	@RequestMapping(value="/user/EmailCheck", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> EmailCheck(String emailAdr) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String randomNum = email.emailCheck(emailAdr);
		
		if (randomNum.equals("false")) {
			// 이메일 발송에 실패한경우
			map.put("result","false");
		}else {
			map.put("result", "true");
			map.put("randomNum", randomNum);
		}
		return map;
	}
	
	// 회원가입
	@RequestMapping(value="/user/newMember", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> newMemberCheck(UserDTO userDto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int i = service.JoinUser(userDto);
		if (i == 1) {
			// 회원가입 성공
			map.put("result", "true");
		}else {
			// 회원가입 싪해
			map.put("result", "false");
		}
		return map;
	}
	
	//아이디 중복 체크
	@RequestMapping(value = "/user/idMultipleCheck", method = RequestMethod.POST)
	@ResponseBody 
		public HashMap<String, Object> idMultipleCheck(@RequestParam("user_id") String user_id){
			HashMap<String, Object> map = new HashMap<String, Object>();
			UserDTO dto = service.idCheck(user_id);
			if(dto==null){ //사용 가능한 계정
				map.put("result","true");
			}else{	//이미 존재하는 계정
				map.put("result","false");  	
			}
			return map;
		}


	//닉네임 중복 체크
	@RequestMapping(value = "/user/nickmultipleCheck", method = RequestMethod.POST)
	@ResponseBody 
	public HashMap<String, Object> joinView(@RequestParam("user_nick") String user_nick){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		UserDTO dto = service.nickCheck(user_nick);
		if(dto==null){ //사용 가능한 계정
			map.put("result","true");
		}else{	//이미 존재하는 계정
			map.put("result","false");  	
		}
		return map;
	}
	
	// ID 찾기
	@RequestMapping(value="/util/searchId",method=RequestMethod.POST)
	public String searchId(UserDTO dto,Model model) {
		
		int i = email.searchUserId(dto);
		if (i == 1) {
			model.addAttribute("msg", "아이디를 이메일에 전송하였습니다.");
			model.addAttribute("location", "/user/rootAccess");
		}else {
			model.addAttribute("msg", "존재하지 않는 회원입니다.");
			model.addAttribute("location", "/user/searchInfo");
		}
		return "util/message";
	}
	// PW 찾기
	@RequestMapping(value="/util/searchPw",method=RequestMethod.POST)
	public String searchPw(UserDTO dto,Model model) {
		
		int i = email.searchUserPw(dto);
		if (i == 1) {
			model.addAttribute("msg", "비밀번호를 전송하였습니다.");
			model.addAttribute("location", "/user/rootAccess");
		}else {
			model.addAttribute("msg", "존재하지 않는 회원입니다.");
			model.addAttribute("location", "/user/searchInfo");
		}
		return "util/message";
	}
	
	// 마의 페이지 비밀번호 변경
	@RequestMapping(value="/user/changePassword.do",method=RequestMethod.POST)
	public String changePassword(UserDTO dto,Model model) {
		int i = service.changeUserPW(dto);
		if (i == 1) {
			model.addAttribute("msg","비밀번호를 수정하였습니다.");
			model.addAttribute("location","/user/myPageAccess02.do");
		}else {
			model.addAttribute("msg","비밀번호 수정에 실패하였습니다..");
			model.addAttribute("location","/user/myPageAccess02.do");
		}
		return "util/message";
	}
			

	

	
}
	



	
	
	
