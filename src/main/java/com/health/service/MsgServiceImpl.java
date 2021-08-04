package com.health.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.health.dto.MessageDTO;
import com.health.dto.UserDTO;
import com.health.mapper.MsgMapper;

@Service
public class MsgServiceImpl implements MsgService {

	@Autowired
	MsgMapper mapper;
	
	// 쪽지 보내기
	@Override
	public int sendMsg(MessageDTO dto) {
		System.out.println(dto.getMreceiveNick());
		UserDTO udto = mapper.checkUser(dto.getMreceiveNick());
		
		if (udto == null ) {
			System.out.println("없음");
			return -10;
		}else {
			System.out.println(udto.getUser_id());
		}
		return mapper.sendWrite(dto);
	}
	
	
	// 쪽지 갯수 세오기 (메인 헤더)
	@Override
	public int countingMsg(String mReceiveNick) {
		return mapper.countimgMsg(mReceiveNick).size();
	}

	// 쪽지 삭제
	@Override
	public void deleteMsg(String mid) {
		mapper.deleteMsg(mid);
	}


	@Override
	public void adminSendAllUser(ArrayList<UserDTO> list,String mcontent) {
		
		for (int i=0;i<list.size();i++) {
			String mreceiveNick = list.get(i).getUser_nick();
			if (mreceiveNick.equals("관리자")) {
				continue;
			}
			mapper.adminSendALLUSER(mreceiveNick,mcontent);
		}
		
	}

}
