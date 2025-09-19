create table  acorntbl  (
    id  varchar2(10) primary key,
    pw  varchar2(10) ,
    name varchar2(10),
    point number(6) , 
    birthday date    
);
 
select * from acorntbl;

insert into acorntbl(id, pw, name, point, birthday)  values('dnehdgns', '1234', '우동훈' ,150 , '1996-01-05'); 
insert into acorntbl(id, pw, name, point, birthday)  values('j.choi', '8256', '최정문' ,500 , '1999-07-19');
insert into acorntbl(id, pw, name, point, birthday)  values('popstar', '0909', '이성빈' ,111 , '2001-09-18');
insert into acorntbl(id, pw, name, point, birthday)  values('SMY', '0408', '손민영' ,300 , '1995-08-12');
insert into acorntbl(id, pw, name, point, birthday)  values('jeongjiwon', '1007', '정지원' ,999 , '2001-10-07');
insert into acorntbl(id, pw, name, point, birthday)  values('you__win_', '0610', '유승재' ,100 , '1998-06-10'); 
insert into acorntbl(id, pw, name, point, birthday)  values('sword', '0723', '최성원' ,119 , '2001-07-23');
insert into acorntbl(id, pw, name, point, birthday)  values('ldh', '5566', '이대훈' ,110 , '2000-12-15');
insert into acorntbl(id, pw, name, point, birthday)  values('mhkim', '3616', '김민희' ,155 , '1999-06-18');
insert into acorntbl(id, pw, name, point, birthday)  values('entlrqkr', '7126', '박두식' ,9220 , '1992-02-08');
insert into acorntbl(id, pw, name, point, birthday)  values('LHR', '1111', '이혜린' ,222 , '2001-01-29');
insert into acorntbl(id, pw, name, point, birthday)  values('gyu', '1019', '이동규' ,123 , '2000-10-19');
 insert into acorntbl(id, pw, name, point, birthday)  values('psw', '1234', '박성욱' ,100 , '1996-05-30');
insert into acorntbl(id, pw, name, point, birthday)  values('tm', '2589', '윤태민' ,589 , '2000-11-24');
insert into acorntbl(id, pw, name, point, birthday)  values('seoho', '0708', '김서호' ,123 , '1995-07-08');
insert into acorntbl(id, pw, name, point, birthday)  values('hh', '7825', '김현희' ,1280 , '2000-04-18');
commit;

 select *
 from acorntbl 
 where name = '김현희';
 
 
 

 
--데이터 조회하기 (read)

-- *  :  모든 컬럼
 select  * 
 from acorntbl;
 
 
 -- 원하는 컬럼 조회하기
 
 select  name, point 
 from acorntbl;
 
 --  컬럼에 대한  alias(별칭)으로 조회하기 
 
 
 select name as myname, point
 from acorntbl;
 
 --  as는 생략가능하다
 select name  myname, point
 from acorntbl;
 
  --  별칭에 띄워쓰기, 대소문자 구분  앨라아스에 쌍따옴표 표시하기( 필수)
 select name  "My name" , point
 from acorntbl;
 
 
 -- 컬럼 연결해서 하나로  조회하기    || ( (연결연산자)
 -- 데이터베이스에서 문자는 ' ' 로  표시함 
 select  name || ':'  || point 
 from acorntbl;
 --'를 문자로 표시하고 싶다면 ''  사용해라  
 --33페이지
  select dname ,  '  i like sql '' ' , deptno
  from  dept; 
  
  select dname ,  '  it''s  deptno ' , deptno
  from  dept;
 
 --39페이지 연습문제 1 풀이
 select * from student; 
 select  name,  id  , weight  from student;
 select  name  ||  's ID: ' ||  id  || weight  from student; 
 --'자체를 출력하고 싶다면  '' 해야함  한번 더 적어야 함 
 
 select   name || ' ''s  포인트='  || point  || ' 입니다'     as  mypoint
 from acorntbl;
 
 
 --1번 
 
 select  *
 from student;
 --
  select  name,  id, weight
 from student;
 
 
 select  name || '  ID:' || id || weight   as  "ID AND WEIGHT"
 from student;
 
   
 select  name || '  s'  || '  ID:' || id || weight   as  "ID AND WEIGHT"
 from student;
  
  --'문자로 추가하기
 select  name || ' ''s'  || '  ID:' || id || weight   as  "ID AND WEIGHT"
 from student;
 
 select name || ' ''s'
 from student;
 
 