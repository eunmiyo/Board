DROP TABLE USERS CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;


--CREATE TABLE MEMBER (
--    USER_ID      VARCHAR2(10) PRIMARY KEY,
--    PASSWORD    VARCHAR2(20) NOT NULL,
--    NICKNAME  VARCHAR2(50)
--);

--CREATE TABLE BOARD (
--    BOARD_NO NUMBER PRIMARY KEY,
--    USER_ID  VARCHAR2(10) NOT NULL,
--    TITLE    VARCHAR2(150) NOT NULL,
--    CONTENT CLOB,
--    REG_DATE DATE NOT NULL,
--    VIEWS NUMBER NOT NULL,
--    UPDATE_DATE DATE,
--    FILE_NAME VARCHAR2(255),
--    CONSTRAINT FK_ID FOREIGN KEY(USER_ID) REFERENCES MEMBER(USER_ID)  --외래키 지정
--);

CREATE TABLE BOARD (
    BOARD_NO NUMBER PRIMARY KEY,
    USER_ID  VARCHAR2(30) NOT NULL,
    TITLE    VARCHAR2(150) NOT NULL,
    CONTENT CLOB,
    REG_DATE DATE NOT NULL,
    VIEWS NUMBER NOT NULL,
    UPDATE_DATE DATE,
    FILE_NAME VARCHAR2(255)
);

CREATE SEQUENCE BOARD_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;


--INSERT INTO MEMBER VALUES('test1', '1234', '유재석');
--INSERT INTO MEMBER VALUES('test2', '1234', '지석진');
--INSERT INTO MEMBER VALUES('test3', '1234', '하하');

INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, REG_DATE, VIEWS)
VALUES(BOARD_SEQ.nextval, 'test1', '안녕하세요.', '미국 곳곳에 겨울 혹한과 눈폭풍이 불어닥치면서 제작비로 4천 5백억 원 이상이 들어간 영화 흥행에 타격이 있을 것이란 보도들이 이어졌습니다.', sysdate, 0);

INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, REG_DATE, VIEWS)
VALUES(BOARD_SEQ.nextval, 'test2', '날씨가 춥네요.', '하지만 뉴욕이 1906년 이후 가장 추운 크리스마스를 맞는 등 미국 전역에 폭설과 혹한이 몰아치면서 대부분 영화 흥행이 기대 이하에 머물 것으로 전망됩니다.', sysdate, 5);

INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, REG_DATE, VIEWS)
VALUES(BOARD_SEQ.nextval, 'test3', '날씨가 춥네요222', '하지만 뉴욕이 1906년 이후 가장 추운 크리스마스를 맞는 등 미국 전역에 폭설과 혹한이 몰아치면서 대부분 영화 흥행이 기대 이하에 머물 것으로 전망됩니다.', sysdate, 15);

INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, REG_DATE, VIEWS)
VALUES(BOARD_SEQ.nextval, 'test1', '연말입니다.', '하지만 뉴욕이 1906년 이후 가장 추운 크리스마스를 맞는 등 미국 전역에 폭설과 혹한이 몰아치면서 대부분 영화 흥행이 기대 이하에 머물 것으로 전망됩니다.', sysdate, 0);

INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, REG_DATE, VIEWS)
VALUES(BOARD_SEQ.nextval, 'test2', '치즈케이크 맛있음', '하지만 뉴욕이 1906년 이후 가장 추운 크리스마스를 맞는 등 미국 전역에 폭설과 혹한이 몰아치면서 대부분 영화 흥행이 기대 이하에 머물 것으로 전망됩니다.', sysdate, 2);

INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, REG_DATE, VIEWS)
VALUES(BOARD_SEQ.nextval, 'test3', '저녁은 뭘먹나', '하지만 뉴욕이 1906년 이후 가장 추운 크리스마스를 맞는 등 미국 전역에 폭설과 혹한이 몰아치면서 대부분 영화 흥행이 기대 이하에 머물 것으로 전망됩니다.', sysdate, 1);

SELECT *
FROM(SELECT ROWNUM rn, v_board.*
        FROM (SELECT board_no, title, user_id, to_char(reg_date, 'yyyy.mm.dd') reg_date, views
                    FROM board
                    ORDER BY board_no) v_board)
WHERE rn BETWEEN 1 AND 5;

SELECT *
FROM(SELECT ROWNUM rn, v_board.*
        FROM (SELECT board_no, title, user_id, to_char(reg_date, 'yyyy.mm.dd') reg_date, views
                    FROM board
                    ORDER BY board_no) v_board)
WHERE rn BETWEEN 6 AND 10;


SELECT *
FROM(SELECT ROWNUM rn, v_board.*
        FROM (SELECT board_no, title, user_id, to_char(reg_date, 'yyyy.mm.dd') reg_date, views
                    FROM board
                    ORDER BY board_no) v_board)
WHERE rn BETWEEN 11 AND 15;

commit;

SELECT BOARD_NO, TITLE, USER_ID, TO_CHAR(REG_DATE, 'YYYY.MM.DD') REG_DATE, VIEWS FROM BOARD;

SELECT BOARD_NO, TITLE, USER_ID, TO_CHAR(REG_DATE, 'YYYY.MM.DD') REG_DATE, VIEWS, CONTENT 
FROM BOARD WHERE BOARD_NO = 1;

UPDATE BOARD SET VIEWS = (VIEWS + 1) WHERE BOARD_NO;