package com.finalPJ.carming.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalPJ.carming.model.dto.boardDto;

@Repository
public class boardDaoImpl implements boardDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//01. 게시글 전체 목록
	@Override
	public List<boardDto> selectList() {
		List<boardDto> list = new ArrayList<boardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			System.out.println("[error : board_selectList]");
			e.printStackTrace();
		}
		return list;
	}

	//02. 게시글 상세보기
	@Override
	public boardDto selectOne(int brdno) {
		boardDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", brdno);
		} catch (Exception e) {
			System.out.println("[error : board_selectOne]");
			e.printStackTrace();
		}
		return dto;
	}
	
	//03. 게시글(사진) 추가
	@Override
	public int insert(boardDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error : board_insert]");
			e.printStackTrace();
		}
		return res;
	}
	
	//04. 게시글 수정
	@Override
	public int update(boardDto dto) {
		return 0;
	}

	//05. 게시글 삭제
	@Override
	public int delete(int brdno) {
		int res = 0 ;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete",brdno);
		} catch (Exception e) {

			System.out.println("[error : board_delete]");

			e.printStackTrace();
		}
		return res;
	}

	//06. 게시글 조회수
	@Override
	public void viewCount(int brdno) {
		try {
			sqlSession.update(NAMESPACE+"viewCount", brdno);
		} catch (Exception e) {
			System.out.println("[error : board_viewCount]");
			e.printStackTrace();
		}
	}
	
	//07. 사용자 프로필 페이지
	@Override
	public List<boardDto> userBoardList(int memno) {
		List<boardDto> list = new ArrayList<boardDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"userBoardList", memno);
		} catch (Exception e) {

			System.out.println("[error : board_userBoardList]");

			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
	
	
	
	
}
