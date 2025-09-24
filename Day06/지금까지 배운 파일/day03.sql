

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

select * from  tbl_test_order;
select * from  tbl_test_goods;


select * 
from  tbl_test_order   o
join  tbl_test_goods   g
on  o.pcode = g.pcode;



select o.odate, o.sale_cnt, g.pname, g.price  ,  o.sale_cnt* g.price
from  tbl_test_order   o
join  tbl_test_goods   g
on  o.pcode = g.pcode;



select
    o.odate, o.sale_cnt, g.pname, g.price  , 
    to_char( o.sale_cnt* g.price ,'999,999' ) as amount
from  tbl_test_order   o
join  tbl_test_goods   g
on  o.pcode = g.pcode;

-- 문제   상품별 판매금액 합계구하기


select
     g.pname, 
     to_char( o.sale_cnt* g.price ,'999,999' ) as amount
from  tbl_test_order   o
join  tbl_test_goods   g
on  o.pcode = g.pcode
order by 1;



select
     g.pname, 
     sum(o.sale_cnt* g.price  )
from  tbl_test_order   o
join  tbl_test_goods   g
on  o.pcode = g.pcode
group by  g.pname
order by 1;





select
     g.pname, 
     sum(o.sale_cnt* g.price  )
from  tbl_test_order   o
join  tbl_test_goods   g
on  o.pcode = g.pcode
group by  g.pname
having  sum(o.sale_cnt* g.price  ) >=2000
order by 1;


--

select
     g.pname, 
     to_char( sum(o.sale_cnt* g.price  )  ,'999,999') as amount
from  tbl_test_order   o
join  tbl_test_goods   g
on  o.pcode = g.pcode
group by  g.pname
having  sum(o.sale_cnt* g.price  ) >=2000
order by 1;

--주문조회 (주문일자, 주문수량, 고객명,  상품명, 상품단가)
--주문테이블
--고객테이블
--상품테이블 

select * from tbl_test_order;
select * from  tbl_test_customer;
select * from  tbl_test_goods;


select * 
from tbl_test_order  o
join tbl_test_customer  c
on o.id  = c.id
join tbl_test_goods  g
on o.pcode = g.pcode;




select o.odate, o.sale_cnt, c.name, g.pname, g.price 
from tbl_test_order  o
join tbl_test_customer  c
on o.id  = c.id
join tbl_test_goods  g
on o.pcode = g.pcode;




select o.odate, o.sale_cnt, c.name, g.pname, g.price  ,  o.sale_cnt* g.price
from tbl_test_order  o
join tbl_test_customer  c
on o.id  = c.id
join tbl_test_goods  g
on o.pcode = g.pcode;


--고객별 제품별 판매수량
--고객, 제품, 수량
select   c.name, g.pname,o.sale_cnt 
from tbl_test_order  o
join tbl_test_customer  c
on o.id  = c.id
join tbl_test_goods  g
on o.pcode = g.pcode;



select   c.name, g.pname, sum(o.sale_cnt )
from tbl_test_order  o
join tbl_test_customer  c
on o.id  = c.id
join tbl_test_goods  g
on o.pcode = g.pcode
group by c.name, g.pname
order by 1;
-- equal inner조인 (조건이 같은거,  양쪽 모두 존재하는 경우만 조회되는것을 말한다)
-- 주문하지 않은 김현희 고객은 조회결과에 나오지 않음

--1)주문정보조회 하기 ( 주문일자, 주문수량, 고객명 , 고객전화번호)
--2)주문정보조회 하기( 주문일자, 주문수량,  상품명, 상품단가, 주문금액)
--3)주문정보조회 하기( 주문일자, 주문수량, 고객명, 상품명, 주문금액)

--1) 고객별 주문수량의 합계 구하기
--2) 상품별 주문금액의 합계 구하기
--3) 고객별상품별 주문수량의 합계 구하기
--4) 고객별상품별 주문금액의 합계 구하기
-- 교재) 233 페이지   사용예2
-- 교재) 234 페이지   사용예3
-- 교재) 254 페이지   연습문제 1번만

 select * from student;
 select * from professor;


select * 
from student s
join professor p
on s.profno   = p.profno;





select s.name, p.name
from student s
inner join professor p
on s.profno   = p.profno;



--outer  join
--일치하지 않은 데이터가 함께 조회하려면 outer 조인을 사용해야 한다
--left, right 
select s.name, p.name
from student s
left outer join professor p
on s.profno   = p.profno;





--254 1번

select * from student;
select * from department;

select * 
from student s  
join  department  d
on  s.deptno1 = d.deptno;



select s.name, d.dname
from student s  
join  department  d
on  s.deptno1 = d.deptno;


--decode함수 (같은조건일때 특정값을 처리하는 것)

select * from member_tbl_11;

--01 -> vip ,  02-> gold   03-> silver
--조건에 없는것은   null로 나옴
select m_grade , 
decode( m_grade , '01', 'vip','02','gold' ,'03','silver' , '미정')
from member_tbl_11;
 

-- decode함수를 이용하여 emp테이블의 직급별 사원수 구하기 (열 방향으로)
-- clerk   manager  salesman   president  analyst
--   3        3        4          1          1
select * from emp;
select job from emp;

select job , count(*)
from emp
group by job;

select  count(job)
from emp;

select   job 
from emp;


select  decode(job,'CLERK' ,9)
from emp;




select  count( decode(job,'CLERK' ,9)) as ckerk
from emp;


-- clerk, manager
select job, decode(job,'CLERK' ,9),
            decode( job, 'MANAGER', 9),
            decode( job,  'SALESMAN',9),
            decode( job, 'ANALYST',9),
            decode( job, 'PRESIDENT', 9)
from emp;


--조인연습하기
--1) 오디션 관리 프로그램
--2) 한양CU
--3) 배디민턴 
  



select     count( decode(job,'CLERK' ,9))  clerk,
           count( decode( job, 'MANAGER', 9))  manager,
           count(  decode( job,  'SALESMAN',9))   salesman,
           count(decode( job, 'ANALYST',9))  analyst,
           count( decode( job, 'PRESIDENT', 9)) president
from emp;


create table tbl_join_200(
  join_id varchar2(4)  not null primary key ,
  join_nm varchar2(20)  ,
  birth  char(8),
  gender char(1),
  specialty varchar2(1),
  charm varchar2(30)
);

insert into tbl_join_200 values( 'A001' , '케이쥬',  '20050102' , 'M', 'D', '깜찍댄스');
insert into tbl_join_200 values( 'A002' , '고키',  '20090102' , 'M', 'D', '동전마술');
insert into tbl_join_200 values( 'A003' , '나윤서',  '20070102' , 'M', 'D', '창작댄스');
insert into tbl_join_200 values( 'A004' , '장현수',  '20030103' , 'M', 'R', '보컬');
insert into tbl_join_200 values( 'A005' , '윤민',  '20020205' , 'M', 'V', '자작곡');



--멘토테이블 

create table tbl_mentor_200(
    mentor_id varchar2(4) not null primary key ,
    mentor_nm varchar2(20)
);

insert into tbl_mentor_200 values( 'J001', '박진영');
insert into tbl_mentor_200 values( 'J002', '박재상');
insert into tbl_mentor_200 values( 'J003', '보아');



create table tbl_score_200(
  score_no  number(6) not null ,
  artistid varchar2(4) not null,
  mentorid varchar2(4) not null,
  score number(3),
  primary key( score_no, artistid, mentorid)
);

insert into tbl_score_200 values( 110001, 'A001', 'J001' , 80);
insert into tbl_score_200 values( 110002, 'A001', 'J002' , 90);
insert into tbl_score_200 values( 110003, 'A001', 'J003' , 70);
insert into tbl_score_200 values( 110004, 'A002', 'J001' , 60);
insert into tbl_score_200 values( 110005, 'A002', 'J002' , 50);
insert into tbl_score_200 values( 110006, 'A002', 'J003' , 70);
insert into tbl_score_200 values( 110007, 'A003', 'J001' , 80);
insert into tbl_score_200 values( 110008, 'A003', 'J002' , 60);
insert into tbl_score_200 values( 110009, 'A003', 'J003' , 70);
insert into tbl_score_200 values( 110010, 'A004', 'J001' , 80);
insert into tbl_score_200 values( 110011, 'A004', 'J002' , 78);
insert into tbl_score_200 values( 110012, 'A004', 'J003' , 89);
insert into tbl_score_200 values( 110013, 'A005', 'J001' , 62);
insert into tbl_score_200 values( 110014, 'A005', 'J002' , 91);
insert into tbl_score_200 values( 110015, 'A005', 'J003' , 67);
 commit;
  
 create table goods_tbl_500(
goods_cd varchar2(6) not null primary key, 
goods_nm varchar2(30), 
goods_price number(8), 
cost number(8), in_date date
); 


insert into goods_tbl_500 values('110001','육계장사발면',1050,750,'20190302');
insert into goods_tbl_500 values('110002','단팥빵',1300,800,'20190302'); 
insert into goods_tbl_500 values('110003','사브로',2000,1700,'20190302');
insert into goods_tbl_500 values('110004','칠성사이다',900,750,'20190302'); 
insert into goods_tbl_500 values('110005','콜라',750,300,'20190302'); 
insert into goods_tbl_500 values('110006','아몬드초콜릿',1500,1300,'20190302'); 
insert into goods_tbl_500 values('110007','초코몽',850,600,'20190302');


 create table store_tbl_500(
 store_cd varchar2(5) not null primary key,
 store_nm varchar2(20), 
 store_fg varchar2(1)
);

 insert into store_tbl_500 values('A001','노원점','0');
 insert into store_tbl_500 values('A002','마포점','0'); 
insert into store_tbl_500 values('A003','석계점','0'); 
insert into store_tbl_500 values('B001','하계점','1');
 insert into store_tbl_500 values('C001','상계점','1'); 
insert into store_tbl_500 values('D001','중계점','0');
 insert into store_tbl_500 values('D002','태릉입구점','1'); 
insert into store_tbl_500 values('E001','화랑대점','0');


 create table sale_tbl_500(
 sale_no varchar2(4) not null primary key, 
 sale_ymd date not null,
 sale_fg varchar2(1) not null, 
 store_cd varchar2(5)  ,         
 goods_cd varchar2(6) ,
 sale_cnt number(3),
 pay_type varchar2(2),
 constraint  fk1 foreign key (store_cd)  references store_tbl_500(store_cd),
 constraint  fk2  foreign key (goods_cd) references goods_tbl_500(goods_cd)
); 

insert into sale_tbl_500 values('0001','20190325','1','A001','110001',2,'02'); 
insert into sale_tbl_500 values('0002','20190325','1','B001','110003',2,'02');
 insert into sale_tbl_500 values('0003','20190325','1','D001','110003',1,'01'); 
insert into sale_tbl_500 values('0004','20190325','1','A001','110006',5,'02'); 
insert into sale_tbl_500 values('0005','20190325','1','C001','110003',2,'02'); 
insert into sale_tbl_500 values('0006','20190325','2','C001','110003',2,'02');
 insert into sale_tbl_500 values('0007','20190325','1','A002','110005',4,'02');
 insert into sale_tbl_500 values('0008','20190325','1','A003','110004',4,'02');
 insert into sale_tbl_500 values('0009','20190325','1','B001','110001',2,'01');
 insert into sale_tbl_500 values('0010','20190325','1','A002','110006',1,'02');

commit;
 
 
 create table tbl_court_202301(
court_no varchar2(4) not null primary key,
use char(1)
);
insert into tbl_court_202301 values('C001','N');
insert into tbl_court_202301 values('C002','N');
insert into tbl_court_202301 values('C003','N');
insert into tbl_court_202301 values('C004','N');
insert into tbl_court_202301 values('C005','N');
insert into tbl_court_202301 values('C006','N');
insert into tbl_court_202301 values('C007','N');
insert into tbl_court_202301 values('C008','N');
insert into tbl_court_202301 values('C009','N');

create table tbl_resv_202301(
resv_no char(8) not null primary key,
resv_date char(8),
cust_no varchar2(4),
court_no varchar2(4)
);
insert into tbl_resv_202301 values('20230001','20230221','1001','C005');
insert into tbl_resv_202301 values('20230002','20230221','1002','C004');
insert into tbl_resv_202301 values('20230003','20230221','1003','C003');
insert into tbl_resv_202301 values('20230004','20230221','1004','C002');
insert into tbl_resv_202301 values('20230005','20230221','1005','C001');
insert into tbl_resv_202301 values('20230006','20230221','1005','C001');
insert into tbl_resv_202301 values('20230007','20230221','1005','C001');

create table tbl_cust_202301(
cust_no varchar2(4) not null primary key,
cust_name varchar2(10),
tel varchar2(11)
);

insert into tbl_cust_202301 values('1001','김선수','01011112222');
insert into tbl_cust_202301 values('1002','이선수','01011113333');
insert into tbl_cust_202301 values('1003','박선수','01011114444');
insert into tbl_cust_202301 values('1004','한선수','01011115555');
insert into tbl_cust_202301 values('1005','채선수','01011116666');

 commit;
 

select  *
from tbl_resv_202301  r
join  tbl_cust_202301 c
on r.cust_no = c.cust_no;


select  c.cust_no,  c.cust_name 
from tbl_resv_202301  r
join  tbl_cust_202301 c
on r.cust_no = c.cust_no;


select  c.cust_no,  c.cust_name  , count(*)
from tbl_resv_202301  r
join  tbl_cust_202301 c
on r.cust_no = c.cust_no
group by c.cust_no,  c.cust_name;
