package com.health.controller;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.health.dto.MessageDTO;
import com.health.service.MsgService;
import com.health.siteUtil.SiteUtil;

@Controller
public class UtilController {

	@Autowired
	MsgService service;
	
	
	@RequestMapping("/siteClose")
	public String siteClose() {
		if (SiteUtil.isSiteOpen()) {
			return "redircet:/!)(*@&#()*!@#^&(!@^#!@&#^@!*&^";
		}else {
			return "util/siteClose";
		}
	}
	
	@RequestMapping("/util/messageAccess")
	public String messageAccess(HttpServletRequest request,Model model) {
		
		model.addAttribute("msg", request.getParameter("msg"));
		model.addAttribute("location", request.getParameter("location"));
		
		return "util/message";
	}
	
	//쪽지 보내기
	@RequestMapping(value="/msg/sendMsg",method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> sendMsg(MessageDTO dto){
		HashMap<String, Object> map = new HashMap<String, Object>();
		int i = service.sendMsg(dto);
		if (i == -10) {
			map.put("result", "NoUser");
		}else if (i == 1) {
			map.put("result", "true");
		}else {
			map.put("result", "false");
		}
		return map;
	}
	
	// 쪽지 갯수 가져오기 (헤더에 몇개 있는지 띄울려고)
	@RequestMapping(value="/msg/countMsg",method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> countMsg(String mReceiveNick){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("count", service.countingMsg(mReceiveNick));
			
		
		return map;
	}
	
	

	
}
