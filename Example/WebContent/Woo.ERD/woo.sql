
/* Drop Tables */
drop sequence ph_seq;

DROp TABLE Purchase CASCADE CONSTRAINTS;


SELECT * FROM seq WHERE sequence_name = 'PH_SEQ';


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
	pid NUMBER NOT NULL UNIQUE, 
	pclpcnt NUMBER NOT NULL,
	pcaddress2 varchar2(500),
	pRIMARY KEY (pcid)
);

SELECT * FROM PURCHASE;

SELECT * FROM PRODUCT;	

/* 내거 조건문 */
SELECT a.PIMAGE ,a.PNAME ,a.PBRAND ,a.pid, b.PCADDRESS ,b.PCADDRESSNUM , b.PTOTALPRICE ,b.PCCONTENT ,b.pcuid,b.pcregdate,b.PCLPCNT ,b.PCSTATUS 
		FROM PRODUCT a INNER join PURCHASE b on a.PID =b.PID;
	
	
/* -성준이형꺼 받아오기- */	
SELECT a.MEMBER_ZIPCODE,a.MEMBER_ADDR1, a.MEMBER_ADDR2 FROM "MEMBER" a JOIN PURCHASE b ON a.MEMBER_ID =b.PCUID;


SELECT a.PIMAGE ,a.PNAME ,a.PBRAND ,a.pid, b.PCADDRESS ,b.PCADDRESSNUM , b.PTOTALPRICE ,b.PCCONTENT ,b.pcuid,b.pcregdate,b.PCLPCNT ,b.PCSTATUS,b.PCADDRESS2 
FROM PRODUCT a inner join PURCHASE b on a.PID =b.PID WHERE b.PCUID='pd1125'  and b.PCSTATUS=1;

COMMIT;