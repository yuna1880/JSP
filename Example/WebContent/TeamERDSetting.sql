/* Drop Tables,seq*/
DROP TABLE purchase CASCADE CONSTRAINTS;
drop sequence ph_seq;

DROP TABLE PQuestion CASCADE CONSTRAINTS;
DROP SEQUENCE pquestion_seq;

DROP TABLE Product CASCADE CONSTRAINTS;
DROP SEQUENCE product_seq;

DROP TABLE Consulting CASCADE CONSTRAINTS;
DROP SEQUENCE cons_write_seq;

DROP TABLE Company CASCADE CONSTRAINTS;
DROP SEQUENCE company_seq;


DROP TABLE Pimage;
DROP SEQUENCE pfile_seq;

DROP TABLE "MEMBER" CASCADE CONSTRAINTS ;
DROP SEQUENCE SEQ_MEMBER_SEQ ;


DROP TABLE Question;
DROP SEQUENCE SEQ_question_Qno;

DROP TABLE QComment;
DROP SEQUENCE SEQ_QComment_Cno;

DROP TABLE Qrepor;
DROP SEQUENCE SEQ_Qrepor_Rno;


/* Create Tables,seq*/
CREATE SEQUENCE product_seq;
CREATE TABLE Product
(
	Pid number NOT NULL ,
	Pname varchar2(100) NOT NULL,
	Pprice number DEFAULT 0 NOT NULL,
	Pbrand varchar2(100),
	Pimage varchar2(1000),
	Pcode number NOT NULL,
	PRIMARY KEY (Pid)
);

CREATE SEQUENCE pfile_seq;
CREATE TABLE Pimage
(
	pfuid number NOT NULL,
	pfsource varchar2(200) NOT NULL,
	pffile varchar2(200) NOT NULL,
	pfpid number NOT NULL,
	PRIMARY KEY (pfuid)
);
SELECT * FROM member;

CREATE SEQUENCE pquestion_seq;
CREATE TABLE PQuestion
(
	PQid number NOT NULL,
	PQpid number NOT NULL,
	PQuid varchar2(20) NOT NULL,
	PQregdate date NOT NULL,
	PQcontent clob NOT NULL,
	PQanswer clob,
	PRIMARY KEY (PQid)
);

CREATE SEQUENCE ph_seq;
CREATE TABLE Purchase(
	pcid number NOT NULL,
	pcuid varchar2(50) NOT NULL,
	ptotalprice NUMBER  DEFAULT 0,
	pcregdate DATE DEFAULT SYSDATE,
	pcstatus NUMBER DEFAULT 1,
	pcaddress varchar2(100) NOT NULL,
	pcaddressnum number NOT NULL,
	pccontent varchar2(100),
	pccardnum NUMBER NOT NULL,
	pid NUMBER NOT NULL ,
	pclpcnt NUMBER NOT NULL,
	pcaddress2 varchar2(500),
	pRIMARY KEY (pcid)
);



CREATE SEQUENCE cons_write_seq;
CREATE TABLE  Consulting(
	CSno NUMBER PRIMARY KEY NOT NULL,
	CSuid varchar2(50) NOT NULL,
	CSname varchar2(50) NOT NULL,
	Cno NUMBER NOT NULL,
	CSarea varchar2(50) NOT NULL,
	CStel varchar2(50) NOT NULL
);

CREATE SEQUENCE company_seq;	
CREATE TABLE  Company(
	Cno NUMBER primary KEY NOT NULL,
	Cname VARCHAR(50) not null,
	Cadr VARCHAR(100) not null,
	Ctel VARCHAR(30)  DEFAULT '없습니다.',
	Carea VARCHAR(50) not NULL,
	Ccategory VARCHAR(50) NOT NULL
);

CREATE SEQUENCE SEQ_MEMBER_SEQ INCREMENT BY 1 START WITH 1;
CREATE TABLE "MEMBER"(
	MEMBER_ID VARCHAR2(20) PRIMARY KEY,
	MEMBER_PW VARCHAR2(15),
	MEMBER_NAME VARCHAR2(20),
	MEMBER_JUMIN1 NUMBER,
	MEMBER_JUMIN2 NUMBER,
	MEMBER_EMAIL1 VARCHAR2(25),
	MEMBER_EMAIL_GET VARCHAR2(7),
	MEMBER_MOBILE VARCHAR2(13),
	MEMBER_PHONE VARCHAR2(13),
	MEMBER_ZIPCODE VARCHAR2(13),
	MEMBER_ADDR1 VARCHAR2(70),
	MEMBER_ADDR2 VARCHAR2(70),
	MEMBER_ADMIN NUMBER,
	MEMBER_JOIN_DATE DATE
);

CREATE SEQUENCE SEQ_question_Qno INCREMENT BY 1 START WITH 1;
CREATE TABLE Question
(
	Qno number NOT NULL,
	Qmember_id VARCHAR2(20),
	Qtitle varchar2(200) NOT NULL,
	Qcontent clob NOT NULL,
	Qregdate date DEFAULT SYSDATE,
	Qclickcnt NUMBER DEFAULT 0,
	Qkeyword varchar2(100) NOT NULL,
	PRIMARY KEY (Qno)
);

CREATE SEQUENCE SEQ_QComment_Cno INCREMENT BY 1 START WITH 1;
CREATE TABLE QComment
(
	Cno number NOT NULL,
	Cmember_id VARCHAR2(20) NOT NULL,
	Cqno number NOT NULL,
	Ccontent clob NOT NULL,
	Cregdate date DEFAULT SYSDATE,
	PRIMARY KEY (Cno)
);

CREATE SEQUENCE SEQ_Qrepor_Rno INCREMENT BY 1 START WITH 1;
CREATE TABLE Qrepor
(
	Rno number NOT NULL,
	Rmember_id VARCHAR2(20) NOT NULL,
	Rtype number NOT NULL,
	Rqno number NOT NULL,
	PRIMARY KEY (Rno)
);

INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(1,   '도배잘하는집',   '서울 마포구 서교동 475-4',   '전화번호가 없습니다.' ,   '서울',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(2,   '청주도배장판할인점',   '충북 청주시 상당구 용암동 2146',   '043-266-5742',   '충북',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(3,   '영림도배장판',   '서울 영등포구 대림동 992-1',   '전화번호가 없습니다.' ,   '서울',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(4,   '햇빛인테리어도배장판',   '인천 부평구 부개동 16-161',   '전화번호가 없습니다.' ,   '인천',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(5,   '우림도배장판',   '경기 화성시 기안동 353-1',   '010-3389-1504',   '경기',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(6,   '부산도배장판',   '부산 북구 구포동 986-56',   '전화번호가 없습니다.' ,   '부산',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(7,   '동인도배',   '서울 은평구 역촌동 40-4',   '전화번호가 없습니다.' ,   '서울',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(8,   '한빛도배장판',   '인천 남동구 만수동 939-4',   '010-7469-7631',   '인천',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(9,   '대한도배학원',   '인천 부평구 십정2동 400-39',   '032-441-5100',   '인천',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(10,   '수원도배필름타일학원',   '경기 수원시 장안구 조원동 762-16',   '031-257-2151',   '경기',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(11,   '도배마루',   '제주특별자치도 제주시 연동 294-26',   '010-3577-5557',   '제주특별자치도',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(12,   '현대도배학원',   '서울 강북구 미아동 209-8',   '02-987-3516',   '서울',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(13,   'KH 도배장판인테리어',   '서울 은평구 응암동 751-9',   '02-6368-1304',   '서울',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(14,   '그린도배장판',   '서울 강동구 암사동 421-18',   '02-471-4171',   '서울',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(15,   '도배이야기',   '서울 강남구 역삼동 664-14',   '전화번호가 없습니다.' ,   '서울',   '도배'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(16,   '장판나라',   '경기 남양주시 진접읍 연평리 249-1',   '1644-5029',   '경기',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(17,   '장판천국',   '인천 부평구 십정동 414-11',   '1899-1812',   '인천',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(18,   '장판나라',   '경기 남양주시 진건읍 진관리 200-3',   '031-573-2189',   '경기',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(19,   '혼자두면 장판뜯어서차린 개카페',   '서울 관악구 봉천동 959-2',   '02-887-3058',   '서울',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(20,   '청주도배장판할인점',   '충북 청주시 상당구 용암동 2146',   '043-266-5742',   '충북',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(21,   '벽지장판 할인매장',   '경기 화성시 진안동 524-30',   '031-222-3173(팩스);',   '경기',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(22,   '장판나라',   '경기 고양시 덕양구 도내동 837-1',   '02-353-1530',   '경기',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(23,   '영림도배장판',   '서울 영등포구 대림동 992-1',   '전화번호가 없습니다.' ,   '서울',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(24,   '벽지마루장판',   '경기 안양시 동안구 호계동 933',   '031-427-7840',   '경기',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(25,   '벽지장판할인매장',   '부산 해운대구 재송동 1079-7',   '전화번호가 없습니다.' ,   '부산',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(26,   '햇빛인테리어도배장판',   '인천 부평구 부개동 16-161',   '전화번호가 없습니다.' ,   '인천',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(27,   '우림도배장판',   '경기 화성시 기안동 353-1',   '010-3389-1504',   '경기',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(28,   '부산도배장판',   '부산 북구 구포동 986-56',   '전화번호가 없습니다.' ,   '부산',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(29,   '한빛도배장판',   '인천 남동구 만수동 939-4',   '010-7469-7631',   '인천',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(30,   '벽지장판마트',   '경기 김포시 대곶면 율생리 363-13',   '031-987-3608',   '경기',   '장판'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(31,   '현대시트&필름',   '대전 대덕구 오정동 65-3',   '042-639-8180',   '대전',   '시트필름'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(32,   '조은필름시트',   '경북 경산시 진량읍 다문리 202',   '전화번호가 없습니다.' ,   '경북',   '시트필름'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(33,   '3M인테리어필름 유경시트',   '서울 성동구 송정동 68-40',   '02-466-7644',   '서울',   '시트필름'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(34,   '우신시트',   '경기 수원시 권선구 세류동 467-15',   '031-234-5356',   '경기',   '시트필름'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(35,   '현대인테리어필름',   '경남 창원시 의창구 도계동 333-9',   '055-277-3044',   '경남',   '시트필름'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(36,   '욕실용품',   '서울 중구 회현동2가 86',   '02-2002-5464',   '서울',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(37,   '욕실하우징',   '경기 김포시 걸포동 165-5',   '031-996-7771',   '경기',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(38,   '욕실공사',   '서울 강북구 수유동 308-42',   '02-999-2134',   '서울',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(39,   '욕실앤타일',   '충남 천안시 서북구 두정동 1063',   '010-5277-4731',   '충남',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(40,   '욕실박사타일',   '경기 평택시 합정동 773',   '031-691-3307',   '경기',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(41,   '창조욕실',   '경기 수원시 권선구 탑동 435-1',   '031-245-8725',   '경기',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(42,   '제일욕실타일',   '대구 서구 평리동 659-30',   '053-558-2721',   '대구',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(43,   '다나욕실디자인',   '울산 북구 호계동 271-1',   '052-292-0077',   '울산',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(44,   '그린욕실',   '울산 중구 남외동 952-9',   '052-292-6556',   '울산',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(45,   '상일 타일욕실',   '서울 강북구 번동 460-86',   '02-993-7696',   '서울',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(46,   '욕실백화점',   '경기 광주시 오포읍 능평리 92-6',   '031-766-0054',   '경기',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(47,   '밝은욕실인테리어',   '광주 동구 소태동 647-3',   '062-234-7659',   '광주',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(48,   '욕실엔터테이먼트',   '경기 부천시 소사본동 143-2',   '010-8249-0303',   '경기',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(49,   '우리욕실',   '경기 고양시 일산동구 정발산동 1172-5',   '031-921-6704',   '경기',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(50,   '욕실타일공사',   '서울 종로구 숭인동 72-70',   '전화번호가 없습니다.' ,   '서울',   '욕실'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(51,   '주방',   '서울 마포구 망원동 57-138',   '02-6406-2019',   '서울',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(52,   '마녀주방 강남점',   '서울 강남구 역삼동 818-14',   '070-4240-1116',   '서울',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(53,   '마녀주방 홍대점',   '서울 마포구 서교동 358-51',   '070-7723-1116',   '서울',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(54,   '경성주방',   '부산 동구 초량동 667-6',   '051-442-0316',   '부산',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(55,   '황학동주방거리',   '서울 중구 황학동 1548',   '전화번호가 없습니다.' ,   '서울',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(56,   '미식가의주방',   '경기 수원시 팔달구 장안동 53-12',   '070-7640-4049',   '경기',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(57,   '소금주방',   '부산 수영구 민락동 146-27',   '051-757-8277',   '부산',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(58,   '손가주방',   '경기 파주시 탄현면 법흥리 104-3',   '031-947-4668',   '경기',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(59,   '쿠시노주방',   '서울 마포구 동교동 152-18',   '02-3144-5533',   '서울',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(60,   '모퉁이주방',   '부산 해운대구 우동 518',   '010-7148-2526',   '부산',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(61,   '마녀주방 명동점',   '서울 중구 명동2가 4-2',   '070-7789-1116',   '서울',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(62,   '한국주방',   '제주특별자치도 제주시 노형동 3158-1',   '064-747-4053',   '제주특별자치도',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(63,   '주방류',   '서울 강남구 논현동 145-10',   '02-515-2777',   '서울',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(64,   '마녀주방 부평점',   '인천 부평구 부평동 193-65',   '070-8887-4575',   '인천',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(65,   '산동주방',   '인천 중구 북성동2가 9-76',   '032-765-6566',   '인천',   '주방'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(66,   '형제타일',   '부산 연제구 연산동 383-3',   '051-864-8989',   '부산',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(67,   '유송타일 본사',   '경기 고양시 덕양구 원흥동 370-8',   '031-966-2391',   '경기',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(68,   '주성타일',   '광주 서구 동천동 45',   '062-675-6750',   '광주',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(69,   '대동타일',   '충남 천안시 서북구 성거읍 신월리 234-2',   '041-583-6011',   '충남',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(70,   '국제타일',   '부산 부산진구 부전동 341-5',   '051-805-2999',   '부산',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(71,   '역전타일',   '경기 수원시 권선구 세류동 350-8',   '031-232-0400',   '경기',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(72,   '타일집',   '충남 천안시 서북구 두정동 931',   '041-555-3347',   '충남',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(73,   '현대타일',   '경남 창원시 의창구 명서동 172-10',   '055-238-5515',   '경남',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(74,   '흥안타일',   '경기 군포시 금정동 910-1',   '031-453-6578',   '경기',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(75,   '중앙타일',   '경기 수원시 팔달구 인계동 875-5',   '031-236-2075',   '경기',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(76,   '용현타일',   '인천 남동구 구월동 1318-4',   '032-885-8902',   '인천',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(77,   '타일',   '부산 금정구 남산동 73-28',   '전화번호가 없습니다.' ,   '부산',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(78,   '타일플러스',   '서울 강남구 논현동 128-9',   '02-3445-0141',   '서울',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(79,   '타일',   '서울 마포구 신수동 88-32',   '전화번호가 없습니다.' ,   '서울',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(80,   '동양타일전시장',   '대전 동구 인동 10-7',   '042-286-2448',   '대전',   '타일'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(81,   '도어',   '서울 용산구 이태원동 260-124',   '전화번호가 없습니다.' ,   '서울',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(82,   '퍼플도어',   '경기 수원시 팔달구 인계동 1113-5',   '031-224-0705',   '경기',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(83,   '데블스도어 센트럴시티점',   '서울 서초구 반포동 118-3',   '02-6282-4466',   '서울',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(84,   '앨리스넥스트도어호텔',   '경기 하남시 망월동 1111-1',   '0507-1332-1772',   '경기',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(85,   '우와도어',   '경기 화성시 팔탄면 하저리 743-4',   '031-355-1712',   '경기',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(86,   '데블스도어 코엑스점',   '서울 강남구 삼성동 159-9',   '02-6002-2001',   '서울',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(87,   '대동도어',   '인천 연수구 송도동 220-1',   '032-716-9480',   '인천',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(88,   '도어이스케이프',   '경기 안산시 단원구 고잔동 540-14',   '031-405-9745',   '경기',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(89,   '도어401',   '서울 강남구 신사동 661-13',   '02-6104-4017',   '서울',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(90,   '더블도어',   '서울 도봉구 쌍문동 350-3',   '02-992-5525',   '서울',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(91,   '스몰하우스빅도어',   '서울 중구 다동 115',   '02-2038-8191',   '서울',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(92,   '프라이빗도어',   '전북 전주시 완산구 효자동3가 741-3',   '전화번호가 없습니다.' ,   '전북',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(93,   '레드도어',   '인천 연수구 송도동 20-23',   '032-209-9192',   '인천',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(94,   '레드도어',   '부산 해운대구 좌동 1341-17',   '051-743-7997',   '부산',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(95,   '더블도어',   '전북 전주시 완산구 전동3가 61',   '070-8865-1525',   '전북',   '도어'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(96,   '대신특수목재',   '인천 서구 가좌1동 173-451',   '032-772-7100',   '인천',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(97,   '부산건축자재합판목재도매',   '부산 강서구 대저1동 486-1',   '전화번호가 없습니다.' ,   '부산',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(98,   '제일합판',   '부산 부산진구 전포동 375-40',   '051-808-7041',   '부산',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(99,   '오산목재',   '광주 북구 양산동 404-7',   '062-571-4906',   '광주',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(100,   '한양합판목재상사',   '경기 성남시 중원구 하대원동 118-8',   '031-752-1318',   '경기',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(101,   '신창종합목재합판상사',   '경기 안양시 만안구 안양8동 327-4',   '031-446-6455',   '경기',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(102,   '태광목재',   '경기 용인시 수지구 동천동 186-8',   '031-261-0908',   '경기',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(103,   '매원목재합판상사',   '경기 수원시 영통구 매탄2동 196-21',   '031-214-4777',   '경기',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(104,   '현대목재',   '경기 화성시 병점동 471-3',   '031-232-4175',   '경기',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(105,   '신영목재합판상사',   '서울 서대문구 연희동 78-25',   '02-392-3500',   '서울',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(106,   '광남목재건재',   '광주 남구 백운동 634-26',   '062-652-2223',   '광주',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(107,   '지성합판목재',   '대전 서구 괴정동 81-5',   '010-4488-4322',   '대전',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(108,   '대성합판목재',   '경북 포항시 남구 대잠동 915-3',   '054-273-2831',   '경북',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(109,   '신광목재상사',   '경기 고양시 덕양구 토당동 412-4',   '031-973-3823',   '경기',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(110,   '현대 종합목재',   '경기 평택시 서정동 830-13',   '031-662-0044',   '경기',   '마루'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(111,   '마루',   '서울 영등포구 여의도동 30-2',   '02-785-0056',   '서울',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(112,   '마루',   '충남 공주시 신관동 595-15',   '041-853-2600',   '충남',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(113,   '아라마루전망대',   '인천 계양구 둑실동 79-3',   '전화번호가 없습니다.' ,   '인천',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(114,   '대청마루',   '강원 속초시 노학동 980-52',   '033-635-1708',   '강원',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(115,   '놀이마루',   '부산 부산진구 전포동 682',   '051-601-6400',   '부산',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(116,   '마루',   '경남 진주시 초전동 1715-11',   '전화번호가 없습니다.' ,   '경남',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(117,   '구들마루',   '대전 유성구 봉명동 692-2',   '042-822-8267',   '대전',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(118,   '마루',   '광주 북구 신용동 716',   '전화번호가 없습니다.' ,   '광주',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(119,   '마루180',   '서울 강남구 역삼동 790-6',   '02-3453-1370',   '서울',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(120,   '마루공원 장례식장',   '경기 하남시 천현동 628',   '031-795-2222',   '경기',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(121,   '마루',   '대전 중구 대사동 197-174',   '전화번호가 없습니다.' ,   '대전',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(122,   '해운마루',   '부산 해운대구 중동 996-1',   '051-743-4222',   '부산',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(123,   '마루공원 봉안당',   '경기 하남시 천현동 628',   '031-795-2222',   '경기',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(124,   '누리마루 APEC하우스',   '부산 해운대구 우동 714-1',   '051-744-3140',   '부산',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(125,   '아라마루휴게소',   '인천 계양구 둑실동 135-25',   '전화번호가 없습니다.' ,   '인천',   '페인트'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(126,   '노루페인트 본사 안양공장',   '경기 안양시 만안구 박달동 615',   '031-467-6114',   '경기',   '목공'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(127,   '삼화페인트 삼미도료',   '서울 용산구 한강로1가 305-9',   '02-793-1093',   '서울',   '목공'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(128,   'KCC페인트 우리도료',   '경기 군포시 당정동 351-2',   '031-427-9110',   '경기',   '목공'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(129,   '츄고쿠삼화페인트',   '경남 김해시 한림면 퇴래리 972',   '051-329-3377',   '경남',   '목공'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(130,   '조광요턴',   '부산 강서구 지사동 1205',   '051-797-6000',   '부산',   '목공'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(131,   'KCC페인트 강남플라자',   '서울 강남구 논현동 57-14',   '02-569-7704',   '서울',   '목공'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(132,   '벤자민무어페인트',   '서울 강남구 논현동 128-5',   '1577-3103',   '서울',   '목공'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(133,   '조광페인트 음성공장',   '충북 음성군 대소면 대풍리 36',   '043-530-1500',   '충북',   '목공'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(134,   '던에드워드페인트 서초점',   '서울 서초구 방배동 830-4',   '02-595-5537',   '서울',   '목공'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(135,   '노루페인트 논현점',   '서울 강남구 논현동 240-9',   '02-518-6078',   '서울',   '목공'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(136,   '삼화페인트 한양페인트백화점',   '제주특별자치도 제주시 용담이동 2708-3',   '전화번호가 없습니다.' ,   '제주특별자치도',   '목공'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(137,   '페인트세븐',   '경기 화성시 방교동 758-4',   '031-378-7760',   '경기',   '목공'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(138,   '삼화페인트 신일도료판매상사',   '서울 중구 을지로2가 101-2',   '02-2265-7186',   '서울',   '목공'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(139,   '노루페인트 에이스홈센터',   '서울 금천구 독산동 1027',   '02-852-5564',   '서울',   '목공'   );
INSERT INTO Company (Cno, Cname, Cadr, Ctel, Carea, Ccategory) VALUES(140,   '삼화페인트공업 공주공장',   '충남 공주시 탄천면 안영리 산 840',   '041-855-8542',   '충남',   '목공'   );


-- FK 설정
ALTER TABLE Question
	ADD FOREIGN KEY (Qmember_id)
	REFERENCES member (MEMBER_ID)
 ON DELETE CASCADE;

SELECT * FROM MEMBER;
SELECT * FROM QUESTION q ;


ALTER TABLE QComment
    ADD CONSTRAINT comment_fk_constraint
    FOREIGN KEY(Cqno) REFERENCES Question (Qno)
    ON DELETE CASCADE;
   

   ALTER TABLE QComment
	ADD FOREIGN KEY (Cmember_id)
	REFERENCES member (MEMBER_ID)
 ON DELETE CASCADE;




-- FK 설정, 삭제시 제약조건 필요
ALTER TABLE Qrepor
    ADD CONSTRAINT report_fk_constraint
    FOREIGN KEY(Rqno) REFERENCES Question(Qno)
    ON DELETE CASCADE;

  ALTER TABLE Qrepor
	ADD FOREIGN KEY (Rmember_id)
	REFERENCES member (MEMBER_ID)
	ON DELETE CASCADE;


ALTER TABLE PURCHASE 
  ADD CONSTRAINT pcuid 
  FOREIGN KEY (pcuid) 
  REFERENCES "MEMBER"(MEMBER_ID)
  ON DELETE CASCADE;
 
/*ALTER TABLE PURCHASE
  ADD CONSTRAINT pid
  FOREIGN KEY (pid) 
  REFERENCES product 
  ON DELETE CASCADE;
*/
 ALTER TABLE CONSULTING 
  ADD CONSTRAINT csuid
  FOREIGN KEY (csuid) 
  REFERENCES "MEMBER"(MEMBER_ID) 
  ON DELETE CASCADE;
 
 ALTER TABLE CONSULTING 
  ADD CONSTRAINT cno
  FOREIGN KEY (cno) 
  REFERENCES COMPANY(CNO) 
  ON DELETE CASCADE;
 
 ALTER TABLE PQUESTION 
  ADD CONSTRAINT pquuid
  FOREIGN KEY (PQUid ) 
  REFERENCES "MEMBER"
  ON DELETE CASCADE;
 
 ALTER TABLE PQUESTION 
  ADD CONSTRAINT pqpid
  FOREIGN KEY (PQpID ) 
  REFERENCES product(pid) 
  ON DELETE CASCADE;
 
 ALTER TABLE PIMAGE 
  ADD CONSTRAINT pFUid
  FOREIGN KEY (PFUID ) 
  REFERENCES product(pid) 
  ON DELETE CASCADE;
 




--관리자 ID 추가

INSERT INTO "MEMBER" VALUES ('admin','admin','관리자',000000,0000000,'admin','YES','010-0000-0000','00000000000','00000','H강의실','코리아IT','1',sysdate);
