package com.health.siteUtil;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.health.dto.UserDTO;
import com.health.mapper.UserMapper;

@Service
public class EmailImpl implements Email {

	@Autowired
	UserMapper mapper;
	
	@Autowired
	private JavaMailSender send;
	
	
	// 회원가입 인증번호 발송
	@Override
	public String emailCheck(String emailAdr) {
		String randomNum = "false";
		MimeMessage msg = send.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg);
		try {
			int i = ((int)(Math.random()*30000)+20000); // 20000 ~ 50000까지 랜덤숫자 발송
			randomNum = Integer.toString(i);
			
			helper.setTo(emailAdr);
			helper.setSubject("헬스 플랫폼입니다");
			helper.setText("인증번호는 <h1>"+randomNum+"</h1> 입니다",true);
			helper.setFrom("health");
			send.send(msg);
		}catch(Exception e) {
			randomNum = "false";
		}
		
		return randomNum;
	}
	
	
	// 유저 ID 찾기
	@Override
	public int searchUserId(UserDTO dto) {
		int checkNull = 0;
		UserDTO dtoTemp = mapper.searchUserId(dto);
		if (dtoTemp != null) {
			checkNull = 1;
			sendEmail(dtoTemp.getUser_email(),"회원님의 아이디는 <h1>"+dtoTemp.getUser_id()+"</h1> 입니다");
		}
		return checkNull;
	}
	
	// 유저 pw 찾기
	@Override
	public int searchUserPw(UserDTO dto) {
		int checkNull = 0;
		UserDTO dtoTemp = mapper.searchUserPw(dto);
		if (dtoTemp != null) {
			checkNull = 1;
			sendEmail(dtoTemp.getUser_email(),"회원님의 비밀번호는 <h1>"+dtoTemp.getUser_pw()+"</h1> 입니다");
		}
		return checkNull;
	}
	
	public void sendEmail(String eamilAdr,String text) {
		MimeMessage msg = send.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg);
		try {				
			helper.setTo(eamilAdr);
			helper.setSubject("헬스 플랫폼입니다.");
			helper.setText(text,true);
			helper.setFrom("health");
			send.send(msg);
		}catch(Exception e) {
			
		}
	}

	
}
