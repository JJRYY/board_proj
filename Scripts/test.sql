SELECT max(BOARD_NUM) FROM board;

select * from board;

select * from board where BOARD_NUM = 22;

INSERT INTO web_gradle_erp.board
(BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_READCOUNT, BOARD_DATE)
VALUES(1, '김상건', '1111', '마칠시간', '5시', 'test.txt', 0, 0, 0, 0, '2021-03-03');

INSERT INTO web_gradle_erp.board
(BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF)
VALUES(1, '김상건', '1111', '마칠시간', '5시', 'test.txt', 0);

delete from board where BOARD_NUM = 3;

-- listcount
select count(*) from board;

-- list 페이징
/*
 *  [1][2][3]
 * (page-1) * 10 -> 1page 0, 2page 10, 3page 20 
 */
select BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_READCOUNT, BOARD_DATE
from board
order by BOARD_RE_REF desc, BOARD_RE_SEQ asc 
limit 0, 10 ;

select BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_READCOUNT, BOARD_DATE
from board
order by BOARD_RE_REF desc, BOARD_RE_SEQ asc 
limit 10, 10 ;


-- 조회수(read count) + 1 시키기
update board set BOARD_READCOUNT = BOARD_READCOUNT + 1 where BOARD_NUM = 35;

-- 글 삭제
select * from board where BOARD_NUM = 34;
delete from board where BOARD_NUM = 34;

-- 글 번호 & 비번 맞는지 확인
select 1 from board where BOARD_NUM = 25 and BOARD_PASS = '1234';

-- 글 수정
update board set BOARD_SUBJECT = '퇴근하고싶다', BOARD_CONTENT = '그런데 안되겠지' where BOARD_NUM = 55;