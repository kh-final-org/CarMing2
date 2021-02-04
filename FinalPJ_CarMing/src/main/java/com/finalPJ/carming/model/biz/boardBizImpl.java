package com.finalPJ.carming.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.finalPJ.carming.model.dao.boardDao;
import com.finalPJ.carming.model.dto.MemberDto;
import com.finalPJ.carming.model.dto.boardDto;

@Service
public class boardBizImpl implements boardBiz{

	@Autowired
	private boardDao dao;
	private int brdno;
	
	//01. 게시글 전체 목록
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public List<boardDto> selectList() {
		dao.viewCount(brdno);
		return dao.selectList();
	}

	//02. 게시글 상세보기
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public boardDto selectOne(int brdno) {
		dao.viewCount(brdno);
		return dao.selectOne(brdno);
	}

	//03. 게시글(사진) 작성
	@Transactional
	@Override
	public int insert(boardDto dto) {
		dao.insertBRD(dto);
		return dao.insertMAP(dto);
	}

	//04. 게시글 수정
	@Override
	public int update(boardDto dto) {
		return dao.update(dto);
	}

	//05. 게시글 삭제
	@Transactional
	@Override
	public int delete(int brdno) {
		dao.delete(brdno);
		return dao.deleteRep(brdno);
	}

	//06. 게시글 조회수
	@Override
	public void viewCount(int brdno) {
	}

	//07. 사용자 프로필 페이지 목록
	@Override
	public List<boardDto> userBoardList(int memno) {
		return dao.userBoardList(memno);
	}

	@Override
	public MemberDto profilemem(int memno) {
		// TODO Auto-generated method stub
		return dao.profilemem(memno);
	}

	
	
	
	
	


}
