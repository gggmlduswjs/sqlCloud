
select * from  emp;




select * from  acorntbl;
select id, name ||  '님'
from  acorntbl;

--조건절 추가하기

select * 
from acorntbl;


select * 
from acorntbl
where point >= 150;

select * 
from acorntbl
where name = '이대훈';


--이름이 이로 시작하는 것 
--문자는  ' '  로 표시함  (쌍따옴표 아님)
select * 
from acorntbl
where  name  like  '이%';


select * 
from acorntbl
where  birthday  >= '2000-01-01';



create table member_tbl_11(
m_id varchar2(5) not null primary key ,
m_pw varchar2(5) ,
m_name varchar2(10) ,
m_tel varchar2(13) ,
m_birthday date ,
m_point number(6) ,
m_grade varchar2(2) 
);
commit;
insert into member_tbl_11 values ('m100' , '1234' , '성기훈', '010-1111-2222' , '2004-01-01' , 100, '01');
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

select * from member_tbl_11;

--where 절 조회하기 

-- 같다    =
select *
from member_tbl_11
where m_name  ='성기훈' ;

--같지 않다   !=
select *
from member_tbl_11
where m_name  != '성기훈' ;


--크다  > 
 select * 
 from member_tbl_11
 where m_point >2000;


--작다  <
 select *
 from member_tbl_11
 where m_point <2000;

 --원하는 컬럼 선택하기
 select  m_name,  m_point
 from member_tbl_11
 where m_point <2000;

--이상 >=

 select * 
 from member_tbl_11
 where m_point >=2000;
--이하 <=

 select  m_name,  m_point
 from member_tbl_11
 where m_point <=2000;


--범위의 있는 값 조회할때 
-- between  a AND b  (a와b사이의 내용, 단 a,b가 포함된다)

 select m_name, m_point
 from  member_tbl_11;
 
 
 select m_name, m_point
 from  member_tbl_11
 where m_point  between  2000 and  3000;    --  작은값   and   큰값

 
 -- 조건이 여러개 인경우  (AND   ,  OR )
 -- 포인트가  2000이상이고  포인트가 3000이하인 경우 조회하기
 
 select  m_name, m_point
 from member_tbl_11
 where m_point>=2000  and  m_point<=3000;
 -- and 조건일경우 뒤에 있는 조건식에서도 컬럼명을 명시해야 함   (주의사항)
 
 
 -- 등급이    01 이거나  03 인 고객 조회하기
 select *
 from member_tbl_11
 where m_grade = '01' or  m_grade ='03';
 
 
 
 -- in() :괄호안에 있는 것만 조회
 select  *
 from  member_tbl_11
 where m_grade in( '01','03');
 
 -- not in() : 괄호안에 있는것을 제외하고 조회
 select  *
 from  member_tbl_11
 where m_grade not in( '01','03');
 
 
 --  null을 확인하는 연산자 
 --  is null , is not null   ( null이냐,   null아 아니냐 판단)
 --  테이블 컬럼에 데이터가 입력되지 않으면 기본값이   null ( 컬럼의 데이터가 정해지지 않았다)
 select * from  member_tbl_11;
 
 select m_name, m_point 
 from  member_tbl_11;
 
 -- null값 연산을 하면 결과가    null  이다 (주의)
 -- null + 1000 =>  null 
 -- 정해지지 않은값 + 1000 = > 정해지지 않은값 
 
 
 select m_name, m_point +1000
 from  member_tbl_11;
 
 --is null 
 --is not null
 
 --포인트를 가지고 있는사람들만  조회 ( 포인트가    null이 아닌 사람 조회하기)
 select *
 from member_tbl_11
 where m_point is not null;
 
 --null은 같다와 같지 않다 비교할 때   is null, is not null  사용해야함 
 -- =, !=을 사용할 수 없다 
 
 
 select *
 from member_tbl_11
 where m_point = null; --x  --  null 체크는   is null  또는   is not null  사용해야함
 
 
 select *
 from member_tbl_11
 where m_point  is null; --O  --  null 체크는   is null  또는   is not null  사용해야함


 --like 
 --특정패턴을 가지고 있는 조건을 검색 ( % 또는  _ )사용할 수 있다
 -- %(자리수의 제한이 없다):0개 이상
 --  _ (이 문자 한개가 자리수 하나를 의미한다)
  -- like   '김%' ;
  -- like   '%김';
  -- like   '%김%';
  select *
  from member_tbl_11
  where m_name like '김%';


  select *
  from member_tbl_11
  where m_name like '%준';
   
  
  -- _ 사용
  select *
  from member_tbl_11
  where m_name like '김_';     -- 김으로 시작하고 뒤에 한 자리에 어떤내용이 와도 괜찮다는 의미


  --중복되지 않고 조회하기  
  select    m_grade
  from member_tbl_11;
  
  select  DISTINCT  m_grade
  from member_tbl_11;  
  
  --문제1 pdf 풀기
  
  
  SELECT * FROM ACORNTBL;
  
  SELECT MAX(birthday) 
  FROM acornTbl;
  


  
select m_name,m_tel,m_grade
from member_tbl_11
where m_grade  !=  '01';
 
 

select m_name,m_tel,m_grade
from member_tbl_11
where m_grade not in ('01'); --9


--정렬하기 

SELECT * 
FROM  MEMBER_TBL_11
ORDER BY M_POINT;   -- 오름차순(낮은 순)



--  포인트금애게  NULL이 있는경우 내림차순을 하면 가장 위에 나옴 
--  (정해지자 않은값 => 가장높은값으로 인식)
SELECT * 
FROM  MEMBER_TBL_11
--WHERE  M_POINT IS NOT NULL
ORDER BY M_POINT  DESC;   -- 내림차순(높은  순)


--정렬할 때는 컬럼명 또는 컬럼 순번 사용

SELECT M_ID, M_NAME, M_POINT
FROM MEMBER_TBL_11
--ORDER BY M_NAME;  --  컬럼명
ORDER BY 3 DESC;    --컬럼의 순번 (   조회시 컬럼의 순번을 뜻함)
-- 기본 오름차순 
-- 내림차순  DESC


--문제2  PDF 풀기 



 --4이름이 수로 끝나는 고객의 아이디, 이름 , 등급 정보를 조회하시오
 select m_id, m_name, m_grade
 from MEMBER_TBL_11
 where  m_name  like  '%수';
 
 
 --5 고객등급이 ‘01’, ‘03’ 인 고객의 아이디, 이름, 등급 정보를 조회하시오
 
 select *
 from  MEMBER_TBL_11
 where   m_grade in('01','03');
 
 
  select  m_id, m_name, m_grade
 from  MEMBER_TBL_11
 where   m_grade in('01','03');
 
 select  m_id, m_name, m_grade
 from  MEMBER_TBL_11
 where m_grade  not in('01','02');
 
 
 
 --7)--고객등급이 ‘02’ 이거나 이름이 이씨성을 가진 고객의 정보의 아이디와 이름 , 등급 정보를 조회 하시오
 
 select *
 from  MEMBER_TBL_11
 where m_grade ='02'  or   m_name like  '이%' ;
 

 
 select m_name, m_grade
 from  MEMBER_TBL_11
 where m_grade ='02'  or   m_name like  '이%' ;
 
 
 
 --8) 생일이 2004-05-01이전에 태어나거나
 --고객등급이 ‘03’인 고객의 아이디, 이름, 생일 정보를 조회하시오
 
 select *
 from  MEMBER_TBL_11;
 
 
  
 select  m_id, m_name, m_birthday , m_grade
 from  MEMBER_TBL_11
 where m_birthday  < '2004-05-01'  or   m_grade = '03';
 
