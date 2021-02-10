DROP TABLE MEMBER;
CREATE TABLE MEMBER(
	MEMBER_ID VARCHAR2(20) PRIMARY KEY,
	MEMBER_PW VARCHAR2(15),
	MEMBER_NAME VARCHAR2(20),
	MEMBER_JUMIN1 NUMBER,
	MEMBER_JUMIN2 NUMBER,
	MEMBER_EMAIL VARCHAR2(25),
	MEMBER_EMAIL_GET VARCHAR2(7),
	MEMBER_MOBILE VARCHAR2(13),
	MEMBER_PHONE VARCHAR2(13),
	MEMBER_ZIPCODE VARCHAR2(13),
	MEMBER_ADDR1 VARCHAR2(70),
	MEMBER_ADDR2 VARCHAR2(70),
	MEMBER_ADMIN NUMBER,
	MEMBER_JOIN_DATE DATE
);

CREATE TABLE ZIPCODE (
  ID NUMBER,
  ZIPCODE VARCHAR2(7),
  SIDO VARCHAR2(10),
  GUGUN VARCHAR2(30),
  DONG VARCHAR2(36),
  RI VARCHAR2(60),
  BUNJI VARCHAR2(50),
  PRIMARY KEY (ID)
);
SELECT * FROM ZIPCODE;
CREATE TABLE GOODS(
	GOODS_NUM NUMBER,
	GOODS_CATEGORY VARCHAR2(20),
	GOODS_NAME VARCHAR2(50),
	GOODS_CONTENT VARCHAR2(3000),
	GOODS_SIZE VARCHAR2(10),
	GOODS_COLOR VARCHAR2(20),
	GOODS_AMOUNT NUMBER,
	GOODS_PRICE NUMBER,
	GOODS_IMAGE VARCHAR2(50),
	GOODS_BEST NUMBER,
	GOODS_DATE DATE,
	PRIMARY KEY(GOODS_NUM)
);

CREATE TABLE BASKET(
	BASKET_NUM NUMBER,
	BASKET_MEMBER_ID VARCHAR2(20),
	BASKET_GOODS_NUM NUMBER,
	BASKET_GOODS_AMOUNT NUMBER,
	BASKET_GOODS_SIZE VARCHAR2(20),
	BASKET_GOODS_COLOR VARCHAR2(20),
	BASKET_DATE DATE,
	PRIMARY KEY(BASKET_NUM)
);

CREATE TABLE GOODS_ORDER(
	ORDER_NUM NUMBER,
	ORDER_TRADE_NUM VARCHAR2(50),
	ORDER_TRANS_NUM VARCHAR2(50),
	ORDER_GOODS_NUM	NUMBER,
	ORDER_GOODS_NAME VARCHAR2(50),
	ORDER_GOODS_AMOUNT NUMBER,
	ORDER_GOODS_SIZE VARCHAR2(20),
	ORDER_GOODS_COLOR VARCHAR2(20),
	ORDER_MEMBER_ID VARCHAR2(20),
	ORDER_RECEIVE_NAME VARCHAR2(20),
	ORDER_RECEIVE_ADDR1 VARCHAR2(70),
	ORDER_RECEIVE_ADDR2 VARCHAR2(70),
	ORDER_RECEIVE_PHONE VARCHAR2(13),
	ORDER_RECEIVE_MOBILE VARCHAR2(13),
	ORDER_MEMO VARCHAR2(3000),
	ORDER_SUM_MONEY NUMBER,
	ORDER_TRADE_TYPE VARCHAR2(20),
	ORDER_TRADE_DATE DATE,
	ORDER_TRADE_PAYER VARCHAR2(20),
	ORDER_DATE DATE,
	ORDER_STATUS NUMBER,
	PRIMARY KEY(ORDER_NUM)
);

DELETE basket;
COMMIT

SELECT * FROM basket;

INSERT INTO "MEMBER" VALUES ('aaa','ㅇㅇㅇ','123456','156789','YES','01012345678','1234567896','137 - 716','서울 서초구 방배1동 외환카드(주)' ,'우리집','0','sysdate');


CREATE TABLE MEMBER(
	ID VARCHAR2(20) PRIMARY KEY,
	PW VARCHAR2(15),
	NAME VARCHAR2(20)
	);


SELECT * FROM "MEMBER";

DELETE MEMBER 
WHERE pw='홍길동';
COMMIT

CREATE SEQUENCE member_seq;

SELECT * FROM ZIPCODE;

SELECT * FROM zipcode WHERE dong LIKE '녹번%';

insert into member VALUES
()

ALTER TABLE member DROP  


SELECT * FROM "MEMBER"


ALTER TABLE member ADD PRIMARY KEY 'id';

CREATE SEQUENCE member_id_seq;

SELECT MEMBER_id_seq FROM MEMBER


ALTER TABLE member
ADD email  varchar2(20);


ALTER TABLE MEMBER DROP (email);


select * from zipcode where dong  like '%역%'


ALTER TABLE member MODIFY(MEMBER_ADDR1 VARCHAR2(200));

SELECT * FROM MEMBER
WHERE MEMBER_NAME ='홍길동';
SELECT MEMBER_NAME, MEMBER_ID, MEMBER_PW from member where MEMBER_NAME= '홍길동';

select MEMBER_ID, MEMBER_PW, MEMBER_JUMIN1,MEMBER_JUMIN2 from member where MEMBER_NAME='홍길동'


DELETE  FROM MEMBER WHERE member_Id=
rollback

delete from member where MEMBER_ID='a12345'

select MEMBER_ID, MEMBER_PW, MEMBER_JUMIN1,MEMBER_JUMIN2 
from member 
where MEMBER_NAME='홍길동'
AND MEMBER_JUMIN1 ='890922'
AND MEMBER_JUMIN2 ='1036718'


INSERT INTO MEMBER values(
'1','1','1','1','1','1','1','1','1','1','1',
)

m (MEMBER_ZIPCODE VARCHAR2(13))
DROP TABLE ZIPCODE ;

ALTER TABLE "MEMBER" DROP column  MEMBER_TEST
ALTER TABLE "MEMBER" ADD (MEMBER_ZIPCODE VARCHAR2(13))

SELECT * FROM "MEMBER" ORDER BY MEMBER_JOIN_DATE 
UPDATE  "MEMBER" 
SET MEMBER_EMAIL1 ='admin@admin.com'
WHERE member_id='admin'
profile


ALTER TABLE "MEMBER" ADD(MEMBER_PROFILE VARCHAR2(13)); 

ALTER TABLE "MEMBER" RENAME COLUMN MEMBER_EMAIL1 TO MEMBER_EMAIL;
ALTER TABLE "MEMBER" ADD(MEMBER_EMAIL2  VARCHAR2(25)); 

ALTER TABLE "MEMBER" DROP COLUMN MEMBER_UID


SELECT * FROM MEMBER order by MEMBER_JOIN_DATE


SELECT * FROM MEMBER order by MEMBER_JOIN_DATE DESC


select MEMBER_ID , MEMBER_NAME, MEMBER_PW, MEMBER_EMAIL1, MEMBER_JOIN_DATE FROM MEMBER ORDER BY MEMBER_JOIN_DATE

INSERT INTO MEMBER (MEMBER_ID , MEMBER_PW  ,MEMBER_NAME , MEMBER_JUMIN1 ,MEMBER_JUMIN2 ,
					MEMBER_EMAIL1 ,MEMBER_EMAIL_GET , MEMBER_MOBILE , MEMBER_PHONE ,
					MEMBER_ZIPCODE , MEMBER_ADDR1 , MEMBER_ADDR2 , MEMBER_ADMIN , MEMBER_JOIN_DATE )
SELECT  SEQUENCE SEQ_MEMBER_SEQ  , member_id, MEMBER_PW ,MEMBER_NAME , MEMBER_JUMIN1 ,MEMBER_JUMIN2 ,
					MEMBER_EMAIL1 ,MEMBER_EMAIL_GET , MEMBER_MOBILE , MEMBER_PHONE ,
					MEMBER_ZIPCODE , MEMBER_ADDR1 , MEMBER_ADDR2 , MEMBER_ADMIN , MEMBER_JOIN_DATE  FROM "MEMBER" 

CREATE SEQUENCE SEQ_MEMBER_SEQ INCREMENT BY 1 START WITH 1;




    
    