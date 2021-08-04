package com.health.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.health.dto.Share_LendDto;
import com.health.dto.Share_TradeDto;
import com.health.mapper.ShareMapper;

@Service
public class ShareServiceImpl implements ShareService {
	
	@Autowired
	ShareMapper sharemapper;
	
	List<Share_TradeDto> tradelist;
	List<Share_LendDto> lendlist;
	Share_TradeDto sharetradedto;
	Share_LendDto sharelenddto;
	
	
	// 구매리스트보기
	@Override
	public List<Share_TradeDto> buyList(){
		tradelist = sharemapper.buylistView();
		
		return tradelist;
	}
	// 판매리스트 보기
	@Override
	public List<Share_TradeDto> sellList(){
		tradelist = sharemapper.selllistView();
		return tradelist;
	}
	//빌려줌 리스트 보기
	@Override
	public List<Share_LendDto> lendList() {
		lendlist = sharemapper.lendlistView();
			
		return lendlist;
	}
	//빌려봄 리스트 보기
	@Override
	public List<Share_LendDto> rentList() {
		lendlist = sharemapper.rentlistView();
			
		return lendlist;
	}
	
	
	// 판매 구매 글 불러오기 매소드
	@Override
	public HashMap<String, Object> boardContent_view(String shareTrade_num) {
		
		 HashMap<String, Object> map = new HashMap<String, Object>();
		  //조회수1증가
			/* ShareMapper.selectUpHit(shareTrade_num); */
	      //content 1개 가져오기
		  sharetradedto = sharemapper.selectBoardContent_view(shareTrade_num);
	      //이전글 다음글을 가지고 옴.
//	      Share_TradeDto preDto = ShareMapper.selectBoard_pre(shareTrade_num);
//	      Share_TradeDto nextDto = ShareMapper.selectBoard_next(shareTrade_num);

		  
		  map.put("sharetradedto",sharetradedto);
	      
//	      map.put("preDto", preDto);
//	      map.put("nextDto", nextDto);
//	      map.put("opt", opt);
//	      map.put("search", search);
//	      map.put("page", page);
//	      
	      
	      return map;
	}
	// 빌려주세요 빌려봅니다 보기
	@Override
	public Map<String, Object> lendboardContent_view(String shareLend_num) {
		
			HashMap<String, Object> map = new HashMap<String, Object>();
		  //조회수1증가
			/* ShareMapper.selectUpHit(shareTrade_num); */
	      //content 1개 가져오기
		  sharelenddto = sharemapper.selectlendBoardContent_view(shareLend_num);
	      //이전글 다음글을 가지고 옴.
//	      Share_TradeDto preDto = ShareMapper.selectBoard_pre(shareTrade_num);
//	      Share_TradeDto nextDto = ShareMapper.selectBoard_next(shareTrade_num);

		  
		  map.put("sharelenddto",sharelenddto);
	      
//	      map.put("preDto", preDto);
//	      map.put("nextDto", nextDto);
//	      map.put("opt", opt);
//	      map.put("search", search);
//	      map.put("page", page);
//	      
	      
	      return map;
	}
	
	// 판매 구매 글작성 메소드
		@Override
		public int boardWrite(Share_TradeDto sharetradedto, MultipartFile file) {
			 //원본파일이름
			
	        String fileName = file.getOriginalFilename();
	        //확장자명 가져오기
	        String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
	        //파일 저장위치
	     if(fileNameExtension!="") {
	        String fileUrl ="C:/workspace/health_project/src/main/resources/static/img/uploadShare/";
	        //신규파일이름
	        String uploadFileName = RandomStringUtils.randomAlphanumeric(8)+"."+fileNameExtension;
	        File f = new File(fileUrl+uploadFileName);
	        try {
	           file.transferTo(f);
	        } catch (Exception e) {
	           e.printStackTrace();
	        }
	        //파일이름저장
	        sharetradedto.setShareTrade_file(uploadFileName);
	     }else {
	    	 sharetradedto.setShareTrade_file("");
	     }
	     //mapper전달
	     int i = sharemapper.insertBoardWrite(sharetradedto);
	     
	     return i;
	     
	  }
	
	
	//빌려요 빌려줍니다 글작성
	@Override
	public int lendboardWrite(Share_LendDto sharelenddto, MultipartFile file) {
		//원본파일이름
		
        String fileName = file.getOriginalFilename();
        //확장자명 가져오기
        String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
        //파일 저장위치
        if(fileNameExtension!="") {
        	String fileUrl ="C:/workspace/health_project/src/main/resources/static/img/uploadShare/";
        //신규파일이름
        String uploadFileName = RandomStringUtils.randomAlphanumeric(8)+"."+fileNameExtension;
        File f = new File(fileUrl+uploadFileName);
        try {
           file.transferTo(f);
        } catch (Exception e) {
           e.printStackTrace();
        }
        //파일이름저장
        sharelenddto.setShareLend_file(uploadFileName);
     }else {
    	 sharelenddto.setShareLend_file("");
     }
     //mapper전달
     int i = sharemapper.insertlendBoardWrite(sharelenddto);
     return i;
		
	}
	
	
	
	// 판매 구매 서치
		@Override
		public ArrayList<Share_TradeDto> searchList(String opt, String search) {
			ArrayList<Share_TradeDto> list2 = new ArrayList<Share_TradeDto>();
			System.out.println(opt);
			System.out.println(search);
			list2 = sharemapper.searchlist(opt, search);
			
			System.out.println(" 카테고리 : "+list2.get(0).getShareTrade_category());
			return list2;
		}
		
		// 구매/판매 게시판 삭제
		@Override
		public int tradeBoardDelte(String shareTrade_num) {
			int i = sharemapper.tradeBoardDelete(shareTrade_num);
			return i;
		}
		// 빌림/빌려 게시판 삭제
		@Override
		public int lendBoardDelete(String shareLend_num) {
			int i = sharemapper.lendBoardDelete(shareLend_num);
			return i;
		}
		
		
		
		
		
		// 구매/판메 게시판 수정
		@Override
		public int tradeBoardUpdate(HttpServletRequest request) {
			String shareTrade_num = request.getParameter("shareTrade_num");
			String shareTrade_title = request.getParameter("shareTrade_title");
			String shareTrade_region = request.getParameter("shareTrade_region");
			String shareTrade_money = request.getParameter("shareTrade_money");
			String shareTrade_tel = request.getParameter("shareTrade_tel");
			String shareTrade_content = request.getParameter("shareTrade_content");
			
			
			int i = sharemapper.tradeBoardUpdate(shareTrade_num,shareTrade_title, shareTrade_region,shareTrade_money,shareTrade_tel,shareTrade_content);
			return i;
		}
		
		@Override
		public int lendBoardUpdate(HttpServletRequest request) {
			String shareLend_num = request.getParameter("shareLend_num");
			String shareLend_title = request.getParameter("shareLend_title");
			String shareLend_region = request.getParameter("shareLend_region");
			String shareLend_money = request.getParameter("shareLend_money");
			String shareLend_tel = request.getParameter("shareLend_tel");
			String shareLend_content = request.getParameter("shareLend_content");
			
			int i = sharemapper.lendBoardUpdate(shareLend_num,shareLend_title,shareLend_region,shareLend_money,shareLend_tel,shareLend_content);
			return i;
		}

	
	
}
