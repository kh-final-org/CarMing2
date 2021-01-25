package com.finalPJ.carming.model.dao;

import java.util.List;

import com.finalPJ.carming.model.dto.RentReviewDto;

public interface RentReviewDao {
	String NAMESPACE = "rentreview.";
	public List<RentReviewDto> selectList();
	public int insertReivew(RentReviewDto dto);
	public int deleteReview(int reviewNo);
	public int countReview(RentReviewDto dto);
	
}
