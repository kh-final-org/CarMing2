DROP TABLE RECIPE;

CREATE TABLE RECIPE(
	
	RECIPEFILE VARCHAR(4000) UNIQUE NOT NULL,
	RECIPETITLE VARCHAR(4000) NOT NULL,
	RECIPEWRITER VARCHAR(2000) NOT NULL,
	RECIPEWRITERURL VARCHAR(4000) NOT NULL,
	VIEWS NUMBER DEFAULT '0' NOT NULL,
	RECIPEURL VARCHAR(4000) UNIQUE NOT NULL
);

SELECT * FROM RECIPE;

INSERT INTO RECIPE VALUES('AAA',DEFAULT);

UPDATE RECIPE SET RECIPE_VIEWS = RECIPE_VIEWS + 1 WHERE URL = 'AAA';

DROP TABLE TIP;
CREATE TABLE TIP(
	TIPTITLE VARCHAR(4000) NOT NULL,
	TIPURL VARCHAR(4000) UNIQUE NOT NULL,
	TIPFILE VARCHAR(4000) UNIQUE NOT NULL,
	VIEWS NUMBER DEFAULT '0' NOT NULL
);

SELECT * FROM TIP;

INSERT INTO RECIPE VALUES('AAA',DEFAULT);

UPDATE RECIPE SET RECIPE_VIEWS = RECIPE_VIEWS + 1 WHERE URL = 'AAA';

SELECT * FROM TIP WHERE TIPURL = '/?r=home&c=info/camptip&uid=1187';

-------------------------------------------------------------------------------

DROP TABLE MEMBER;
DROP SEQUENCE MEMSEQ;

CREATE SEQUENCE MEMSEQ;
CREATE TABLE MEMBER(
	MEMNO NUMBER PRIMARY KEY,
	MEMNICK VARCHAR2(100) UNIQUE NOT NULL,
	MEMID VARCHAR2(100) UNIQUE NOT NULL,
	MEMPW VARCHAR2(100) NOT NULL,
	MEMNAME VARCHAR2(100) NOT NULL,
	MEMZIP VARCHAR2(100) NOT NULL,
	MEMADDR VARCHAR2(1000) NOT NULL,
	MEMADDR2 VARCHAR2(100),
	MEMPHONE VARCHAR2(100) NOT NULL,
	MEMBIRTH ()DATE NOT NULL,
	MEMGENDER NUMBER NOT NULL,
	MEMCHK VARCHAR2(1) DEFAULT 'N' NOT NULL,
	MEMCODE NUMBER DEFAULT '2' NOT NULL,
	MEMFILE VARCHAR2(2000)
);

ALTER TABLE MEMBER ADD CONSTRAINT MEMGENDER_CHK CHECK (MEMGENDER IN (1, 2));
ALTER TABLE MEMBER ADD CONSTRAINT MEMCHK_CHK CHECK (MEMCHK IN ('Y', 'N'));
ALTER TABLE MEMBER ADD CONSTRAINT MEMCODE_CHK CHECK (MEMGENDER IN (1, 2));

SELECT * FROM MEMBER;

INSERT INTO MEMBER (MEMNO, MEMNICK, MEMID, MEMPW, MEMNAME, MEMZIP, MEMADDR, MEMADDR2, MEMPHONE, MEMBIRTH, MEMGENDER, MEMCHK) 
VALUES(MEMSEQ.NEXTVAL, '관리자', 'admin1', 'adminpass1', '김유리', '54678', '경기도 화성시', '어딘가', '01078941234', '1995-06-22', '1', 'N');

INSERT INTO MEMBER (MEMNO, MEMNICK, MEMID, MEMPW, MEMNAME, MEMZIP, MEMADDR, MEMADDR2, MEMPHONE, MEMBIRTH, MEMGENDER, MEMCHK) 
VALUES(MEMSEQ.NEXTVAL, '펭귄', 'user1', 'pass1', '홍길동', '06234', '서울특별시 강남구', '남도빌딩 4층', '01012345678', '1991-03-23', '2', 'Y');

UPDATE MEMBER SET MEMCODE = 1 WHERE MEMNO = 3;



