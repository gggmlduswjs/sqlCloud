 
--오디션프로그램
HY 라운드(LOUD) 오디션프로그램 


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



멘토테이블 

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

 
 
--한양 CU

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

 



--배디민턴 
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
--






select * from  tbl_join_200;
select * from  tbl_mentor_200;
select * from  tbl_score_200;


--1) 참가자 조회

select * from  tbl_join_200;


select  join_id,   join_nm, birth, gender, specialty , charm
from  tbl_join_200;




select   decode( gender ,  'M', '남성', 'F','여성')
from  tbl_join_200;





select  specialty ,  decode( specialty ,'V' ,'보컬', 'D', '댄스' , 'R','랩'  )
from  tbl_join_200;

-- to_char() 함수는    문자가 아닌것들이 사용할 수 있다,  날짜, 숫자  -> 문자로 변환해 주세요 , 문자 -> 문자로 변환 불가

--select  to_char(birth ,'yyyy-mm-dd')
--from  tbl_join_200;

select    birth 
from tbl_join_200;

-- 1. 문자로된 날짜를 날짜형식으로 바꾸기
-- 2.  to_char 로 원하는 형식 (날짜포멧)으로 to_char 사용하기


select   to_char( to_date(birth,'yyyymmdd')  , 'yyyy-mm-dd')
from tbl_join_200;


select   to_char( to_date(birth,'yyyymmdd')  , 'yyyy"년"mm"월"dd"일"')
from tbl_join_200;



select join_id, join_nm, 
to_char( to_date(birth,'yyyymmdd')  , 'yyyy"년"mm"월"dd"일"') as birth ,
decode( gender ,  'M', '남성', 'F','여성') as gender,
decode( specialty ,'V' ,'보컬', 'D', '댄스' , 'R','랩'  )  as specialty
from  tbl_join_200;



-- 2번  점수조회하기 


select * from  tbl_join_200;
select * from  tbl_mentor_200;
select * from  tbl_score_200;


-- 중심테이블을 기준 시작하자  (외래키를 가지고 있는 테이블) , 비지니스의 핵심테이블 찾기 
select * 
from  tbl_score_200  s  
join tbl_join_200  j
on s.artistid = j.join_id
join tbl_mentor_200    m
on  s.mentorid  = m.mentor_id;


select 
s.score_no  ,
s.artistid ,
j.join_nm   ,
 to_char( to_date(j.birth ,'yyyymmdd')  ,'yyyy"년"mm"월"dd"일"' )  as birth , 
s.score , 
case when  s.score >= 90 then 'A' 
                      when  s.score>=80  then'B'
                      when  s.score>=70  then 'C'
                      else   'F'
                 end    as  grade  
, m.mentor_nm
from  tbl_score_200  s  
join tbl_join_200  j
on s.artistid = j.join_id
join tbl_mentor_200    m
on  s.mentorid  = m.mentor_id;



select  score ,  case when  score >= 90 then 'A' 
                      when  score>=80  then'B'
                      when  score>=70  then 'C'
                      else   'F'
                 end   
from  tbl_score_200  s ; 


select  score ,  case when  score >= 90 then 'A' 
                      when  score>=80  then'B'
                      when  score>=70  then 'C'
                      else   'F'
                 end    as  grade
from  tbl_score_200  s ; 
 
 
 
 -- 3번 문제 참가자 별 종합, 평균, print_table 등수 조회
 --참여할 테이블 확인하기
 --점수테이블
 --참가자 테이블


select * from  tbl_join_200;
select * from  tbl_mentor_200;
select * from  tbl_score_200;

select s.artistid, j.join_nm, s.score
from
tbl_score_200 s
join tbl_join_200 j
on s.artistid = j.join_id;

--참가자 점수 현황

select s.artistid, j.join_nm, s.score
from
tbl_score_200 s
join tbl_join_200 j
on s.artistid = j.join_id;

select s.artistid, j.join_nm, sum( s.score)
from
tbl_score_200 s
join tbl_join_200 j
on s.artistid = j.join_id
group by s.artistid, j.join_nm ;

--

select s.artistid, j.join_nm, sum( s.score),avg(s.score)
from
tbl_score_200 s
join tbl_join_200 j
on s.artistid = j.join_id
group by s.artistid, j.join_nm ;


select s.artistid, j.join_nm, 
sum( s.score)as sum,
round(avg(s.score),2)as avg,
rank() over(order by sum(s.score) desc)
from
tbl_score_200 s
join tbl_join_200 j
on s.artistid = j.join_id
group by s.artistid, j.join_nm ;

--join , subquery, 관계설정( 1:1 , 1:다, 다:다 )

--inner 조인(기본), equal(equi 조인)
--한양 

--
select * from goods_tbl_500;
select * from store_tbl_500;
select * from sale_tbl_500;

--1) 상품목록
-- 참여할 테이블 확인하기
select * 
from goods_tbl_500;

select goods_cd,
       good_nm,
       to_char(goods_price,'999,999'),
       to_char(cost,'999.999'),
       to_char(in_date,'yyyy-mm-dd')
from goods_tbl_500;

--2 제품별 매출 현황

--참여할 테이블 확인하기
--매출 테이블 판매 수량(점포 코드, 상품 코드)
--점포 테이블(점포 이름)
--상품 테이블(상품 가격)


select *
from sale_tbl_500 o
join goods_tbl_500 g
on o.goods_cd=g.goods_cd;


select *
from sale_tbl_500 o
join goods_tbl_500 g
on o.goods_cd=g.goods_cd
join store_tbl_500 s
on o.store_cd=s.store_cd;

--관심 있는 거 select
select s.store_nm, o.sale_cnt*g.goods_price
from sale_tbl_500 o
join goods_tbl_500 g
on o.goods_cd=g.goods_cd
join store_tbl_500 s
on o.store_cd=s.store_cd;

--점포별 판매현황(그룹바이 전단계 만들기)

select s.store_nm, sum(o.sale_cnt*g.goods_price)
from sale_tbl_500 o
join goods_tbl_500 g
on o.goods_cd=g.goods_cd
join store_tbl_500 s
on o.store_cd=s.store_cd
group by s.store_nm;


-- 판매 금액 천단위 구분기호 
select s.store_nm, 
to_char(sum(o.sale_cnt*g.goods_price),'999,999') as total
from sale_tbl_500 o
join goods_tbl_500 g
on o.goods_cd=g.goods_cd
join store_tbl_500 s
on o.store_cd=s.store_cd
group by s.store_nm;
order by 2;
--order by 2 total desc;

--as 애리아스 추가
select s.store_nm, 
to_char(sum(o.sale_cnt*g.goods_price),'999,999') as total
from sale_tbl_500 o
join goods_tbl_500 g
on o.goods_cd=g.goods_cd
join store_tbl_500 s
on o.store_cd=s.store_cd
group by s.store_nm;
order by 2;

--현금 카드 전체

select  s.store_nm   , o.sale_cnt  * g.goods_price   ,
o.pay_type, 
decode(o.pay_type,'01', o.sale_cnt*g.goods_price,0),
decode(o.pay_type,'02', o.sale_cnt*g.goods_price,0)
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd;

--그룹바이 전단계

select  s.store_nm 
decode(o.pay_type,'01', o.sale_cnt*g.goods_price,0),
decode(o.pay_type,'02', o.sale_cnt*g.goods_price,0),
o.sale_cnt  * g.goods_price   
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd;


--

select  s.store_nm 
sum(decode(o.pay_type,'01', o.sale_cnt*g.goods_price,0)),
sum(decode(o.pay_type,'02', o.sale_cnt*g.goods_price,0)),
sum(o.sale_cnt  * g.goods_price)   
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd
group by s.store_nm;

--맬리아스 정렬 표시형식
select  s.store_nm 
to_char(sum(decode(o.pay_type,'01', o.sale_cnt*g.goods_price,0)),'999,999') as cash,
to_char(sum(decode(o.pay_type,'02', o.sale_cnt*g.goods_price,0)),'999,999') as card,
to_char(sum(o.sale_cnt  * g.goods_price),'999,999')   as total
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd
group by s.store_nm
order by 1;

--select절은 order by에서 사용 가능하다( 실행 순서와 관계 있음)

--3)점 판매현황( 특정 점 조회하기)
--판매테이블
--상품테이블

select * from goods_tbl_500;
select * from store_tbl_500;
select * from sale_tbl_500;

select *
from sale_tbl_500 s
join goods_tbl_500 g
on s.goods_cd = g.goods_cd;

--판매되지 않는 상품은 조인 결과에 나오지 않음 ( inner 조인)

select *
from sale_tbl_500 s
join goods_tbl_500 g
on s.goods_cd = g.goods_cd;

select s.sale_fg, s.sale_no, s.sale_ymd, g.goods_nm, s.sale_cnt, s.sale_cnt*g.goods_price, s.pay_type
from sale_tbl_500 s
join goods_tbl_500 g
on s.goods_cd = g.goods_cd;

select s.sale_fg, s.sale_no, s.sale_ymd, g.goods_nm, s.sale_cnt, s.sale_cnt*g.goods_price, 
decode(s.pay_type, '01','현금','02','카드')
from sale_tbl_500 s
join goods_tbl_500 g
on s.goods_cd = g.goods_cd;

--특정점 조회하기
--A001점 보여주기 (where 절 추가하기)

select s.sale_fg, s.sale_no, s.sale_ymd, g.goods_nm, s.sale_cnt, s.sale_cnt*g.goods_price, 
decode(s.pay_type, '01','현금','02','카드')
from sale_tbl_500 s
join goods_tbl_500 g
on s.goods_cd = g.goods_cd
where s.store_cd='A001' ;


--배드민턴
select * from tbl_court_202301;
select * from tbl_resv_202301;
select * from tbl_cust_202301;

--참여할 테이블
--예약 테이블 tbl_resv_202301
--고객 테이블 tbl_cust_202301

select * 
from tbl_resv_202301 r
join tbl_cust_202301 c
on r.cust_no =c.cust_no;

-- 그룹바이 전단계
select r.cust_no, c.cust_name
from tbl_resv_202301 r
join tbl_cust_202301 c
on r.cust_no =c.cust_no;

--그룹바이 수행
select r.cust_no, c.cust_name, count(*)
from tbl_resv_202301 r
join tbl_cust_202301 c
on r.cust_no =c.cust_no
group by r.cust_no, c.cust_name;

--선행(그룹 바이가 되어야 한다)
--그룹 바이된 결과에 중간집계 구하기
--rollup()

--
select * from tbl_test_order;
select * from tbl_test_goods;
select * from tbl_test_customer;

--상품별 판매수량 합 구하기
select * from tbl_test_order;

select pcode, sale_cnt
from tbl_test_order;

select o.pcode, o.sale_cnt, g.pname
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode;

select o.pcode, o.sale_cnt, g.pname
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode;

select o.pcode, o.sale_cnt, g.pname
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode
order by 1;


select o.pcode, g.pname,sum(o.sale_cnt)
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode
group by o.pcode, g.pname;

--중간에 합계를 구하고 싶으면 rollup
select o.pcode, g.pname,sum(o.sale_cnt)
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode
group by rollup( o.pcode, g.pname);

--rollup, 그룹바이된 상태에서 중간 합계를 만들 때 사용한다. 단독으로 사용되지 않는다


select 
nvl(o.pcode, '전체합계'),
nvl( g.pname,'소계'),
sum(o.sale_cnt)
from tbl_test_order o
join tbl_test_goods g
on o.pcode = g.pcode
group by rollup( o.pcode, g.pname);

--167페이지
select * 
from emp;

--부서별 직급별 급여합계
--그룹바이 전 단계

select deptno, job, sal
from emp
order by 1;

--그룹바이 실행
--부서별 직급별 급여 합 구하기
select deptno, job, sum( sal)
from emp
group by  deptno, job
order by 1;

--부서별 중간 소계 내기
--rollup 추가하기
select deptno, job, sum( sal)
from emp
group by rollup( deptno, job)
order by 1;

--부서별

desc emp;

select 
nvl(to_char(deptno),'전체합계'),  --deptno 숫자컬럼이기 때문에 '전체합계'라는 문자가 적용이 안됨)
job,                             -- to_char로 변환 후 사용
sum( sal)
from emp
group by rollup( deptno, job)
order by 1;

-- 이번에는 직급별
select 
nvl(to_char(deptno),'전체합계'),  --deptno 숫자컬럼이기 때문에 '전체합계'라는 문자가 적용이 안됨)
job,                             -- to_char로 변환 후 사용
sum( sal)
from emp
group by rollup( job,deptno)
order by 1;


--205페이지 누적 구하기
--sum() over() : 누적합 구하기

select *
from acorntbl;

select id, name, point
from acorntbl;

--포인트 누적합
select id, name, point, sum(point) over(order by point)
from acorntbl;


select id, name, point, 
sum(point) 
over(
order by point
range between unbounded preceding and current row --기본값
)
from acorntbl;

-- 각 행을 하나로 취급하고 싶다면 range -> rows 변경 하면 됨

select id , name , point , 
sum(point) 
over(
 order by point
 rows range between unbounded preceding and current row --기본값
)
from acorntbl;

--over()
--[partition by]
--[order by]
--[range, rows])


select p_date, p_code, p_total
from panmae;


select p_date, p_code
, p_total
,sum( p_total) over (order by p_total)
from panmae
where p_store = 1000;

select p_date, p_code
, p_total
,sum( p_total) over (order by p_total)
from panmae;


select p_date, p_code
, p_total
,sum( p_total) 
 over (
 order by p_total
 rows between unbounded preceding and current row
 )
from panmae;

select p_date, p_code
, p_total
,sum( p_total) 
 over (
 order by p_total
 --rows between unbounded preceding and current row
 )
from panmae;

--전체 합계를 칼럼으로 표시하기
--sum(p_total) over() : over() 비어 있으면 전체 합계 나옴
select p_code, p_total , sum(p_total) over()
from panmae;

--emp 테이블

select *
from emp;

--누적합(처음부터 현재행까지) : partition 이 없으면 전체
select ename, job, sal, sum(sal) over(order by sal)
from emp;


--전체합
select ename, job, sal, sum(sal) over()
from emp;


--직급별 누적을 구할 때는
-- partition by 사용 (영역을 나눈다. 윈도우를 부분으로 정한다)
--
select ename, job, sal, 
sum(sal) over( 
partition by job
order by sal)
from emp;

--순위 구하기
--페이지 196

--rank() over(order by  컬럼명)
--dense_rank() over(order by 컬럼명)

--rank, dense 차이 : 동점일 경우 다음 순위를 매기는 방식이 다르다.
--row_number() over(order by 컬럼명)


--rank() over(order by  컬럼명1, 컬럼명2)

select name, point 
from acorntbl;

--동일 점수가 나올 수 있음 ( 동일 점수 이후 건너뛰고 나오게 한다)
select name, point , rank() over(order by point desc) -- 포인트가 높은 사람 순서로 순위 매김
from acorntbl;


--동일 점수가 나올 수 있음 ( 동일 점수 이후 순차적으로 나오게 한다)
select name, point , dense_rank() over(order by point desc) -- 포인트가 높은 사람 순서로 순위 매김
from acorntbl;

--동일 점수가 나오지 않는다
--동일한 점수일 때 실제 데이터가 저장된 물리적 번호 row_id를 기준으로 순위를 매김
select name, point , row_number() over(order by point desc) -- 포인트가 높은 사람 순서로 순위 매김
from acorntbl;


-- 포인트가 높은 순, 같은 포인트인 경우 생일
select name, point, birthday, rank() over(order by point desc, birthday desc)
from acorntbl;

--emp 테이블
select job, sal
from emp;

select job, sum(sal)
from emp
group by job;

select job, sum(sal) total -- total 이라는 별칭은 select 다음부터 사용가능(order by에서는 사용 가능)
from emp
group by job;


select job, sum(sal) total, rank()over( order by sum(sal) desc)
from emp
group by job;

--교재 194페이지
--lag(), lead()
--이전형, 다음행
--lag(컬럼명, 몇번째 이전, 기본값) over()
--lead(컬럼명, 몇번째 이후, 기본값) over()


select ename, sal 
from emp;

select 
ename, 
sal,
lag(sal, 1, 0) over(order by sal)
from emp;

-- 전날 대비 얼만큼 팔렸나 이런거 확인하고 싶을 때 사용
select 
ename, 
sal,
lead(sal, 1, 0) over(order by sal)
from emp;


--순위구하기
 --페이지  196
 
 --rank() over( order by    컬럼명)
 --dense_rank() over( order by 컬럼명)
 --row_number() over( order by  컬럼명)
 
  --rank() over( order by    컬럼명1, 컬럼명2)

