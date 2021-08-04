package com.health.mapper;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.health.dto.Share_LendDto;
import com.health.dto.Share_TradeDto;

@Mapper
public interface ShareMapper {
	//구매
	List<Share_TradeDto> buylistView();
	//판매
	List<Share_TradeDto> selllistView();
	//빌려줌
	List<Share_LendDto> lendlistView();
	//빌려봄
	List<Share_LendDto> rentlistView();
	// 매퍼에서 판매 구매 글작성
	int insertBoardWrite(Share_TradeDto sharetradedto);
	// 매퍼에서 빌려줌 빌려봄 글작성
	int insertlendBoardWrite(Share_LendDto sharelenddto);
	//조회수 증가임
	void selectUpHit(String shareTrade_num);
	//판매 구매 컨텐츠 뷰임
	Share_TradeDto selectBoardContent_view(String shareTrade_num);
	// 빌려줌 빌려봄 컨텐츠 뷰임
	Share_LendDto selectlendBoardContent_view(String shareLend_num);
	//검색한거 들고오기
	ArrayList<Share_TradeDto> searchlist(String opt, String search);
	
	int tradeBoardDelete(String shareTrade_num);
	int tradeBoardUpdate(String shareTrade_num, String shareTrade_title, String shareTrade_region,String shareTrade_money, String shareTrade_tel, String shareTrade_content);
	
	int lendBoardDelete(String shareLend_num);
	int lendBoardUpdate(String shareLend_num, String shareLend_title, String shareLend_region, String shareLend_money,String shareLend_tel, String shareLend_content);
			
		
	
	
	

}
