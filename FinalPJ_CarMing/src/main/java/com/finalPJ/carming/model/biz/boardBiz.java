package com.finalPJ.carming.model.biz;

import java.util.List;

import com.finalPJ.carming.model.dto.MemberDto;
import com.finalPJ.carming.model.dto.boardDto;

public interface boardBiz {

	//01. 게시글 전체 목록
	public List<boardDto> selectList();
	//02. 게시글 상세보기
	public boardDto selectOne(int brdno);
	//03. 게시글(사진) 작성
	public int insert(boardDto dto);
	//04. 게시글 수정
	public int update(boardDto dto);
	//05. 게시글 삭제
	public int delete(int brdno);
	//06. 게시글 조회수
	public void viewCount(int brdno);
	//07. 사용자 프로필 페이지 목록
	public List<boardDto> userBoardList(int memno);
	public MemberDto profilemem(int memno);
	
	
}
