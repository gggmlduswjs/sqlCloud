--에이콘 테이블 생성
create table  acorntbl  (
    id  varchar2(10) primary key,
    pw  varchar2(10) ,
    name varchar2(10),
    point number(6) , 
    birthday date    
);

--데이터 추가(삽입)
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('dnehdgns', '1234', '우동훈', 150, '1996-01-05');
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('j.choi', '8256', '최정문', 500, '1999-07-19');
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('popstar', '0909', '이성빈', 111, '2001-09-18');
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('SMY', '0408', '손민영', 300, '1995-08-12');
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('jeongjiwon', '1007', '정지원', 999, '2001-10-07');
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('you__win_', '0610', '유승재', 100, '1998-06-10');
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('sword', '0723', '최성원', 119, '2001-07-23');
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('ldh', '5566', '이대훈', 110, '2000-12-15');
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('mhkim', '3616', '김민희', 155, '1999-06-18');
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('entlrqkr', '7126', '박두식', 9220, '1992-02-08');
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('LHR', '1111', '이혜린', 222, '2001-01-29');
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('gyu', '1019', '이동규', 123, '2000-10-19');
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('psw', '1234', '박성욱', 100, '1996-05-30');
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('tm', '2589', '윤태민', 589, '2000-11-24');
INSERT INTO acorntbl (id, pw, name, point, birthday) VALUES ('seoho', '0708', '김서호', 123, '1995-07-08'); 

--데이터 조회(전체 컬럼)
select * from acorntbl;

--특정 컬럼 조회
select * from acorntbl 
where name = '이혜린';

select name, point 
from acorntbl;

--별칭(as) 조회 : 생략 가능, 대소문자 구분 시 as에 "" 꼭 추가
select name as myname, point 
from acorntbl;

--컬럼 연결해서 하나로 조회 => || (연결연산자)
select name || ':' || point
from acorntbl;

--'를 출력하고 싶다면 '' 사용 (한번 더 적기)
select danme, ' it''s deptno', deptno
from dept;

--39p 연습문제1
select * from student;
select name, id, weight from student;
select name || id || weight as "ID AND WEIGTH" from student;
select name || '''s ID: ' || ID || ' , ' || 'WEIGHT is ' || WEIGHT || 'Kg' as "ID AND WEIGHT" 
from student;

--39p 연습문제2
select ename || '(' || job || '), ' || ename || '''' || job || '''' as "NAME AND JOB"
from emp;

--39p 연습문제3
select * from emp;
select ename || '''s sal is $' || sal as "Name And Sal"
from emp;


