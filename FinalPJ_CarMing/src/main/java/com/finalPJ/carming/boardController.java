package com.finalPJ.carming;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalPJ.carming.model.biz.bcommentBiz;
import com.finalPJ.carming.model.biz.boardBiz;
import com.finalPJ.carming.model.dto.boardDto;

@Controller
public class boardController {
	private static final Logger logger = LoggerFactory.getLogger(boardController.class);
	
	@Autowired
	private boardBiz biz;
	
	@Autowired
	private bcommentBiz cbiz;
	
	//캠핑토크 메인 화면
	@RequestMapping(value = "/boardmainform.do")
	public String boardMain(Model model) {
		
		logger.info("[BOARD SELECT LIST]");
		model.addAttribute("list", biz.selectList());
	   
	   return "board/boardmain";
	}
	
	//게시글쓰기 페이지로 이동
	@RequestMapping(value = "/boardinsertform.do")
	public String boardWrite(boardDto dto) {
	   logger.info("[BOARD INSERT FORM]");
	   
	   return "board/boardinsert";
	}
	
	//게시글 insert
	@RequestMapping(value = "/boardinsertres.do")
	public String boardInsertRes() {
		logger.info("[BOARD INSERT RES]");
		
		return null;
    }

	//게시글 상세 페이지로 이동
	@RequestMapping(value = "/boarddetailform.do")
	public String boardDetail(Model model, int brdno) {
		logger.info("[BOARD SELECT ONE / DETAIL]");
		model.addAttribute("dto", biz.selectOne(brdno));
		model.addAttribute("comment",cbiz.selectList(brdno));
		
		return "board/boarddetail";
	}

	//게시글 삭제
	@RequestMapping(value = "/boarddelete.do")
	public String delete(int brdno) {
		logger.info("[BOARD DELETE]");
		
		int res = biz.delete(brdno);
		if(res>0) {
			return "redirect:boardmainform.do";
		}else {
			return "redirect:boarddetailform.do?brdno="+brdno;
		}
	}
	
	//프로필 페이지
	@RequestMapping(value = "/profileform.do")
	public String profilePage(Model model, int memno) {
		logger.info("[PROFILE PAGE]");
		model.addAttribute("list", biz.userBoardList(memno));
		
		return "board/profilepage";
	}
	
	//dm 페이지로 이동
	@RequestMapping(value = "/privateform.do")
	public String privateChat() {
		logger.info("[PRIVATE CHAT]");
		
		return "board/privatechat";
	}
	

	
	
	
	
	
	
	
}
