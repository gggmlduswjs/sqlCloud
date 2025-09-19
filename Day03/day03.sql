

--복습 그룹바이 (그룹별 집계내기)

 select * from  emp;
 
 --그룹별집계 구하기
 --직급별 급여합 구하기
 
 
 
 --급여의 전체합계 
 
  select sal
  from  emp;
  
  

  select sum(sal)
  from  emp;
 
 
  -- 그룹바이된 결과 전단계를 만들자 
  
  select  job, sal
  from emp
  order by 1;
  
  
  
    
  select  job, sum(sal) as total
  from emp
  group by  job  
  order by 1;
 
 
 --직급별 급여합에서 특정금액 이상인거 구하기
 
  select  job, sum(sal) as total   -- select 절의   별칭(alias)은   select 절 다음부터 사용가능 
  from emp
  group by  job  
  having  sum(sal)  >=5000
  order by  total desc;
 
 
 
  select  job,  to_char(sum(sal) ,'999,999' ) as total   -- select 절의   별칭(alias)은   select 절 다음부터 사용가능 
  from emp
  group by  job  
  having  sum(sal)  >=5000
  order by  total desc;
 
 
 --문제4
 


CREATE TABLE   PROD_SALES(
CUST_NM         VARCHAR2(13)  ,
PRD_ID             VARCHAR2(5) ,
SALES_AMT       NUMBER(10)      
);
COMMIT;

INSERT INTO   PROD_SALES   VALUES ('LEE', 546 , 3000);
INSERT INTO   PROD_SALES   VALUES ('KIM', 326 , 4780);
INSERT INTO   PROD_SALES   VALUES ('KANG', 564 , 87900);
INSERT INTO   PROD_SALES   VALUES ('KWON', 556 , 45478);
INSERT INTO   PROD_SALES   VALUES ('KIM', 254 , 3000);
INSERT INTO   PROD_SALES   VALUES ('YOO', 567 , 78900);
INSERT INTO   PROD_SALES   VALUES ('PARK', 877 , 89787);
INSERT INTO   PROD_SALES   VALUES ('LEE', 890 , 10000);
INSERT INTO   PROD_SALES   VALUES ('KIM', 787 , 2341);
INSERT INTO   PROD_SALES   VALUES ('PARK', 566 , 50000);


commit;
select * from PROD_SALES;


--구매횟수가 두번이상인 고객 조회하기 
select * from PROD_SALES;

select  cust_nm  
from PROD_SALES;


select  cust_nm , count(*) 
from PROD_SALES
group by cust_nm;


select cust_nm,sales_amt
from  PROD_SALES
order by 1;



select cust_nm, count(sales_amt)
from  PROD_SALES
group by  cust_nm 
order by 1;


select cust_nm, count(cust_nm)
from  PROD_SALES
group by  cust_nm 
order by 1;

-- 
select cust_nm, count(cust_nm)
from  PROD_SALES
group by  cust_nm
having  count(cust_nm) >=2 
order by 1;



-- 구매금액이 7만원 이상 고객조회   select ( read)


select  cust_nm ,  sales_amt
from PROD_SALES
order by 1;


select  cust_nm ,  sum( sales_amt)
from PROD_SALES
group by cust_nm ;
 

select  cust_nm ,  sum( sales_amt)
from PROD_SALES
group by cust_nm 
having   sum( sales_amt)  >=70000;




select  cust_nm ,   to_char( sum( sales_amt) ,'999,999')||'원'
from PROD_SALES
group by cust_nm 
having   sum( sales_amt)  >=70000;




-- 조인연습디비 
create table tbl_test_customer(
    id varchar2(20) not null primary key ,
    name varchar2(20) ,
    address varchar2(20),
    tel varchar2(20)
);

create table tbl_test_goods(
  pcode varchar2(20) not null primary key,
  pname varchar(20) ,
  price number(4)
);

create table tbl_test_order(
  ocode varchar2(20) not null primary key,
  odate date,
  id varchar2(20),
 pcode varchar2(20),
 sale_cnt number(6)
);



insert into tbl_test_customer values( 'H001' ,'이대훈', '라스베가스', '010-3030-2222');
insert into tbl_test_customer values( 'H002' ,'유승재', 'L.A', '010-2424-2222');
insert into tbl_test_customer values( 'H003' ,'최성원', '워싱턴D.C', '010-1010-2121');
insert into tbl_test_customer values( 'H004' ,'정지원', '뉴욕', '010-3333-2222');
insert into tbl_test_customer values( 'H005' ,'전희연', '텍사스', '010-9090-2222');
insert into tbl_test_customer values( 'H006' ,'김현희', '서울', '010-7878-1234');


 


insert into tbl_test_goods values('P001' ,'쫀드기', 1000);
insert into tbl_test_goods values('P002' ,'눈깔사탕', 100);
insert into tbl_test_goods values('P003' ,'아폴로', 200);
insert into tbl_test_goods values('P004' ,'뻥튀기', 2000);



insert into tbl_test_order values('J001' , '20210110' , 'H001', 'P001', 2);
insert into tbl_test_order values('J002' , '20210110' , 'H002', 'P002', 5);
insert into tbl_test_order values('J003' , '20210110' , 'H003', 'P003', 2);
insert into tbl_test_order values('J004' , '20210110' , 'H004', 'P004', 1);
insert into tbl_test_order values('J005' , '20210110' , 'H005', 'P002', 3);
insert into tbl_test_order values('J006' , '20210110' , 'H001', 'P002', 3);
insert into tbl_test_order values('J007' , '20210110' , 'H002', 'P001', 1);
insert into tbl_test_order values('J008' , '20210110' , 'H001', 'P002', 4);
 

commit;

select * from tbl_test_customer;
select * from  tbl_test_goods;
select * from  tbl_test_order;



--주문현황 조회  ( 주문일자, 주문수량, 고객명)

select * 
from tbl_test_order   o
join tbl_test_customer  c
on o.id  = c.id;



select o.odate,   o.sale_cnt, c.name 
from tbl_test_order   o
join tbl_test_customer  c
on o.id  = c.id;

--고객별 판매수량의 합을 구하시오 



select c.name  ,  o.sale_cnt 
from tbl_test_order   o
join tbl_test_customer  c
on o.id  = c.id;



select c.name  ,   sum(o.sale_cnt )
from tbl_test_order   o
join tbl_test_customer  c
on o.id  = c.id
group by  c.name ;


select c.name  ,   sum(o.sale_cnt )
from tbl_test_order   o
join tbl_test_customer  c
on o.id  = c.id
group by  c.name 
having   sum(o.sale_cnt ) >=3;



--
select * from tbl_test_customer;
select * from  tbl_test_goods;
select * from  tbl_test_order;

--주문현황조회하기 ( 주문일자,  주문수량, 회원명, 회원전화번호 )

--1.조인하기
select *
from tbl_test_order  o
join tbl_test_customer  c
on  o.id = c.id;


--2.원하는것 고르기
select o.odate , o.sale_cnt,  c.name, c.tel
from tbl_test_order  o
join tbl_test_customer  c
on  o.id = c.id;


--3.고객별 주문수량합계 구하기  ( 그룹바이 전단계 만들기)

select    c.name , o.sale_cnt
from tbl_test_order  o
join tbl_test_customer  c
on  o.id = c.id
order by 1;


-- 4.고객별 주문수량합계 구하기 ( 그룹바이 )
select    c.name , sum( o.sale_cnt)
from tbl_test_order  o
join tbl_test_customer  c
on  o.id = c.id
group by    c.name;
 
 
 -- 5. 고객별  주문수량합계가 5개이상만 조호하기
select    c.name , sum( o.sale_cnt)
from tbl_test_order  o
join tbl_test_customer  c
on  o.id = c.id
group by    c.name
having  sum( o.sale_cnt) >=5;
 
 
 -- 6.정렬
 select    c.name , sum( o.sale_cnt)
from tbl_test_order  o
join tbl_test_customer  c
on  o.id = c.id
group by    c.name
having  sum( o.sale_cnt) >=5
order by 2 desc;


-- 문제   주문현황조회하기 ( 주문날짜, 주문수량, 상품이름, 상품단가, 주문금액)

select * from tbl_test_order;
select * from tbl_test_goods;

select *
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode;

select 
    o.odata, o.sale_cnt, g.pname, g.price, 
    to_char(o.sale_cnt* g.price,'999,999') as amount
from tbl_test_order o
join tbl_test_goods g
on o.pcode=g.pcode;



-- 문제   상품별 판매금액 합계구하기
select 
     g.pname, 
    to_char(o.sale_cnt* g.price,'999,999') as amount
from tbl_test_order o
join tbl_test_goods g
on o.pcode=g.pcode
order by 1;

select 
    g.pname, 
    sum(o.sale_cnt* g.price)
from tbl_test_order o
join tbl_test_goods g
on o.pcode=g.pcode
group by g.pname
order by 1;

select 
    g.pname, 
    to_char(sum(o.sale_cnt* g.price),'999,999') as amount
from tbl_test_order o
join tbl_test_goods g
on o.pcode=g.pcode
group by g.pname
having sum(o.sale_cnt* g.price) >=2000
order by 1;

--주문조회 (주문일자, 주문수량, 고객명, 상품명, 상품단가)
--주문테이블
--고객테이블
--상품테이블

select  * from tbl_test_order;
select * from tbl_test_customer;
select * from tbl_test_goods;


select * 
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
join tbl_test_goods g
on o.pcode=g.pcode;

select o.odate, o.sale_cnt, c.name, g.pname, g.price
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
join tbl_test_goods g
on o.pcode=g.pcode;

select o.odate, o.sale_cnt, c.name, g.pname, g.price, o.sale_cnt*g.price
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
join tbl_test_goods g
on o.pcode=g.pcode;

--고객별 제품별 판매수량
--고객, 제품, 수량
select c.name, g.pname, o.sale_cnt
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
join tbl_test_goods g
on o.pcode=g.pcode;

select c.name, g.pname, sum( o.sale_cnt)
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
join tbl_test_goods g
on o.pcode=g.pcode
group by c.name, g.pname
order by 1;

--1) 주문정보조회 하기(주문일자, 주문수량, 고객명, 고객전화번호)
select * from tbl_test_order; 
select * from tbl_test_customer;
select * from tbl_test_goods;

select o.odate, o.sale_cnt, c.name, c.tel
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id;



--2) 주문정보조회하기(주문일자, 주문수량, 상품명, 상품단가, 주문금액)
select o.odate, o.sale_cnt, g.pname, g.price, sale_cnt*g.price
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
join tbl_test_goods g
on o.pcode=g.pcode;

--3) 주문정보조회하기(주문일자, 주문수량, 고객명, 상품명, 주문금액)
select o.odate, o.sale_cnt, c.name, g.pname, sale_cnt*g.price
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
join tbl_test_goods g
on o.pcode=g.pcode;

--1) 고객별 주문수량의 합계 구하기
select  c.name , sum(o.sale_cnt)
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
join tbl_test_goods g
on o.pcode=g.pcode
group by c.name 
order by 1;

--2) 상품별 주문금액의 합계 구하기


select   g.pname,  g.price*sale_cnt 
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
join tbl_test_goods g
on o.pcode=g.pcode; 




select   g.pname,  sum( g.price*sale_cnt )
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
join tbl_test_goods g
on o.pcode=g.pcode
group by g.pname;



--3) 고객별 상품별 주문수량의 합계 구하기
select c.name,g.pname,sum(o.sale_cnt)
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
join tbl_test_goods g
on o.pcode=g.pcode
group by g.pname,c.name;




--4) 고객별 상품별 주문금액의 합계 구하기
select   c.name,g.pname,o.sale_cnt,  g.price*o.sale_cnt 
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
join tbl_test_goods g
on o.pcode=g.pcode; 

select   c.name,g.pname,sum(o.sale_cnt),sum(g.price*o.sale_cnt )
from tbl_test_order o
join tbl_test_customer c
on o.id=c.id
join tbl_test_goods g
on o.pcode=g.pcode
group by g.pname,c.name
order by 1;


-- 교재) 233 페이지   사용예2
select * from student;
select * from professor;
select * from department;

select s.name, p.name
from student s
join professor p
on s.profno=p.profno;


-- 교재) 234 페이지   사용예3
select s.name, d.dname, p.name
from student s
join professor p
on s.profno=p.profno
join department d
on s.deptno1=d.deptno;


-- 교재) 254 페이지   연습문제1
select * from student;
select * from department;

select s.name, d.deptno, d.dname
from student s
join department d
on s.deptno1=d.deptno;


--DECODE를 활용하여 열로 조회하기
--직
