CREATE TABLE "MEMBER_JSP"
(    "ID" VARCHAR2(10) NOT NULL ENABLE,
     "PASS" VARCHAR2(10) NOT NULL ENABLE,
     "NAME" VARCHAR2(30) NOT NULL ENABLE,
     "REGIDATE" DATE DEFAULT sysdate NOT NULL ENABLE,
     CONSTRAINT "MEMBER_JSP_PK" PRIMARY KEY ("ID")
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255
             TABLESPACE "USERS"  ENABLE
) SEGMENT CREATION DEFERRED
    PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255
    NOCOMPRESS LOGGING
    TABLESPACE "USERS" ;


COMMENT ON COLUMN MEMBER_JSP.ID IS '아이디';
COMMENT ON COLUMN MEMBER_JSP.PASS IS '패스워드';
COMMENT ON COLUMN MEMBER_JSP.NAME IS '이름';
COMMENT ON COLUMN MEMBER_JSP.REGIDATE IS '가입날짜';



CREATE TABLE "BOARD_JSP"
(    "NUM" NUMBER,
     "TITLE" VARCHAR2(200) NOT NULL ENABLE,
     "CONTENT" VARCHAR2(2000) NOT NULL ENABLE,
     "ID" VARCHAR2(10) NOT NULL ENABLE,
     "POSTDATE" DATE DEFAULT sysdate NOT NULL ENABLE,
     "VISITCOUNT" NUMBER(6,0),
     PRIMARY KEY ("NUM")
         USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255
             TABLESPACE "USERS"  ENABLE
) SEGMENT CREATION DEFERRED
    PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255
    NOCOMPRESS LOGGING
    TABLESPACE "USERS" ;


CREATE SEQUENCE seq_board_num
    INCREMENT BY 1 -- 1씩 증가
    START WITH 1 -- 1부터 시작
    MINVALUE 1	-- 최소
    nomaxvalue -- 최대값 무한대
	nocycle --순환
	nocache; -- 캐시 안함

create table mvcboard (
                          idx number primary key,
                          name varchar2(50) not null,
                          title varchar2(200) not null,
                          content varchar2(2000) not null,
                          postdate date default sysdate not null,
                          ofile varchar2(200),
                          sfile varchar2(30),
                          downcount number(5) default 0 not null,
                          pass varchar2(50) not null,
                          visitcount number default 0 not null
);

--더미 데이터 입력
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '김유신', '자료실 제목1 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '장보고', '자료실 제목2 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '이순신', '자료실 제목3 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '강감찬', '자료실 제목4 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '대조영', '자료실 제목5 입니다.','내용','1234');

insert into mvcboard (idx, name, title, content, pass)
values (seq_board_num.nextval, '최지호', '지호의 하루','#OOTD','1004');

insert into MEMBER_JSP (ID, PASS, NAME, REGIDATE) VALUES ('jiho', '1004', '최지호', to_date(sysdate, 'YYYY-MM-DD'));