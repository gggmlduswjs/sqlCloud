select * from acorntbl;
select id, name || '님'
from acorntbl;

--조건절 where
select * 
from acorntbl 
where point >= 150;

--이름이 이로 시작 조회 -> like
select *
from acorntbl
where name like '이%';

--'sql첫번째.pdf 파일 안에 테이블 붙여넣기'
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
 
 select * from member_tbl_11;
 
 --where절 조회하기
 
 --같다 =
 select * 
 from member_tbl_11
 where m_name = '성기훈';
 --같지 않다 !=
  select * 
 from member_tbl_11
 where m_name != '성기훈';
 
 --크다 >
 select *
 from member_tbl_11
 where m_point > 2000;
 --작다 <
 select *
 from member_tbl_11
 where m_point < 2000;
 
 --원하는 컬럼 선택
 select m_name, m_point
 from member_tbl_11
 where m_point < 2000;
 
 --이상 >=
 select * 
 from member_tbl_11
 where m_point >= 2000;
 --이하 <=
 select m_name, m_point 
 from member_tbl_11
 where m_point <= 2000;
 
 --범위의 있는 값 조회 -> between A and B (a와 b사이의 내용, 단 a, b가 포함된다)
 select m_name, m_point
 from member_tbl_11
 where m_point between 2000 and 3000;   -- 2000 ~ 3000
 
 --조건이 여러개인 경우 ( AND, OR )
 --포인트가 2000이상이고 포인트가 3000이하인 경우 조회
 select m_name, m_point
 from member_tbl_11
 where m_point >= 2000 and m_point <= 3000; 
 --**and 조건일 경우 : 뒤에 있는 조건식에서도 컬럼명을 명시해야함
 
 --등급이 01이거나 03인 고객 조회
 select m_name, m_point, m_grade
 from member_tbl_11
 where m_grade = '01' or m_grade = '03';
 
 -- in() : 괄호 안에 있는 것만 조회
 select * 
 from member_tbl_11
 where m_grade in('01', '03');
 
 -- not in() : 괄호 안에 있는 것을 제외하고 조회
 select * 
 from member_tbl_11
 where m_grade not in('01', '03');
 
 --null 확인 -> is null, is not null
 --테이블 컬럼에 데이터가 입력되지 않으면 기본값이 null (컭럼의 데이터가 정해지지 않았다)
  select m_name, m_point
  from member_tbl_11;
  
  --null값 연산을 하면 결과가 null이다
  --null + 1000 => null
  select m_name. m_point + 1000
  from member_tbl_11;
  
  --is null / is not null : null은 같다와 같지않다 비교할 때 사용해야함
  -- =, !=을 사용할 수 없다
  --포인트를 가지고 있는 사람들만 조회 (포인트가 null이 아닌 사람)
  select * 
  from member_tbl_11
  where m_point is not null;
  
  --like
  --특정패턴 조회 -> % 또는 _
  -- % (자리수의 제한이 없다) : 0개 이상
  -- _ (이 문자 한개가 자리수 하나를 의미)
  
  -- like '김%' / like '%김' / like '%김%'
  select * 
  from member_tbl_11
  where m_name like '김%';
  
  -- _ 사용
  select *
  from member_tbl_11
  where m_name like '김_';   --김으로 시작하고 뒤에 한 자리에 어떤 내용이 와도 괜찮다는 의미
  
  --distinct : 중복되지 않고 조회하기
  select DISTINCT m_grade
  from member_tbl_11;
  
  --정렬하기
  --오름차순 (낮은 순) -> 기본값 (ASC 생략 가능)
  SELECT *
  FROM member_tbl_11
  ORDER BY m_point;
  
  --내림차순 (높은 순) -> DESC
  --포인트금액에 NULL이 있는 경우, 내림차순을 하면 가장 위에 나옴
  --(NULL 값 -> 가장 높은 값으로 인식)
  SELECT *
  FROM member_tbl_11
--  WHERE m_point IS NOT NULL
  ORDER BY m_point DESC;
  
  --정렬할 때 컬럼명 또는 컬럼 순번 사용
  SELECT m_id, m_name, m_point
  FROM member_tbl_11
--  ORDER BY m_name;             --컬럼명
 ORDER BY 3 DESC;                 --컬럼의 순번 (조회 시 컬럼의 순번을 뜻함)
  
  
  
 
 
 
 
 