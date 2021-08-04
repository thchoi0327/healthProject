package com.health.service;


import java.util.ArrayList;

import com.health.dto.MessageDTO;
import com.health.dto.UserDTO;

public interface MsgService {

	int sendMsg(MessageDTO dto);

	int countingMsg(String mReceiveNick);

	void deleteMsg(String mid);

	void adminSendAllUser(ArrayList<UserDTO> list,String mcontent);

}
