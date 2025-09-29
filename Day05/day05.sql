-- 뷰와 서브쿼리


-- 집계함수 sum, avg, max, min
-- 윈도우절 over()


SELECT * FROM ACORNTBL;
SELECT NAME, POINT FROM ACORNTBL;
SELECT NAME, POINT, SUM(POINT) OVER() FROM ACORNTBL;


-- OVER([PARTITON BY, ORDER BY, RANGE|ROWS]) : 파티션 x, 정렬기준 x
-- OVER() 비어있다는 것은 파티션과 정렬기준 모두 없으면 : 전체합계


SELECT NAME, POINT, SUM(POINT) 
OVER(ORDER BY BIRTHDAY) -- RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
FROM ACORNTBL;




SELECT M_NAME, M_GRADE, M_POINT,
    SUM(M_POINT) OVER(ORDER BY M_NAME) -- 누적을 할 때, 파티션이 없으면 전체를 대상으로 처음부터 현재행까지 누적
FROM MEMBER_TBL_11 
WHERE M_POINT IS NOT NULL;


SELECT M_NAME, M_GRADE, M_POINT,
    SUM(M_POINT) OVER(
    partition by m_grade
    ORDER BY M_NAME
    range between unbounded preceding and current row -- 기본값
    ) -- 누적을 할 때, 파티션이 없으면 전체를 대상으로 처음부터 현재행까지 누적
FROM MEMBER_TBL_11 
WHERE M_POINT IS NOT NULL;

SELECT M_NAME, M_GRADE, M_POINT,
    SUM(M_POINT) OVER(
    partition by m_grade
    ORDER BY M_NAME
    rows between unbounded preceding and current row -- 기본값
    ) -- 누적을 할 때, 파티션이 없으면 전체를 대상으로 처음부터 현재행까지 누적
FROM MEMBER_TBL_11 
WHERE M_POINT IS NOT NULL;

select m_name, m_point , m_grade
from member_tbl_11
where m_point is not null;

select m_name, m_point , m_grade, 
sum(m_point) over(order by m_point) -- 처음부터 현재행까지 의미
from member_tbl_11
where m_point is not null;


select m_name, m_point , m_grade, 
sum(m_point) over(
    partition by m_grade
    order by m_point
    rows between unbounded preceding and current row-- 처음부터 현재행까지 의미
) 
from member_tbl_11
where m_point is not null;

-- 뷰 교재 400페이지

CREATE TABLE t_emp
(
eid VARCHAR2(13) NOT NULL PRIMARY KEY ,
ename VARCHAR2(20) ,
salary NUMBER(5) ,
deptno NUMBER(5) ,
comm NUMBER(5) 
);
COMMIT;
INSERT INTO t_emp VALUES ('e001' , '신동엽' , 280,10,100) ;
INSERT INTO t_emp VALUES ('e002' , '유재석' , 250,20,50) ;
INSERT INTO t_emp VALUES ('e003' , '전현무' , 190,30,0) ;
INSERT INTO t_emp VALUES ('e004' , '양세영' , 300,20,0) ;
INSERT INTO t_emp VALUES ('e005' , '양세찬' , 290,40,100) ;
CREATE TABLE t_dept
(
deptno NUMBER(5) NOT NULL PRIMARY KEY ,
dname VARCHAR2(20) 
);
COMMIT;
INSERT INTO t_dept VALUES (10 , '영업팀') ;
INSERT INTO t_dept VALUES (20 , '기획팀') ;
INSERT INTO t_dept VALUES (30 , '관리팀') ;
INSERT INTO t_dept VALUES (40 , '마케팅팀') ;
INSERT INTO t_dept VALUES (50 , '재무팀') ;

select * from t_dept;
select * from t_emp;


--뷰의 목적
-- 보안과 사용자 편의성
--불필요한 정보를 제공하지 않는다
--복잡한 쿼리를 매번 작성하지 않는다

--뷰 만들기

--create view 뷰 이름
-- as
-- select ename,deptno
--from t_emp;


create view v_emp
as
    select ename, deptno
    from t_emp;

select * from v_emp;

select ename from v_emp;

-- 사용자 편의성(복잡한 쿼리를 매번 작성하지 않는다)
--조인쿼리를 뷰로 만든다

select * from t_dept;
select * from t_emp;

--사원이름, 급여, 부서명

select * 
from t_emp e
join t_dept d
on e.deptno=d.deptno;


select e.ename, e.salary, d.dname
from t_emp e
 join t_dept d
on e.deptno=d.deptno;


create view v_emp_dept
as

select e.ename, e.salary, d.dname
from t_emp e
 join t_dept d
on e.deptno=d.deptno;

select * from v_emp_dept;



select * from v_emp_dept
where salary >= 300;


--
select * from tbl_test_customer;
select * from tbl_test_goods;
select * from tbl_test_order;


-- 상품별 판매개수 구하기

select *
from tbl_test_order o
join tbl_test_goods g
on o.pcode=g.pcode;

-- 상품별 판매 수량의 합계 구하기
select g.pname, sum( o.sale_cnt)
from tbl_test_order o
join tbl_test_goods g
on o.pcode=g.pcode
group by g.pname;

create view v_order
as
select g.pname, sum( o.sale_cnt) as total -- 왜? 컬럼명을 써야하지?
from tbl_test_order o
join tbl_test_goods g
on o.pcode=g.pcode
group by g.pname;


select * from v_order;

select * 
from v_order
where total >=3;

--뷰의 종류
--단순뷰(한 개의 테이블로 뷰 만들기)
--복합뷰(조인 테이블로 만들기)
--인라인뷰 (임시로 만들어지는 뷰: 서브쿼리의 종류)

--서브쿼리
--쿼리 안에 쿼리가 있는 형태
--바깥 쿼리 : 메인쿼리
--안에 있는 쿼리 : 서브쿼리

--서브쿼리가 오는 위치
--from 절 뒤
--where 절 뒤
--select 절 뒤

-- 1) where절 뒤 서브쿼리
-- 단일행
-- 복수행

--신동엽 사원보다 급여가 많은 사람의 이름을 조회하시오
select * from t_emp;

select * from t_emp
where salary > 280;

select ename, salary, comm from t_emp
where salary > 280;

select salary
from t_emp
where ename='신동엽';

select ename, salary, comm from t_emp
where salary > (select salary
from t_emp
where ename='신동엽');

-- 에이콘 테이블
-- 가장 어린 사람의 이름 조회하기

select name, birthday
from acorntbl;

--가장 어린 사람
--생일이 가장 늦은 사람
--생일이 가장 큰 것 MAX 사용하기

select max(birthday) from acorntbl;

select name, birthday
from acorntbl
where birthday='2001-10-07';

select name, birthday
from acorntbl
where birthday=(select max(birthday) from acorntbl);

select *
from acorntbl
where birthday=(select max(birthday) from acorntbl);

-- 교재 428 페이지 서브쿼리의 종류
-- 단일행 서브쿼리
--서브쿼리의 결과가 단일행, 단일컬럼(값 하나)
-- = , > , < , >= , <=


-- 문제 1)
-- acorntbl 테이블에서 포인트가 가장 높은 사람의 이름을 조회하시오
-- acorntbl 테이블에서 포인트의 평균보다 높은 사람의 이름을 조회하시오
-- emp 테이블에서 가장 높은 급여를 받는 사람의 이름을 조회하시오

select * from acorntbl;

select name, point
from acorntbl;

select max(point) from acorntbl;

select name, point
from acorntbl
where point=(select max(point) from acorntbl);

--
select avg(point) from acorntbl;

select name, point
from acorntbl
where point > (select avg(point) from acorntbl);

--
select * from emp;

select ename, sal from emp;

select max(sal) 
from emp;

select ename, sal
from emp
where sal=(select max(sal) from emp);

--


-- 연습문제 429페이지
-- 연습문제 1, 문제 2

--문제 1
select * from student;
select * from department;

--학생테이블에서 Anthony Hopkins의 1전공 찾기
--103과 같은 학생 찾기
--전공 이름이 함께 나오도록 한다

--1) 학생 테이블과 학과테이블 조인하기
--2) 학생테이블에서 Anthony Hopkins의 1전공 찾기
--3) 합쳐서 서브쿼리로 완성

select deptno1
from student
where name='Anthony Hopkins';

select name
from student 
where studno=(select deptno1
from student
where name='Anthony Hopkins');

select *
from student s
join department d
on d.deptno=s.deptno1;

select s.deptno1, s.name, d.dname
from student s
join department d
on d.deptno=s.deptno1;


select  s.name, d.dname
from student s
join department d
on d.deptno=s.deptno1
where deptno1=(select deptno1
from student
where name='Anthony Hopkins');

--문제 2

select * from professor;
select * from department;

select hiredate
from professor
where name='Meg Ryan';

select name, hiredate
from professor
where hiredate>(select  hiredate
from professor
where name='Meg Ryan');

select *
from professor p
join department d
on p.deptno=d.deptno;

select p.name, p.hiredate, d.dname
from professor p
join department d
on p.deptno=d.deptno;

select p.name, p.hiredate, d.dname
from professor p
join department d
on p.deptno=d.deptno
where hiredate>(select  hiredate
from professor
where name='Meg Ryan');


--FROM 절 뒤에 오는 서브쿼리 (인라인 뷰라고 함)
--에이콘몰테이블사용하여 고객별 판매수량 합계구하기

--고객별 판매수량의 합계
--이대훈 9
--유승재 6
--정지원 2
--최성원 5
--전희연 3

select * from tbl_test_order;
select * from tbl_test_customer;
select * from tbl_test_goods;

select * from tbl_test_order o
join tbl_test_customer c
on o.id=c.id;

select c.name, o.sale_cnt 
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id;

select c.name, sum( o.sale_cnt) 
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
group by c.name;

--from 절 뒤의 서브쿼리(인라인 뷰) 사용하여 풀기

-- 1) 고객코드별 판매수량합계 구하기 (주문테이블)
-- 2) 위의 내용과 고객테이블을 조인하여 쿼리 완성

select *
from tbl_test_order;

select id, sale_cnt
from tbl_test_order;

select id, sum(sale_cnt) total
from tbl_test_order
group by id;

--) 위의 결과로 부터
-- 위의 쿼리를 from절 뒤의 서브쿼리로 이용하여 
-- 고객 테이블과 조인하여 고객 이름이 나오도록 한다

select *
from (select id, sum(sale_cnt) total
from tbl_test_order
group by id) a
join tbl_test_customer c
on a.id=c.id;

select c.name, a.total
from (select id, sum(sale_cnt) total
from tbl_test_order
group by id) a
join tbl_test_customer c
on a.id=c.id;

--문제
select * from tbl_test_order;
select * from tbl_test_customer;
select * from tbl_test_goods;

  --상품별 판매수량 합을 인라인뷰 (From절 뒤 서브쿼리)를 사용하여  조회하시오
  --상품코드별 판매수량 합 구하기 (인라인 뷰 만들기)
  --상품테이블과 조인하여 상품이름 나오게 하기
  
  select pcode, sale_cnt
  from tbl_test_order;
  
  select pcode, sum(sale_cnt)
  from tbl_test_order
  group by pcode;
  
  select * 
  from (
  select pcode, sum(sale_cnt) total
  from tbl_test_order
  group by pcode) a
  join tbl_test_goods g
  on a.pcode=g.pcode;
  
    select  g.pname, a.total
  from (
  select pcode, sum(sale_cnt) total
  from tbl_test_order
  group by pcode) a
  join tbl_test_goods g
  on a.pcode=g.pcode;

  
  --고객별 판매수량의 합계(인라인뷰) - 고객코드별 판매수량합계+고객테이블(조인)
  --상품별 판매수량의 합계(인라인뷰) -상품코드별 판매수량합계+상품테이블(조인)
  
  --연습문제 1 ,2,3,4
  
  --문제 1
  
  select * from emp2;
  
select name, position, pay
from emp2;

select name, position, pay
from emp2
where position='Section head';

select min(pay)
from emp2
where position='Section head';


select name, position, pay
from emp2
where pay>(select min(pay)
from emp2
where position='Section head');

--문제 2

select * from student;

select name, grade, weight
from student;

select name, grade, weight
from student
where grade=2;

select min(weight)
from student
where grade=2;

select name, grade, weight
from student
where weight < (select min(weight)
from student
where grade=2);


--문제 3
select * from emp2;
select * from dept2;

select d.dname, e.name, e.pay
from emp2 e
join dept2 d
on e.deptno=d.dcode;

select d.dname, avg(e.pay)
from emp2 e
join dept2 d
on e.deptno=d.dcode
group by d.dname;

select min (a.avg)
from (
select d.dname, avg(e.pay) avg
from emp2 e
join dept2 d
on e.deptno=d.dcode
group by d.dname) a;

select d.dname, e.name, e.pay
from emp2 e
join dept2 d
on e.deptno=d.dcode
where e.pay<(
select min (a.avg)
from (
select d.dname, avg(e.pay) avg
from emp2 e
join dept2 d
on e.deptno=d.dcode
group by d.dname) a);

--

--1번
--뷰 만들기

--create view 뷰 이름
-- as
-- select ename,deptno
--from t_emp;
select * from professor;
select * from department;

select *
from professor p
join department d
on p.deptno=d.deptno;

select p.profno, p.name,d.dname
from professor p
join department d
on p.deptno=d.deptno;

create view v_prof_dept2
as
select p.profno, p.name,d.dname
from professor p
join department d
on p.deptno=d.deptno;

--2번
select * from student;
select * from department;

select deptno1,
max(height), max(weight)
from student
group by deptno1;

select d.dname, a.max_hight, a.max_weight
from(
select deptno1,
max(height) max_hight, max(weight) max_weight
from student
group by deptno1) a
join department d
on a.deptno1=d.deptno;

--3번

select * from student;
select * from department;
--서브쿼리
select deptno1,name,height
from student;
--서브쿼리 완성
select deptno1,max(height)
from student
group by deptno1;
--서브쿼리의 학과의 가장 큰 키 학생 정보 조회


select *
from(
select deptno1,max(height) max_height
from student
group by deptno1 )a
join student b
on a.deptno1=b.deptno1 and a.max_height=b.height;

--학과별 가장 키가 큰 학생 정보 조회
select *
from(
select deptno1,max(height) max_height
from student
group by deptno1 )a
join student b
on a.deptno1=b.deptno1 and a.max_height=b.height
;

-- 학과 테이블과 조인하여 학과명 조회되도록 하기
select *
from(
select deptno1,max(height) max_height
from student
group by deptno1 )a
join student b
on a.deptno1=b.deptno1 and a.max_height=b.height
join department d
on a.deptno1=d.deptno;

select d.dname,a.max_height, b.name, b.height
from(
select deptno1,max(height) max_height
from student
group by deptno1 )a
join student b
on a.deptno1=b.deptno1 and a.max_height=b.height
join department d
on a.deptno1=d.deptno
join department d
on a.deptno1 =d.deptno;

--학생, 학과 조인 => 학생 정보, 학과명


--4번

select * from student;


select grade, name, height
from student;


select grade , avg(height)
from student
group by grade;
--
select *
from ( 
select grade , avg(height)
from student
group by grade);



--1학년중 평균값보다 큰 친구

select *
from (
select grade , avg(height)
from student
group by grade) a
join student b
on a.grade=b.grade
;

select b.grade, b.name, b.height
from ( 
select grade , avg(height)
from student
group by grade) a
join student b
on a.grade=b.grade;

select *
        from (select grade, avg(height) avg_height
                from student
                group by  grade) a
        join student b
        on a.grade = b.grade   and b.height > a.avg_height ;
        
        
        -- on : 조인의 조건
        -- where : 조인된 결과로부터 특정 조건에 맞는 것을 걸러냄


--where 뒤에 오는 서브쿼리 페이지 432
--다중행 서브쿼리
select empno, name, deptno 
from emp2
where deptno in ( select dcode from dept2 where area='Pohang Main Office');


select empno, name, deptno 
from emp2
where deptno in ( '0001','1003','1006','1007');

--다중행, 단일컬럼 서브쿼리  사용 가능 연산자 :    IN, EXISTS, >ANY, <ANY,  <ALL, >ALL

-- where 절의 서브쿼리 (다중행) ANY, ALL
select sal
from emp
where deptno=20; -- 800 2975 3000

select ename,sal from emp;

select ename, sal
from emp
where sal> any(
select sal
from emp
where deptno=20
);


select ename, sal
from emp
where sal> all(
select sal
from emp
where deptno=20
);


-- Exists 페이지 432
-- where 서브쿼리의 결과가 존재하면 메인쿼리가 실행됨

select * from t_emp;

select * from t_emp
where exists ( select deptno from t_dept where deptno = 10);


--연관서브쿼리
--비연관서브쿼리
  -- : 메인쿼리와 상관없이 서브쿼리가 독립적으로 수행됨
  -- : 서브쿼리가 실행될 때 메인 쿼리의 값을 사용 안한다.
  
  --비연관서브쿼리
  --서브쿼리에서 메인쿼리의 값을 사용하지 않음
  --급여가 가장 많은 사람의 이름 조회하기
  select * from emp;
  
  select *
  from emp
  where sal =( select max(sal) from emp);
  
  --연관 서브 쿼리
  --메인 쿼리의 값을 서브 쿼리가 사용한다
  
  select * from emp;
  
  --자신의 부서의 평균보다 높은 사람 조회하기
  
  
  select * from emp e
  where e.sal > (
  
  select avg(e2.sal)
  from emp e2
  where e2.deptno = e.deptno
  
  );

  --2258
  select avg(e2.sal)
  from emp e2
  where e2.deptno = 20;
  
  --연관 서브쿼리 실행순서
  --1. 메인 쿼리의 값이 서브쿼리에 전달
  --2. 서브쿼리 실행
  --3. 메인쿼리에서 사용함
  --4. 조건에 맞으면 결과에 나옴
  
  --스칼라 서브쿼리
  --select 절의 서브쿼리
  
  select *
  from emp;
  
  
  --학과명을 select 절의 서브쿼리로 가져오기
  --스칼라서브쿼리(select 절 서브쿼리) 반드시 단일행, 단일컬럼이어야 한다
  select e.ename, e.deptno, ( 
  select d.dname from dept d where d.deptno =e.deptno)
  from emp e;
  
  --SQL -DNL DDL DCL
  -- dml (CRUD) : create, read, update, delete
  --데이터 조회하기 : select
  --데이터 추가하기 : insert
  --데이터 변경하기 : update
  --데이터 삭제하기 : delete
  
  
  
  -- acorntbl
  -- 새로운 학생 추가하기
  -- 이채민 , 임윤아
  select * from acorntbl;
  -- 데이터 추가하기
  insert into acorntbl(id, pw, name, point, birthday ) values('king','9999','이채민',999999,'2001-01-01'); --이채민
  
  -- 컬럼명을 명시하지 않을 경우
  -- 순서와 개수가 일치해야 함
  insert into acorntbl values('yoona','1234','임윤아',800,'1994-01-01');
  
  commit;
  
  --
  insert into acorntbl(id, pw, name ) values('hong','5678','홍길동'); --홍길동
  
  select * from acorntbl;
  
  -- 변경하기
  
  update acorntbl
  set point = 2500
  where id='king';
  -- 주의사항(업데이트하면 무조건 commit 한다)
  commit;
  
  
  --포인트 인상 업데이트 쿼리 실행
  --where 조건이 없으면 모든 행(레코드)에 적용됨

  update acorntbl
  set point = point+1000;
  commit;
  
  -- 삭제하기
  -- 조회하기
  select * from acorntbl;
  
  -- 홍길동 삭제하기
  
  delete 
  from acorntbl
  where id='hong';
  
  commit;
  
  select * from acorntbl;
  
  --테이블 복사하기
  --테이블 복사하기 내용없이
  --쿼리 결과로 insert하기
  
  --1)
  create table professor2
  as 
    select * from professor;
    
select * from professor2;

--2)
  create table professor3
  as 
    select * from professor
    where 1=2;

    select * from professor3;
    
--3) 조회된 결과로 insert 하기
insert into professor3
select * from professor;


  
  --5번은 내일 풀기

