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
--    CONSTRAINT FK_ID FOREIGN KEY(USER_ID) REFERENCES MEMBER(USER_ID)  --�ܷ�Ű ����
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


--INSERT INTO MEMBER VALUES('test1', '1234', '���缮');
--INSERT INTO MEMBER VALUES('test2', '1234', '������');
--INSERT INTO MEMBER VALUES('test3', '1234', '����');

INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, REG_DATE, VIEWS)
VALUES(BOARD_SEQ.nextval, 'test1', '�ȳ��ϼ���.', '�̱� ������ �ܿ� Ȥ�Ѱ� ����ǳ�� �Ҿ��ġ�鼭 ���ۺ�� 4õ 5��� �� �̻��� �� ��ȭ ���࿡ Ÿ���� ���� ���̶� �������� �̾������ϴ�.', sysdate, 0);

INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, REG_DATE, VIEWS)
VALUES(BOARD_SEQ.nextval, 'test2', '������ ��׿�.', '������ ������ 1906�� ���� ���� �߿� ũ���������� �´� �� �̱� ������ ������ Ȥ���� ����ġ�鼭 ��κ� ��ȭ ������ ��� ���Ͽ� �ӹ� ������ �����˴ϴ�.', sysdate, 5);

INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, REG_DATE, VIEWS)
VALUES(BOARD_SEQ.nextval, 'test3', '������ ��׿�222', '������ ������ 1906�� ���� ���� �߿� ũ���������� �´� �� �̱� ������ ������ Ȥ���� ����ġ�鼭 ��κ� ��ȭ ������ ��� ���Ͽ� �ӹ� ������ �����˴ϴ�.', sysdate, 15);

INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, REG_DATE, VIEWS)
VALUES(BOARD_SEQ.nextval, 'test1', '�����Դϴ�.', '������ ������ 1906�� ���� ���� �߿� ũ���������� �´� �� �̱� ������ ������ Ȥ���� ����ġ�鼭 ��κ� ��ȭ ������ ��� ���Ͽ� �ӹ� ������ �����˴ϴ�.', sysdate, 0);

INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, REG_DATE, VIEWS)
VALUES(BOARD_SEQ.nextval, 'test2', 'ġ������ũ ������', '������ ������ 1906�� ���� ���� �߿� ũ���������� �´� �� �̱� ������ ������ Ȥ���� ����ġ�鼭 ��κ� ��ȭ ������ ��� ���Ͽ� �ӹ� ������ �����˴ϴ�.', sysdate, 2);

INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, REG_DATE, VIEWS)
VALUES(BOARD_SEQ.nextval, 'test3', '������ ���Գ�', '������ ������ 1906�� ���� ���� �߿� ũ���������� �´� �� �̱� ������ ������ Ȥ���� ����ġ�鼭 ��κ� ��ȭ ������ ��� ���Ͽ� �ӹ� ������ �����˴ϴ�.', sysdate, 1);

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