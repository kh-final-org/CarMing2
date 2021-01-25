package com.finalPJ.carming.model.dto;

import java.util.Date;

public class boardDto {
	
	private int brdno;				//게시글 번호
	private int bcategoryno;		//카테고리 번호 참조
	private String brdwriter;		//게시글 작성자
	private String brdfile;			//파일명
	private String brdcontent;		//게시글 내용
	private int brdcount;			//게시글 조회 수
	private Date brddate;			//게시글 작성 날짜
	private String brdprivate;		//나만보기 체크 여부
	private int memno;				//memno
	private String bcategoryname;

	public boardDto() {
		super();
	}

	public boardDto(int brdno, String brdwriter, String brdfile, String brdcontent, int brdcount, Date brddate,
			String brdprivate, int memno, int bcategoryno, String bcategoryname) {
		super();
		this.brdno = brdno;
		this.brdwriter = brdwriter;
		this.brdfile = brdfile;
		this.brdcontent = brdcontent;
		this.brdcount = brdcount;
		this.brddate = brddate;
		this.brdprivate = brdprivate;
		this.memno = memno;
		this.bcategoryno = bcategoryno;
		this.bcategoryname = bcategoryname;
	}

	public int getBrdno() {
		return brdno;
	}

	public void setBrdno(int brdno) {
		this.brdno = brdno;
	}

	public String getBrdwriter() {
		return brdwriter;
	}

	public void setBrdwriter(String brdwriter) {
		this.brdwriter = brdwriter;
	}

	public String getBrdfile() {
		return brdfile;
	}

	public void setBrdfile(String brdfile) {
		this.brdfile = brdfile;
	}

	public String getBrdcontent() {
		return brdcontent;
	}

	public void setBrdcontent(String brdcontent) {
		this.brdcontent = brdcontent;
	}

	public int getBrdcount() {
		return brdcount;
	}

	public void setBrdcount(int brdcount) {
		this.brdcount = brdcount;
	}

	public Date getBrddate() {
		return brddate;
	}

	public void setBrddate(Date brddate) {
		this.brddate = brddate;
	}

	public String getBrdprivate() {
		return brdprivate;
	}

	public void setBrdprivate(String brdprivate) {
		this.brdprivate = brdprivate;
	}

	public int getMemno() {
		return memno;
	}

	public void setMemno(int memno) {
		this.memno = memno;
	}

	public int getBcategoryno() {
		return bcategoryno;
	}

	public void setBcategoryno(int bcategoryno) {
		this.bcategoryno = bcategoryno;
	}

	public String getBcategoryname() {
		return bcategoryname;
	}

	public void setBcategoryname(String bcategoryname) {
		this.bcategoryname = bcategoryname;
	}



	
	
	
	
	
	
	
	
}
