create table member_tbl_11(

 m_id   varchar2(5) not null  primary key ,
 m_pw  varchar2(5)  ,
 m_name varchar2(10) ,
 m_tel varchar2(13) ,
 m_birthday date ,
 m_point  number(6) ,
 m_grade varchar2(2) 
);
commit;

insert into member_tbl_11 values ('m100' , '1234' , '성기훈', '010-1111-2222' , '2004-01-01' , 100,  '01');
 insert into member_tbl_11 values ('m101' , '4444' , '김상우', '010-2222-3333' , '2004-01-01' , 1500, '01');
 insert into member_tbl_11 values ('m102' , '5555' , '김일남', '010-3333-4444' , '2004-12-10' , 2000, '02');
 insert into member_tbl_11 values ('m103' , '6666' , '이준호', '010-4444-5555' , '2004-04-10' , 1900, '02');
 insert into member_tbl_11 values ('m104' , '7777' , '김새벽', '010-5555-6666' , '2004-09-12' , 3000, '03');
 insert into member_tbl_11 values ('m105' , '8888' , '최덕수', '010-6666-7777' , '2004-08-10' , 4800, '03');
 insert into member_tbl_11 values ('m106' , '9999' , '이알리', '010-7777-8888' , '2004-07-10' , 2900, '01');
 insert into member_tbl_11 values ('m107' , '0101' , '김미녀', '010-8888-9999' , '2004-06-09' , 1200, '01');
 insert into member_tbl_11 values ('m108' , '0404' , '이정재', '010-9999-8888' , '2004-05-19' , 3000, '03');
 insert into member_tbl_11 ( m_id, m_pw, m_name , m_tel , m_birthday) 
values ('m109' , '0448' , '박해수', '010-7878-1111' , '2004-11-27' );
 insert into member_tbl_11 ( m_id, m_pw, m_name , m_tel , m_birthday) 
values ('m110' , '4848' , '위하준', '010-8888-9090' , '2004-11-09');
commit;


--단일행함수 
--여러건의 데이터를 한 번에 하나씩 처리하는 함수 
--각 행에 대해서 함수가 실행된다


  select * from acorntbl;  
  select * from emp;
  
  select ename,   substr(ename,1,1), job
  from emp;
  
  
  --문자함수 
  --데이터베이스  문자, 문자열  구분하지 않는다
  --' '로 감싼다 
  --'자체를 문자로 사용할때 는 ''더 작성한다 
   
  -- substr() :문자함수
  
  select name from acorntbl;
  
  --인덱스 1부터 시작함
  select  substr(name ,1 ,1)  as  성 
  from acorntbl;
  
  --소문자로 변경하기, 대문자로 변경하기
  
  select ename from emp;
  
  --소문자로 조회하기
  select lower(ename) 
  from emp;
  
  
  --대문자로 조회하기
  select upper(ename) 
  from emp;
  
  --함수를 연습용으로 조회할 때는  dual  임시테이블 사용하기 
  select  upper('apple')  from  dual;
  
  
  
  --숫자함수
  -- round() :반올림, trunc()  :버림  
  select  ename,  round( (sal * 12)/8  ,1 ) 
  from emp;  -- 반올림하여 소수첫째자리까지 보여주기
  
  select ename, round( sal , -2) 
  from emp;
  
  
  -- 날짜함수
  -- 현재날짜 가져오기
  select  sysdate  from dual;
  
  
  
  --일반함수 
  --(조건함수 )
  
  
   select * from acorntbl;
   
   select name, point 
   from acorntbl;
   --포인트  500이상  A
   --       200      B
     --              c   
     
   select  point  ,  case when point>=500 then 'A'
                          when point>=200  then 'B'
                          else 'C'
                     end  as 등급
   from acorntbl;
   
   
   --null 처리하는 함수  nvl(), nvl2()  
   
   select * from member_tbl_11;
   
   -- 포인트를 100인상하는 조회하기 
   -- null이면 0으로 처리하겠다   nvl() 함수
   
   select m_point,  m_point +100 
   from member_tbl_11;
   
   
   --nvl(  컬럼명, null일때 사용할 값)
   select m_point,  nvl(m_point,0) +100 
   from member_tbl_11;
   
   
   
   --nvl2(컬럼명, null아닌경우, null인경우)      
   select  nvl2(m_point, m_point+100 , 0 )
   from member_tbl_11;
   
   SELECT  *
   FROM member_tbl_11;
   
   
  