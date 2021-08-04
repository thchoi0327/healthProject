package com.health.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.health.dto.MessageDTO;
import com.health.dto.UserDTO;

@Mapper
public interface MsgMapper {

	int sendWrite(MessageDTO dto);

	ArrayList<MessageDTO> countimgMsg(String mreceiveNick);
	UserDTO checkUser(String mreceiveNick);

	void deleteMsg(String mid);

	void adminSendALLUSER(String mreceiveNick, String mcontent);

}
