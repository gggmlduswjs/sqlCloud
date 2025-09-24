--6차시
--테이블설계시 데이터 무결성 유지를 위해서 중복데이터 최소화함
--테이블 쪼개기
--테이블 합치기 (열 합치기)
-- =>join


--join
--inner join (기본)
--equal join(equi) = 조인조건이 같은 것끼리

--1)
--non equi (조인조건이 범위에 만족하는 것을 기준으로 조인)


--2) outer 조인
-- left outer 조인
-- right outer 조인
-- full outer 조인

--3) self 조인 


--4) cross 조인


-- inner join 복습
select * from tbl_test_customer;
select * from tbl_test_goods;
select * from tbl_test_order;

--주문테이블
--주문현황, 고객포함시키기

select * 
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id;

select o.ocode, c.name, o.sale_cnt
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id;

select 
c.name, sum(o.sale_cnt)
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
group by c.name;

-- equi 조인 (교재 230페이지)



-- non equi 조인  (교재 237페이지)


select * from customer;
select * from gift;


select * 
from customer c
join gift g
on c.point >= g.g_start and c.point <= g.g_end;

--교재 239
-- 사용 예2

select * from student;
select * from score;
select * from hakjum;

select s.name, c.total , h.grade
from student s
join score c
on s.studno=c.studno
join hakjum h
on c.total>h.min_point and c.total< h.max_point;


--outer 조인
select * from tbl_test_customer;
select * from tbl_test_goods;
select * from tbl_test_order;

--고객별 판매수량
--주문안한 고객은 => 첫 주문 쿠폰
--주문을 얼마 이상한 고객 => 할인 쿠폰

select *
from tbl_test_order o
inner join tbl_test_customer c -- inner 기본
on o.id = c.id;

-- 조인에 참여한 테이블
-- tbl_test_order ( 왼쪽)
-- tbl_test_customer (오른쪽)
-- left outer join(왼쪽 테이블에 남아 있는 것을 보여줌)
-- right outer join( 오른쪽에 남아 있는 것을 보여줌)
-- full outer join (양쪽 테이블 모두 남아 있는 것을 보여줌)

select *
from tbl_test_order o
right outer join tbl_test_customer c -- inner 기본
on o.id = c.id;

select c.name, o.sale_cnt
from tbl_test_order o
right outer join tbl_test_customer c -- inner 기본
on o.id = c.id;



--고객별 집계

select c.name, sum(o.sale_cnt)
from tbl_test_order o
right outer join tbl_test_customer c -- inner 기본
on o.id = c.id
group by c.name;

-- nvl()

select c.name, nvl(sum(o.sale_cnt),0)
from tbl_test_order o
right outer join tbl_test_customer c -- inner 기본
on o.id = c.id
group by c.name;

-- 마무리
select c.name, nvl(sum(o.sale_cnt),0) total
from tbl_test_order o
right outer join tbl_test_customer c -- inner 기본
on o.id = c.id
group by c.name
order by 2 desc;



-- 상품별 판매개수 합 구하기

select * from tbl_test_goods;
select * from tbl_test_order;

select *
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode;

select *
from tbl_test_order o
left outer join tbl_test_goods g
on o.pcode = g.pcode;

select *
from tbl_test_order o
right outer join tbl_test_goods g
on o.pcode = g.pcode;

select *
from tbl_test_order o
full outer join tbl_test_goods g
on o.pcode = g.pcode;

-- 상품 정보 insert

select * from tbl_test_goods;

insert into tbl_test_goods( pcode, pname, price) values('P005','맛동산',2800);

commit;

-- 상품별 주문금액 합 구하기
select * from tbl_test_goods;
select * from tbl_test_order;

select * 
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode;

--주문이 되지 않은 상품도 함께 조회되고 싶으면
--outer 조언을 수행함
select * 
from tbl_test_order o
right outer join tbl_test_goods g
on o.pcode = g.pcode;



select g.pname, o.sale_cnt
from tbl_test_order o
right outer join tbl_test_goods g
on o.pcode = g.pcode;


--상품별 집계
select g.pname, sum(o.sale_cnt)
from tbl_test_order o
right outer join tbl_test_goods g
on o.pcode = g.pcode
group by g.pname;


--마무리

select g.pname, nvl(sum(o.sale_cnt),0)
from tbl_test_order o
right outer join tbl_test_goods g
on o.pcode = g.pcode
group by g.pname;


--교재 241 페이지
-- 사용 예 1

--student 테이블과 professor 테이블을 

select * from student;
select * from professor;

select * 
from student s
join professor p
on s.profno= p.profno;

select s.name, p.name
from student s
join professor p
on s.profno= p.profno;

select s.name, nvl(p.name,'   ')
from student s
left outer join professor p
on s.profno= p.profno;

--사용 예 2
select nvl(s.name,'   '),p.name
from student s
right outer join professor p
on s.profno= p.profno;

select nvl(s.name,'   '),nvl(p.name,'   ')
from student s
full outer join professor p
on s.profno= p.profno;


-- self join 교재 250페이지


-- 자기 테이블과 조인함
-- 나한테 의미잇는 데이터가 나한테 있음

select * from emp;

select *
from emp e1
join emp e2
on e1.mgr=e2.empno;


select e1.ename, e2.ename
from emp e1
join emp e2
on e1.mgr=e2.empno;

--cross 조인
-- 조인 조건이 없는 조인
-- 표준 조인에서는 조인 조건이 없는 조인은 cross 조인을 명시해야함
-- 

select * from tbl_test_order;
select * from tbl_test_customer;

select * 
from tbl_test_order
cross join tbl_test_customer; -- 조인 조건없이 조인을 수행함
-- 연결고리 없어 그냥 조인해줘 

--N*N 모든 경우의 수가 조인됨
-- 5*3=15개
--10000 * 10000 = 100000000 -1억 


-- 나이 구하기
-- months_between(sysdata-생일) => 개월 수
-- trunc(months_between(sysdata-생일)/12) => 나이
--sysdata : 현재 날짜


select months_between(sysdate, '2009-02-01') from dual;

select months_between(sysdate, '2009-02-01')/12 from dual;

select trunc(months_between(sysdate, '2009-02-01')/12) from dual;

-- 연습문제 254페이지

--1,2,3,4

--1번 

select * from student;
select * from department;


select s.name, s.deptno1, d.dname
from student s
join department d
on s.deptno1=d.deptno;

--2번
select * from emp2;
select * from p_grade;

select *
from emp2 e
join p_grade p
on e.position=p.position;

select e.name, e.position, e.pay, p.s_pay, p.e_pay
from emp2 e
join p_grade p
on e.position=p.position;

--3번
select * from emp2;
select * from p_grade;

select name, position, birthday
from emp2;

select name, position, 
birthday,
    trunc(months_between(sysdate,birthday)/12)
from emp2;

select * 
from (
select name, position, 
birthday,
    trunc(months_between(sysdate,birthday)/12) age
from emp2) a
join p_grade b
on a.age between b.s_age and b.e_age;

select a.name, a.age, a.position, b.position
from (
select name, position, 
birthday,
    trunc(months_between(sysdate,birthday)/12) age
from emp2) a
join p_grade b
on a.age between b.s_age and b.e_age;


select a.name, a.age, nvl(a.position,'  '), nvl(b.position, '   ')
from (
select name, position, 
birthday,
    trunc(months_between(sysdate,birthday)/12) age
from emp2) a
left outer join p_grade b
on a.age between b.s_age and b.e_age
order by 2;
----

select *
from emp2 e
join p_grade p
on trunc(months_between(sysdate, e.birthday)/12) > p.s_age 
and trunc(months_between(sysdate, e.birthday)/12) <p.e_age;


select e.name, trunc(months_between(sysdate, e.birthday)/12) as age
,nvl(e.position,'   ') as cuff_position , p.position as be_position
from emp2 e
join p_grade p
on trunc(months_between(sysdate, e.birthday)/12) > p.s_age 
and trunc(months_between(sysdate, e.birthday)/12) <p.e_age ;


--4번
select * from customer;
select * from gift;


-- 포인트 이상이면 가질 수 있는 사은품 전체 조회
select * 
from customer c
join gift g
on c.point>=g.g_start
order by 1;

select * 
from customer c
join gift g
on c.point>=g.g_start
where g.gname ='Notebook'
order by 1;

select c.gname, c.point, g.gname
from customer c
join gift g
on c.point>=g.g_start
where g.gname ='Notebook'
order by 1;

-----
select * 
from customer c
join gift g
on c.point>g.g_start and c.point < g.g_end;

select c.gname, c.point, g.gname
from customer c
join gift g
on c.point>g.g_start and c.point < g.g_end;

select c.gname, c.point, g.gname
from customer c
join gift g
on c.point>g.g_start and c.point < g.g_end
where g.gname = 'Notebook';

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
 
 
  --그룹바이 되기 전
select p1.profno, p1.name , p1.hiredate ,  p2.hiredate 
from professor  p1
left outer  join professor  p2 
on  p1.hiredate  >   p2.hiredate ;


-- 5번
-- self 조인

--테이블 조회
select * from professor;

-- 입사일 조회
select hiredate
from professor
order by 1;

-- 입사일 기준 조인
select *
from professor p1
full outer join professor p2
on p1.hiredate < p2.hiredate;



select p1.profno, p1.name , count(p2.hiredate)
from (
select *
from professor p1
full outer join professor p2
on p1.hiredate < p2.hiredate) 
group by p1.profno;


-- 연습문제 254페이지 3번 문제
--with절 사용하기
--with는 with 다음에 쿼리 실행동안만 존재하는 임시 테이블

with emp_age as (
    select name, birthday,
           trunc(months_between(sysdate, birthday)/12) as age,
           position
    from emp2
    )
    
    select e.name, e.birthday, e.age,
            e.position, p.position
    from emp_age e
    join p_grade p
            on e.age between p.s_age and p.e_age;
            
-- 서브쿼리 연습이 우선적이다
--


