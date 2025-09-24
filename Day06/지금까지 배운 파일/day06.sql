
-- 6차시
-- 테이블 설계시 데이터 무결성 유지를 위해 중복 데이터를 최소화함
-- 테이블 쪼개기
-- 테이블 합치기 (열합치기)
-- => join

-- join
-- inner join (기본)
-- equal join (equi) = 조인 조건이 같은 것끼리

-- 1)
-- non equi (조인 조건이 범위에 만족한 것을 기준으로 조인)

-- 2)
-- outer 조인
-- left outer 조인
-- right outer 조인
-- full outer 조인

-- 3)
-- self 조인

-- 4)
-- cross 조인



-- inner join 복습
SELECT * FROM tbl_test_customer;
SELECT * FROM tbl_test_goods;
SELECT * FROM tbl_test_order;


-- 주문 테이블
-- 주문현황, 고객 포함시키기

SELECT *
FROM tbl_test_order o
JOIN tbl_test_customer c
ON o.id = c.id;


SELECT o.ocode, c.name, o.sale_cnt
FROM tbl_test_order o
JOIN tbl_test_customer c
ON o.id = c.id;


SELECT c.name, sum(o.sale_cnt)
FROM tbl_test_order o
JOIN tbl_test_customer c
ON o.id = c.id
GROUP BY c.name;




-- non equi 조인 (237 페이지)
SELECT * FROM customer;
SELECT * FROM gift;
--6차시
--join 










select *
from customer  c
join  gift  g
on c.point  >= 1  and  c.point   <= 100000;

select * from customer;
select * from gift;




select *
from customer  c
join  gift  g
on c.point  >= g.g_start  and  c.point   <= g.g_end;

--교재 239
--사용예2
-- student 테이블  , score테이블,  hakjum 테이블을 조회하여 학생들의 이름과 점수와 학점을 출력하시오
--눈으로 조인해 보기
select * from student;
select * from score;
select * from hakjum;
--학생, 학생의점수 조회하기 
select *
from student s       --  studno (조인 조건)
join score   ss
on s.studno  = ss.studno;

--관심있는 컬럼만
select s.name , ss.total
from student s       --  studno (조인 조건)
join score   ss
on s.studno  = ss.studno;

--학점테이블 조인하여 점수 구간대에 대한 학점 조회하기
select s.name , ss.total , h.grade
from student s       --  studno (조인 조건)
join score   ss
on s.studno  = ss.studno
join hakjum h 
on ss.total >= h.min_point  and  ss.total  <= h.max_point;




select * from student;
select * from score;
select * from hakjum;


select * 
from student  s
join  score  ss
on s.studno  = ss.studno; 




select  s.name, ss.total 
from student  s
join  score  ss
on s.studno  = ss.studno; 



select  s.name, ss.total  , h.grade
from student  s
join  score  ss
on s.studno  = ss.studno
join hakjum h
on  ss.total >= h.min_point  and  ss.total <= max_point;




-- outer 조인

SELECT * FROM tbl_test_customer;
SELECT * FROM tbl_test_goods;
SELECT * FROM tbl_test_order;



--고객별 판매수량합 구하기
--주문안한 고객은  => 첫주문 쿠폰 
--주문을 얼마이상한 고객  => 할인쿠폰

SELECT * 
FROM tbl_test_order    o
inner  join  tbl_test_customer c   -- inner 기본
on o.id  = c.id;



--조인에 참여한 테이블 
--tbl_test_order  ( 왼쪽)
--tbl_test_customer (오른쪽)
--left outer join  (왼쪽테이블에 남아 있는 것을 보여줌)
--right outer join( 오른쪽에 남아 있는 것을 보여줌)
--full outer join (   양쪽 테이블 모두 남아 있는 것을 보여줌)

SELECT * 
FROM tbl_test_order    o
right outer join  tbl_test_customer c   -- inner 기본
on o.id  = c.id;



SELECT  c.name,   o.sale_cnt 
FROM tbl_test_order    o
right outer join  tbl_test_customer c   -- inner 기본
on o.id  = c.id;


--고객별 집계

SELECT  c.name,   sum( o.sale_cnt )
FROM tbl_test_order    o
right outer join  tbl_test_customer c   -- inner 기본
on o.id  = c.id
group by   c.name;


-- nvl()  

SELECT  c.name,    nvl( sum( o.sale_cnt ) ,0)
FROM tbl_test_order    o
right outer join  tbl_test_customer c   -- inner 기본
on o.id  = c.id
group by   c.name;


--마무리
SELECT  c.name,    nvl( sum( o.sale_cnt ) ,0)  total
FROM tbl_test_order    o
right outer join  tbl_test_customer c   -- inner 기본
on o.id  = c.id
group by   c.name
order by 2 desc;



SELECT * FROM tbl_test_goods;
SELECT * FROM tbl_test_order;
--
--상품별 판매금액 합 구하기

SELECT *
FROM tbl_test_order   o
join  tbl_test_goods g
on  o.pcode =g.pcode;



SELECT *
FROM tbl_test_order   o
left outer join  tbl_test_goods g
on  o.pcode =g.pcode;




SELECT *
FROM tbl_test_order   o
full outer join  tbl_test_goods g
on  o.pcode =g.pcode;



SELECT *
FROM tbl_test_order   o
right outer join  tbl_test_goods g
on  o.pcode =g.pcode;



--상품정보 insert

select * from tbl_test_goods;
insert into tbl_test_goods( pcode, pname, price)  values('P005', '맛동산',2800);
commit;


--상품별 주문금액 합 구하기 
select * from tbl_test_goods;
select * from tbl_test_order;


select *
from  tbl_test_order   o
join tbl_test_goods g
on o.pcode  = g.pcode;



--주문이 되지 않은 상품도 함께 조회되고 싶으면 
--outer 조인을 수행함 
select *
from  tbl_test_order   o
right  outer  join tbl_test_goods g
on o.pcode  = g.pcode;



select g.pname,   o.sale_cnt
from  tbl_test_order   o
right  outer  join tbl_test_goods g
on o.pcode  = g.pcode;



--상품별 집계
select g.pname,    sum(o.sale_cnt)
from  tbl_test_order   o
right  outer  join tbl_test_goods g
on o.pcode  = g.pcode
group by  g.pname;


-- 마무리
select g.pname,    nvl(sum(o.sale_cnt) ,0)
from  tbl_test_order   o
right  outer  join tbl_test_goods g
on o.pcode  = g.pcode
group by  g.pname;




--교재 241페이지 
--사용예 1


--student테이블과  professor  테이블을   join 하여 학생이름과 지도교수 이름을 출력하시오 
--단 지도교수가 결정되지 않은 학생의 명단도 함께 출력하시오


-- 데이터를 조회하고 눈으로 조인해보기

select * from student;
select * from professor;


--일단 조인 진행, 결과 확인
select * 
from student s
join professor  p
on s.profno  = p.profno;

--학생이 왼쪽에 있으므로  (담당교수가 정해지지 않은 학생도 함께조회)
--left  outer 조인
select * 
from student s
left outer  join professor  p
on s.profno  = p.profno;

--관심있는 컬럼
select s.name,   p.name 
from student s
left outer  join professor  p
on s.profno  = p.profno;


select s.name,   nvl(p.name , ' ')
from student s
left outer  join professor  p
on s.profno  = p.profno;


--사용예 2 
-- student테이블과   professor  테이블 조인하여 
-- 학생이름과 지도교수 이름을 출력하시오
-- 단 지도학생이 결정되지 않은 교수의 명단도 함께 출력하시오 



 


select s.name,   nvl(p.name , ' ')
from student s
right outer  join professor  p
on s.profno  = p.profno;




select s.name,   nvl(p.name , ' ')
from student s
full outer  join professor  p
on s.profno  = p.profno;



--self join    교재  250페이지
--자기 테이블과 조인함 

select * from  emp;

select e1.ename, e2.ename
from emp  e1
join emp  e2
on e1.mgr  = e2.empno;



--cross 조인 
--조인조건이 없는 조인 
--표준조인에서는 조인조건이 없는 조인은  cross 조인을 명시해야함 
--
select * from  tbl_test_order;
select * from  tbl_test_customer;


select *
from  tbl_test_order
cross join  tbl_test_customer  ;   -- 조인조건없이 조인을 수행함 

--N*N
--5  *3  => 15 개
--10000   *  10000   = 100000000 => 1억
 

--나이구하기 
--months_between(sysdate  -생일)  => 개월수  
--trunc(months_between(sysdate  -생일)  => 개월수    /12)

select   months_between(sysdate ,  '2009-02-01') from dual;

select   months_between(sysdate ,  '2009-02-01') /12 from dual;

select   trunc(months_between(sysdate ,  '2009-02-01') /12 ) from dual;

--연습문제 254페이지
-- 1,2,3,4
 
 


--inner 조인 연습 
--outer left, right, full 조인 연습
--self  조인 연습
--연습문제  254 ,255 풀이   

--1)
--2)
--3)결과의 나이가  다르기 떄문에 교재와 다름 
   --서브쿼리를 사용하셔서 풀어보기 (선택)

--4) 결과가 5개행 나옴 
--3시까지 실습해 주세요 

select * from  tbl_test_customer;




 


select g.pname, nvl(sum(o.sale_cnt),0)*g.price 
from tbl_test_order o 
join tbl_test_goods g
on o.pcode=g.pcode
group by g.pname, g.price ;



select g.pname, g.price    , o.sale_cnt  
from tbl_test_order o 
join tbl_test_goods g
on o.pcode=g.pcode;
--group by g.pname, g.price ;


--



select  g.pname, g.price , sum( o.sale_cnt  ) * g.price
from tbl_test_order o 
join tbl_test_goods g
on o.pcode=g.pcode
group by g.pname, g.price ;



select   pname, price, total *1000 
from(

select  g.pname, g.price , sum( o.sale_cnt  )  total
from tbl_test_order o 
join tbl_test_goods g
on o.pcode=g.pcode
group by g.pname, g.price 


);




select g.pname, sum( g.price)    , sum( o.sale_cnt  )
from tbl_test_order o 
join tbl_test_goods g
on o.pcode=g.pcode
group by g.pname  ;


 select   p1.profno,  p1.name , to_char(p1.hiredate,  'yyyy-mm-dd')   ,
 count(p2.hiredate)
from professor p1 
left outer join professor p2
on p2.hiredate  < p1.hiredate   --내 입사일이 더 큰 사람 
group by p1.profno , p1.name, to_char( p1.hiredate, 'yyyy-mm-dd')
order  by 4
;


--

 select   p1.profno,  p1.name , to_char(p1.hiredate,  'yyyy-mm-dd')   , (p2.hiredate)
from professor p1 
left outer join professor p2
on p2.hiredate  < p1.hiredate   --내 입사일이 더 큰 사람  
order  by 1
;


-- 내입사일보다 늦은 사람 조회하기
 select   p1.profno,  p1.name , to_char(p1.hiredate,  'yyyy-mm-dd')   , (p2.hiredate)
from professor p1 
left outer join professor p2
on p2.hiredate  < p1.hiredate   --내 입사일이 더 큰 사람  
order  by 1
;

 --연습문제 풀이
 -- 민영님 풀이
 SELECT * FROM student;
 SELECT * FROM department;


-- 1. 학생 테이블과 학과 테이블을 사용하여 학생 이름, 1전공 학과 번호, 1전공 학과 이름 출력
SELECT s.name, s.deptno1, d.dname
FROM student s
JOIN department d
ON s.deptno1 = d.deptno;



---- 연습문제2

select * from emp2;
select * from p_grade;



select e.name, e.position, e.pay, p.s_pay as low_pay, p.e_pay as high_pay from emp2 e
join p_grade p
on e.position = p.position;



--
SELECT * FROM emp2;
SELECT * FROM p_grade;


SELECT e.name,
            TRUNC(MONTHS_BETWEEN(sysdate, e.birthday) / 12) AGE,
            NVL(e.position, ' ') CURR_POSTION, 
            NVL(p.position, ' ') BE_POSITION
FROM emp2 e
 JOIN p_grade p
ON TRUNC(MONTHS_BETWEEN(sysdate, e.birthday) / 12) BETWEEN p.s_age AND p.e_age
ORDER BY AGE;




SELECT e.name,
            TRUNC(MONTHS_BETWEEN(sysdate, e.birthday) / 12) AGE,
            NVL(e.position, ' ') CURR_POSTION, 
            NVL(p.position, ' ') BE_POSITION
FROM emp2 e
LEFT OUTER JOIN p_grade p
ON TRUNC(MONTHS_BETWEEN(sysdate, e.birthday) / 12) BETWEEN p.s_age AND p.e_age
ORDER BY AGE;



SELECT * FROM emp2;

SELECT NAME, POSITION, BIRTHDAY FROM emp2;

 
SELECT NAME, POSITION, 
BIRTHDAY  ,
 TRUNC(MONTHS_BETWEEN( SYSDATE  , BIRTHDAY) /12)
FROM emp2;


SELECT  *
FROM (

SELECT NAME, POSITION,  
 TRUNC(MONTHS_BETWEEN( SYSDATE  , BIRTHDAY) /12)  AGE
FROM emp2)   A
JOIN p_grade  B
ON A.AGE  BETWEEN  B.S_AGE AND  B.E_AGE;




SELECT  A.NAME, A.AGE, A.POSITION, B.POSITION
FROM (

SELECT NAME, POSITION,  
 TRUNC(MONTHS_BETWEEN( SYSDATE  , BIRTHDAY) /12)  AGE
FROM emp2)   A
JOIN p_grade  B
ON A.AGE  BETWEEN  B.S_AGE AND  B.E_AGE;
 



SELECT  A.NAME, A.AGE, A.POSITION, B.POSITION
FROM (

SELECT NAME, POSITION,  
 TRUNC(MONTHS_BETWEEN( SYSDATE  , BIRTHDAY) /12)  AGE
FROM emp2)   A
LEFT OUTER  JOIN p_grade  B
ON A.AGE  BETWEEN  B.S_AGE AND  B.E_AGE;
 
 
 --4)
 
select * from customer;
select * from gift;


select c.gname "CUST_NAME", c.point, g.gname "GIFT_NAME"
from customer c
join gift g
on c.point > 600001
where g.gname = 'Notebook';


-- CUSTOMER 
-- GIFT 

select * from customer;
select * from gift;


select *
from customer  C
JOIN gift G 
ON C.POINT  >= G.G_START
ORDER BY 1;


desc gift;

select *
from customer  C
JOIN gift G 
ON C.POINT  >= G.G_START
WHERE  G.GNAME   ='Notebook'
ORDER BY 1;



--5번) p.256

select * from professor;  -- self 조인 

--1980-06-23
--1979-01-01

select *
from professor  p1
join professor  p2 
on  p1.hiredate  >   p2.hiredate 
where p1.profno  =1002;


-- count(*)  :  null 카운트
select p1.profno, p1.name , p1.hiredate , count(*)
from professor  p1
left outer  join professor  p2 
on  p1.hiredate  >   p2.hiredate 
group by  p1.profno, p1.name , p1.hiredate;



 

 
select p1.profno, p1.name , p1.hiredate , count(*)
from professor  p1
left outer    join professor  p2 
on  p1.hiredate  >   p2.hiredate 
group by  p1.profno, p1.name , p1.hiredate;
 
 
 
select p1.profno, p1.name , p1.hiredate , count( p2.hiredate)
from professor  p1
left outer  join professor  p2 
on  p1.hiredate  >   p2.hiredate 
group by  p1.profno, p1.name , p1.hiredate;
 
 
  --그룹바이 되기 전 상태 
select p1.profno, p1.name , p1.hiredate ,  p2.hiredate 
from professor  p1
left outer  join professor  p2 
on  p1.hiredate  >   p2.hiredate ;
 

--연습문제254페이지  3번 문제  
--WITH절 사용하기
--WITH는 witth 다음에  쿼리가 실행되는 동안만 존재하는 임시 테이블


with emp_age as (
  select name, birthday,
         trunc(months_between(sysdate, birthday) / 12) as age,
         position
  from emp2
)

select e.name, e.birthday, e.age,
       e.position, p.position
from emp_age e
join p_grade p
  on e.age between p.s_age and p.e_age;
  
  --서브쿼리 연습이 우선적이다
  
