package com.health.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.health.dto.Share_LendDto;
import com.health.dto.Share_TradeDto;

public interface ShareService {
	// 구매
	List<Share_TradeDto> buyList();
	// 판매
	List<Share_TradeDto> sellList();
	//빌려줌
	List<Share_LendDto> lendList();
	//빌려봄
	List<Share_LendDto> rentList();
		
	// 구매 판매글 작성
	int boardWrite(Share_TradeDto sharetradedto, MultipartFile file);
	// 빌려봄 빌려줌 글작성
	int lendboardWrite(Share_LendDto sharelenddto, MultipartFile file);
	// 판매 구매 컨텐츠 뷰
	Map<String, Object> boardContent_view(String shareTrade_num);
	// 빌려줌 빌려봄 컨텐츠 뷰
	Map<String, Object> lendboardContent_view(String shareLend_num);
	
	//찾기리스트 판매구매만
	ArrayList<Share_TradeDto> searchList(String opt,String search);
	
	
	//구매|판매 글삭제
	int tradeBoardDelte(String shareTrade_num);
	int tradeBoardUpdate(HttpServletRequest request);
	int lendBoardDelete(String shareLend_num);
	int lendBoardUpdate(HttpServletRequest request);
	
	
}
