 
--오디션프로그램
--한양 CU
--배디민턴   풀이






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
 
 
 
 -- 3번 문제   참가자별  총합, 평균, print_table 등수 조회 
 
 -- 참여할 테이블 확인하기
 -- 점수테이블
 -- 참가자 테이블 
 
select * from  tbl_join_200;
select * from  tbl_mentor_200;
select * from  tbl_score_200;
 
 
select *
from  
tbl_score_200 s
join tbl_join_200  j
on  s.artistid  =  j.join_id ;


--참가자  점수 현황
 
select s.artistid  , j.join_nm , s.score
from  
tbl_score_200 s
join tbl_join_200  j
on  s.artistid  =  j.join_id ;




 
select s.artistid  , j.join_nm ,  sum( s.score)
from  
tbl_score_200 s
join tbl_join_200  j
on  s.artistid  =  j.join_id 
group by  s.artistid  , j.join_nm ;


--

select s.artistid  , j.join_nm ,  sum( s.score) ,  avg( s.score)
from  
tbl_score_200 s
join tbl_join_200  j
on  s.artistid  =  j.join_id 
group by  s.artistid  , j.join_nm ;


select s.artistid  , j.join_nm , 
sum( s.score)  as sum ,
round(avg( s.score) , 2) as avg
from  
tbl_score_200 s
join tbl_join_200  j
on  s.artistid  =  j.join_id 
group by  s.artistid  , j.join_nm ;




select s.artistid  , j.join_nm , 
sum( s.score)  as sum ,
round(avg( s.score) , 2) as avg,
rank() over(  order by sum( s.score)  desc )
from  
tbl_score_200 s
join tbl_join_200  j
on  s.artistid  =  j.join_id 
group by  s.artistid  , j.join_nm ;


-- join  , subquery  ,   관계설정 ( 1:1  ,  1:다, 다:다 )


--inner 조인 (기본) , equal ( equi 조인)
-- 한양    

--
select *  from   goods_tbl_500;
select *  from   store_tbl_500;
select *  from   sale_tbl_500;

--1) 상품목록
-- 참여할 테이블 확인하기

select * 
from   goods_tbl_500;


select goods_cd, 
       goods_nm,  
       to_char(goods_price ,'999,999'),
       to_char( cost ,'999,999'),
       to_char(in_date ,'yyyy-mm-dd')
from   goods_tbl_500;



--2  제품별 매출현황

-- 참여할 테이블확인하기  
-- 매출테이블  판매수량, ( 점포코드, 상품코드 )
-- 점포테이블 ( 점포이름)
-- 상품테이블 ( 상품가격)


select  *
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd;



select  *
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd;



--관심있는 거 select 
select  s.store_nm   , o.sale_cnt  * g.goods_price   ,  o.pay_type

from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd;



--  점포별 판매현황  (그룹바이 전단계 만들기)
select  s.store_nm   , o.sale_cnt  * g.goods_price   
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd;
--


select  s.store_nm   , sum( o.sale_cnt  * g.goods_price  ) 
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd
group by   s.store_nm ;


-- 판매금액  천단위 구분기호
select  s.store_nm   , 
to_char( sum( o.sale_cnt  * g.goods_price  )  ,'999,999')
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd
group by   s.store_nm ;

-- select 절  앨라이스 ,   정렬 추가 
select  s.store_nm   , 
to_char( sum( o.sale_cnt  * g.goods_price  )  ,'999,999') as  total
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd
group by   s.store_nm 
order by  2 desc ;
--order by  total desc;






-- 현금 카드  전체
select  s.store_nm   , o.sale_cnt  * g.goods_price    , o.pay_type
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd;

--
select  s.store_nm   , o.sale_cnt  * g.goods_price    , 
o.pay_type  ,
decode( o.pay_type ,'01' , o.sale_cnt  * g.goods_price  ,0),
decode( o.pay_type ,'02' , o.sale_cnt  * g.goods_price  ,0)
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd;


--  그룹바이 전단계
select  s.store_nm   ,  
decode( o.pay_type ,'01' , o.sale_cnt  * g.goods_price  ,0),
decode( o.pay_type ,'02' , o.sale_cnt  * g.goods_price  ,0),
o.sale_cnt  * g.goods_price   
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd;




--
select  s.store_nm   ,  
sum(decode( o.pay_type ,'01' , o.sale_cnt  * g.goods_price  ,0)),
sum(decode( o.pay_type ,'02' , o.sale_cnt  * g.goods_price  ,0)),
sum(o.sale_cnt  * g.goods_price   )
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd
group by   s.store_nm ;


--
select  s.store_nm   ,  
to_char(sum(decode( o.pay_type ,'01' , o.sale_cnt  * g.goods_price  ,0)) ,'999,999'),
to_char(sum(decode( o.pay_type ,'02' , o.sale_cnt  * g.goods_price  ,0)) ,'999,999'),
to_char( sum(o.sale_cnt  * g.goods_price ) ,'999,999')
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd
group by   s.store_nm ;



select  s.store_nm   ,  
to_char(sum(decode( o.pay_type ,'01' , o.sale_cnt  * g.goods_price  ,0)) ,'999,999')  as cash,
to_char(sum(decode( o.pay_type ,'02' , o.sale_cnt  * g.goods_price  ,0)) ,'999,999') as card,
to_char( sum(o.sale_cnt  * g.goods_price ) ,'999,999') as total
from sale_tbl_500 o 
join  goods_tbl_500 g
on o.goods_cd  = g.goods_cd
join store_tbl_500  s
on  o.store_cd  = s.store_cd
group by   s.store_nm 
order by  1;

--select절은   order by 에서 사용가능하다  (실행순서와 관계 있음)


--3)점  판매현황  (특정점 조회하기)
--판매테이블
--상품테이블 

select *  from   goods_tbl_500;
select *  from   store_tbl_500;
select *  from   sale_tbl_500;


select * 
from   sale_tbl_500  s
join  goods_tbl_500  g
on s.goods_cd  =  g.goods_cd;

-- 판매되지 않은 상품은 조인결과에 나오지 않음  ( inner 조인 )



select *
from   sale_tbl_500  s
join  goods_tbl_500  g
on s.goods_cd  =  g.goods_cd;




select s.sale_fg,  s.sale_no, s.sale_ymd , g.goods_nm, s.sale_cnt,   s.sale_cnt *   g.goods_price  , s.pay_type
from   sale_tbl_500  s
join  goods_tbl_500  g
on s.goods_cd  =  g.goods_cd;



select s.sale_fg,  s.sale_no, s.sale_ymd , g.goods_nm, s.sale_cnt,   s.sale_cnt *   g.goods_price  ,
decode (s.pay_type  ,'01', '현금' ,'02', '카드')
from   sale_tbl_500  s
join  goods_tbl_500  g
on s.goods_cd  =  g.goods_cd;

--특정점 조회하기 
--A001점 보여주기  (where 절 추가하기)

select s.sale_fg,  s.sale_no, s.sale_ymd , g.goods_nm, s.sale_cnt,   s.sale_cnt *   g.goods_price  ,
decode (s.pay_type  ,'01', '현금' ,'02', '카드')
from   sale_tbl_500  s
join  goods_tbl_500  g
on s.goods_cd  =  g.goods_cd
where s.store_cd  ='A001'  ;  



--배디민턴
select * from tbl_court_202301;
select * from  tbl_resv_202301;
select * from tbl_cust_202301;

--참여할 테이블 
--  예약 테이블  tbl_resv_202301
--  고객테이블   tbl_cust_202301

select *
from  tbl_resv_202301  r
join tbl_cust_202301 c
on  r.cust_no  =  c.cust_no;

-- 그룹바이 전단계
select  r.cust_no  , c.cust_name
from  tbl_resv_202301  r
join tbl_cust_202301 c
on  r.cust_no  =  c.cust_no;


--그룹바이 수행

select  r.cust_no  , c.cust_name ,  count(*)
from  tbl_resv_202301  r
join tbl_cust_202301 c
on  r.cust_no  =  c.cust_no
group by r.cust_no  , c.cust_name ;



-- 선행( 그룹바이가 되어야 한다)
-- 그룹바이된 결과에 중간집계 구하기
-- rollup()


--
 select  * from tbl_test_order;
 select  * from tbl_test_goods;
 select  * from tbl_test_customer;
 
 
 --상품별 판매수량 합 구하기 
  select  * from tbl_test_order;
  
  
  select  pcode, sale_cnt
  from tbl_test_order  ;
 
 
  
   select  *
  from tbl_test_order o
  join  tbl_test_goods g
  on o.pcode  = g.pcode;
 
 
 
  select  o.pcode,  g.pname, o.sale_cnt   
  from tbl_test_order o
  join  tbl_test_goods g
  on o.pcode  = g.pcode;
 



  select  o.pcode,  g.pname, o.sale_cnt   
  from tbl_test_order o
  join  tbl_test_goods g
  on o.pcode  = g.pcode
  order by 1;



  select  o.pcode,  g.pname, sum( o.sale_cnt   )
  from tbl_test_order o
  join  tbl_test_goods g
  on o.pcode  = g.pcode
  group by  o.pcode,  g.pname;
  
  --
  select  o.pcode,  g.pname, sum( o.sale_cnt   )
  from tbl_test_order o
  join  tbl_test_goods g
  on o.pcode  = g.pcode
  group by  rollup( o.pcode,  g.pname);
  
-- rollup, 그룹바이된 상태에서 중간 합계을 만들때 사용한다 . 단독으로 사용되지 않는다 


  select 
  nvl(o.pcode, '전체합계')  ,
  nvl( g.pname  ,'소계'), 
  sum( o.sale_cnt   )
  from tbl_test_order o
  join  tbl_test_goods g
  on o.pcode  = g.pcode
  group by  rollup( o.pcode,  g.pname);
  
  
  
  --167페이지 
  select *
  from emp;
  
  --부서별 직급별 급여합계 
  --그룹바이 전 단계
  
  select deptno, job, sal
  from emp
  order by 1;
  
  
  -- 그룹바이 실행
  -- 부서별 직급별 급여 합 구하기 
  select deptno, job,  sum(sal)
  from emp
  group by  deptno, job 
  order by 1;
  
 
 --부서별 중간 소계 내기 
 --rollup 추가하기
   select deptno, job,  sum(sal)
  from emp
  group by   rollup(deptno, job )
  order by 1;
  
  
  --
  desc  emp;
  
  select
  nvl(to_char(deptno), '전체합계'),        -- deptno 숫자컬럼이기 때문에  '전체합계'라는 문자가 적용이 안됨)
  job,                                    --to_char로 변환 후 사용
  sum(sal)
  from emp
  group by   rollup(deptno, job )
  order by 1;
  
  
 -- 
   select
  nvl(to_char(deptno), '전체합계'),        -- deptno 숫자컬럼이기 때문에  '전체합계'라는 문자가 적용이 안됨)
  job,                                    --to_char로 변환 후 사용
  sum(sal)
  from emp
  group by   rollup( job  , deptno )
  order by 1;
  
  --페이지  205 페이지
  --sum() over() : 누적합 구하기 
  
  select *
  from   acorntbl;
  
  select  id, name,  point
  from   acorntbl;
  
  --포인트 누적합
  select  id, name,  point , sum(point) over( order by point)
  from   acorntbl;
 
 
 
 select  id, name,  point ,
 sum(point)
 over( 
  order by point
  range between unbounded preceding and current row    --기본값 
 )
 from   acorntbl;
 
 
 
 --각 행을 하나로 취급하고 싶다면   range -> rows 변경 하면 됨
 
 
  
 select  id, name,  point ,
 sum(point)
 over( 
  order by point
  rows between unbounded preceding and current row    --기본값 
 )
 from   acorntbl;
 
 
 
 --over(
 --[partiton  by]
 --[order bv]
 --[range, rows])
 
 
 
 select p_date  , p_code, p_total
 from panmae;
 
 
 
select p_date  , p_code
, p_total
, sum(p_total) over( order by p_total)
 from panmae
 where p_store = 1000;
 
 
  
select p_date  , p_code
, p_total
, sum(p_total) over( order by p_total)
 from panmae;
 
 
 
 select p_date  , p_code
, p_total
, sum(p_total) 
  over( 
  order by p_total
  rows between unbounded preceding  and current row
  )
 from panmae;
 
 
 
 select p_date  , p_code
, p_total
, sum(p_total) 
  over( 
  order by p_total
  --range between unbounded preceding  and current row
  )
 from panmae;
 
 
 --전체합계를 컬럼으로 표시하기
 --sum(p_total) over()   : over() 비어 있으면 전체합계 나옴 
 select  p_code, p_total , sum(p_total) over() 
 from panmae;
 
 
 --emp테이블 
 
 select * 
 from emp;
 
 --누적합  (처음부터 현재행까지  ) :  partiton 이 없으면 전체 
 select  ename, job, sal  , sum(sal) over( order by sal)
 from emp;
 
 
 --전체합
 select  ename, job, sal  , sum(sal) over( )
 from emp;
 
 
 
 -- 직급별 누적을 구할때는 
 -- partition by  사용  (영역을 나눈다. 윈도우를 부분으로 정한다) 
 
  select  ename, job, sal  , 
  sum(sal) over(
  partition by job
  order by sal)
 from emp;
 
 
 --순위구하기
 --페이지  196
 
 --rank() over( order by    컬럼명)  
 --dense_rank() over( order by 컬럼명)
 
 
 --rank, dense 차이 : 동점일 경우 다음 순위를 매기는 방식이 다른다
 --row_number() over( order by  컬럼명)
 
 --rank() over( order by    컬럼명1, 컬럼명2)
 
 
 select name, point 
 from acorntbl;
 
 --동일 등수가 나올 수 있음 ( 동일점수 이후 건너뛰고 나오게 한다)
  select name, point  , rank() over(order by point desc  )  --포인트가 높은사람 순서로 순위 매김
 from acorntbl;
 
 
  --동일 등수가 나올 수 있음 ( 동일점수 이후 순차적으로 나오게 한다)
 select name, point  , dense_rank() over(order by point desc  )  --포인트가 높은사람 순서로 순위 매김
 from acorntbl;
 
 
  --동일점수가 나오지 않는다 
  --동일한 점수일때  실제 데이터가 저장된 물리적번호  row_id 을 기준으로 순위를 매김
  select name, point  , row_number() over(order by point desc  )  --포인트가 높은사람 순서로 순위 매김
 from acorntbl;
 
 
 --포인트가 높은순, 같은 포인트인경우 생일 
 select name, point , birthday , rank() over( order by point desc, birthday desc )
 from acorntbl;
 
 
 --emp 테이블
 select  job , sal
 from emp;
 
 
 select   job , sum( sal)
 from emp
 group by job;
 
 
 
  select   job , sum( sal)  total     -- total 이라는 별칭은    select  다음 부터 사용 가능 ( order by 에서는 사용 가능)
 from emp
 group by job;
 
 
  select   job , sum( sal)  total  ,  rank() over(  order by    sum( sal)  desc )
 from emp
 group by job;
 
 --교재  페이지 194
 --lag() , lead()
 --이전행  , 다음행 
 --lag(컬럼명 , 몇번째이전 ,  기본값)  over()
 --lead(컬럼명 , 몇번째이후 ,  기본값) over()
 
 
 
 select  ename,  sal  from emp;
 
  select  
  ename, 
  sal  ,
  lag(sal, 1, 0) over( order by  sal)
  from emp;
  
  
  
  select  
  ename, 
  sal  ,
  lead(sal, 1, 0) over( order by  sal)
  from emp;
  
--rollup (group by 된 결과에서 중간소계 구하기)
--순위구하기
--누적구하기
--이전행 구하기
--다음행 구하기

--비율구하기(대상금액/전체금액)
--ratio_ro_report() over()

select sal , sum(sal) over()
from emp;
  
  
-- sal/전체 sal 합계
select sal , sum(sal) over(), sal/sum(sal) over()*100
from emp;

select sal ,ratio_to_report( sal) over()
from emp;

--

select deptno, sal
from emp;

--부서별 sal 합계 구하기
select deptno, sum(sal)
from emp
group by deptno;


--부서별 sal 합계 구하기
--부서별 sal 합계 전체에 대한 비율 구하기
select 
deptno, 
sum(sal),
sum(sal) / sum(sum(sal)) over()
from emp
group by deptno;

--ratio_to_report 207 페이지

select
deptno, sal
from emp
group by deptno;

select
deptno, sum(sal)
from emp
group by deptno;

--
select
deptno, 
sum(sal),
ratio_to_report(sum(sal)) over()*100
from emp
group by deptno;

--소수 2짜리까지 반올림

select
deptno, 
sum(sal),
round(ratio_to_report(sum(sal)) over()*100,2) as "%"
from emp
group by deptno;


--각 회원의 포인트가 전체 대비 몇 % 차지하는지 비율 구하기
select name, point
from acorntbl;

select name, point, point/sum(point) over()
from acorntbl;

--over() : 비어있으면 전체를 대상으로 point 합계 구하기
select point, sum(point) over()
from acorntbl;


--point 기분으로 누적값 구하기( 처음부터 현재행까지의 합)
select point, sum(point) over(
order by point
rows between unbounded preceding and current row
)
from acorntbl;

--unbounded preceding 제한이 없는 이전(처음부터)

select point, sum(point) over() ,point /sum(point) over()*100
from acorntbl;

select 
point
,
ratio_to_report(point) over()*100
from acorntbl;

select 
point
,
round(ratio_to_report(point) over()*100,2)
from acorntbl;

--decode 함수 185 페이지(달력만들기) emp 사용하여 부서별 직급별 사원 수 구하기

select * from emp;
select deptno, job, empno from emp;

--1. 전체 사원 수 구하기
--2. 직급이 매니저인 사원의 수 구하기
--3. 부서별 직급이 매니저인 사원 수 구하기

select count(*)
from emp;


--2 직급이 매니저인 사원의 수 구하기

select job, ename
from emp
order by 1;

select job
from emp;

select job, decode(job , 'MANAGER',9)
from emp
order by 1;

--직급이 매니저인 인원 수
select count( decode(job , 'MANAGER',9))
from emp;

--부서별 직급이 매니저인 인원 수

select deptno, count( decode(job , 'MANAGER',9))
from emp
group by deptno;

select deptno, decode( job, 'MANAGER',0)
from emp;

--그룹 바이 되기 전 만들자
select deptno, decode( job, 'MANAGER',0)
from emp
order by 1;

-- 그룹 바이 진행
-- count(컬럼) -> null 제외시키고 카운트
select deptno, count( decode( job, 'CLERK',0)),
select deptno, count( decode( job, 'MANAGER',0)),
select deptno, count( decode( job, 'PRESIDENT',0)),
select deptno, count( decode( job, 'ANALYST',0)),
select deptno, count( decode( job, 'SALESMAN',0))
from emp
group by deptno
order by 1;

--그룹 바이 되기 전 만들자
select deptno, decode( job, 'MANAGER',8),
decode(job, 'CLERK',8),
decode(job, 'PRESIDENT',8),
decode(job, 'ANALYST',8),
decode(job, 'SALESMAN',8)
from emp
order by 1;

select deptno, 
count (decode( job, 'MANAGER',8)),
count (decode(job, 'CLERK',8)),
count (decode(job, 'PRESIDENT',8)),
count (decode(job, 'ANALYST',8)),
count (decode(job, 'SALESMAN',8))
from emp
group by deptno
order by 1;

--부서별 직급별 사원 수 구하기

--매니저 직급 사원
--세일즈맨 직급 인원 수 구하기
--전체 인원 수
--매니저 직급의 인원 수를 부서별로 구하기

-- 그룹 바이된 결과를 조회할 때는 그룹바이 되기 전 상태를 잘 만들자 !!!
--눈으로 그룹바이 시도 후 그룹바이 진행


--pivot 사용하여 부서별 직급별 인원 수 구하기
-- 서브 쿼리 형태
select * 
from ( select deptno, job, empno from emp)
pivot( count(empno)for job in('CLERK' as "CLERK", 'MENAGER' as "MENAGE")) -- for job 열로 나올 항목
;


--실행순서
--1. from 뒤에 있는 쿼리가 수행되어서 deptno, job, empno -> pivot (행, 열 데이터 그룹화 하기)
--2. pivot -> for 뒤에 있는 컬럼이 열로 만들어짐 (열 생성) + 집계(count)
--3. deptno 기분으로 그룹화 
--4. 최종 select -> 변환된 결과 반환 함

select *   --3
from(  select  deptno, empno, job  from emp)   --1
pivot(  count(empno) for job in( 'CLERK'  as  "CLERK"  , 'MANAGE' as "MANAGER" , 'SALESMAN'  as "SALESMAN"  ));  --2

select deptno, clerk   --3
from(  select  deptno, empno, job  from emp)   --1
pivot(  count(empno) for job in( 'CLERK'  as  "CLERK"  , 'MANAGE' as "MANAGER" , 'SALESMAN'  as "SALESMAN"  ));  --2

select aaa, bbb, ccc --3
from(  select  deptno, empno, job  from emp)   --1
pivot(  count(empno) for job in( 'CLERK'  as  aaa  , 'MANAGE' as bbb , 'SALESMAN'  as ccc  ));  --2


--unpivot
--pivot행, 열의 집계 데이터를 다시 원래 상태로 되돌리는 것을 말한다.

CREATE TABLE unpivot
    AS
        SELECT
            *
        FROM
            (
                SELECT
                    deptno,
                    job,
                    empno
                FROM
                    emp
            ) PIVOT (
                COUNT(empno)
                FOR job
                IN ( 'CLERK' AS "CLERK", 'MANAGER' AS "MANAGER", 'PRESIDENT' AS "PRESIDENT", 'ANALYST' AS "ANALYST", 'SALESMAN' AS "SALESMAN"
                )
            );

SELECT
    *
FROM
    unpivot;


--
SELECT
    *
FROM
    unpivot UNPIVOT ( empno
        FOR job
    IN ( clerk,
         manager,
         president,
         analyst,
         salesman ) );




--lag함수
--이전행 가져오기

SELECT
    ename,
    hiredate,
    sal,
    LAG(sal, 1, 0)
    OVER(
        ORDER BY
            hiredate
    )
FROM
    emp;



-- 부서별 파티션 나누기
SELECT
    ename,
    deptno,
    hiredate,
    sal,
    LAG(sal, 1, 0)
    OVER(PARTITION BY deptno
         ORDER BY
             hiredate
    ) AS prev_sal
FROM
    emp;


--
SELECT
    ename,
    deptno,
    job,
    hiredate,
    sal,
    LAG(sal, 1, 0)
    OVER(PARTITION BY deptno, job
         ORDER BY
             hiredate
    ) AS prev_sal
FROM
    emp;




--lead(): 다음행 가져오기  이후 값 가져오기
SELECT
    ename,
    hiredate,
    sal,
    LEAD(sal, 2, 1)
    OVER(
        ORDER BY
            hiredate
    )
FROM
    emp;
    
    
    
-- 210 연습문제 (decode 사용하기)
select * from unpivot ;

-- 1, 2, 3(decode 활용하여 풀기) 4 
-- 5, 7, 8, 9

--1번
select * from emp;

select sal, comm
from emp;

select  sal,comm,sal+ nvl(comm,0) 
from emp;

select  
max(sal+ nvl(comm,0)), 
min(sal+ nvl(comm,0)),
avg(sal+ nvl(comm,0))
from emp;

select  
max(sal+ nvl(comm,0)) as max,
min(sal+ nvl(comm,0)) as min,

from emp
---
SELECT * FROM EMP;

SELECT ROUND(MAX(SAL+NVL(COMM,0)),1) MAX,
ROUND(MIN(SAL+NVL(COMM,0)),1) MIN,
ROUND(AVG(SAL+NVL(COMM,0)),1) AVG
FROM EMP;

SELECT ROUND(MAX(SAL+DECODE(COMM,NULL,0,COMM)),1) MAX,
ROUND(MIN(SAL+DECODE(COMM,NULL,0,COMM)),1) MIN,
ROUND(AVG(SAL+DECODE(COMM,NULL,0,COMM)),1) AVG
FROM EMP;

--2번
select * from student;

select birthday
from student;
--

select birthday from student;


select to_char(birthday, 'mm')
from student;


select decode(to_char(birthday, 'mm'), '01', 1)
from student;


select count(decode(to_char(birthday, 'mm'), '01', 1))
from student;

select
       count(*),
       count(decode(to_char(birthday, 'mm'), '01', 1)),
       count(decode(to_char(birthday, 'mm'), '02', 1)),
       count(decode(to_char(birthday, 'mm'), '03', 1)),
       count(decode(to_char(birthday, 'mm'), '04', 1)),
       count(decode(to_char(birthday, 'mm'), '05', 1)),
       count(decode(to_char(birthday, 'mm'), '06', 1)),
       count(decode(to_char(birthday, 'mm'), '07', 1)),
       count(decode(to_char(birthday, 'mm'), '08', 1)),
       count(decode(to_char(birthday, 'mm'), '09', 1)),
       count(decode(to_char(birthday, 'mm'), '10', 1)),
       count(decode(to_char(birthday, 'mm'), '11', 1)),
       count(decode(to_char(birthday, 'mm'), '12', 1))
from student;

select
       count(*) || 'ea' total,
       count(decode(to_char(birthday, 'mm'), '01', 1)) || 'ea' jan,
       count(decode(to_char(birthday, 'mm'), '02', 1)) || 'ea' feb,
       count(decode(to_char(birthday, 'mm'), '03', 1)) || 'ea' mar,
       count(decode(to_char(birthday, 'mm'), '04', 1)) || 'ea' apr,
       count(decode(to_char(birthday, 'mm'), '05', 1)) || 'ea' may,
       count(decode(to_char(birthday, 'mm'), '06', 1)) || 'ea' jun,
       count(decode(to_char(birthday, 'mm'), '07', 1)) || 'ea' jul,
       count(decode(to_char(birthday, 'mm'), '08', 1)) || 'ea' aug,
       count(decode(to_char(birthday, 'mm'), '09', 1)) || 'ea' sep,
       count(decode(to_char(birthday, 'mm'), '10', 1)) || 'ea' oct,
       count(decode(to_char(birthday, 'mm'), '11', 1)) || 'ea' nov,
       count(decode(to_char(birthday, 'mm'), '12', 1)) || 'ea' dec
from student;

--전체 학생수
--1월 학생수

select count(*) from student;

select birthday from student;
select to_char( birthday,'mm') from student;
select decode(to_char( birthday,'mm') ,'01',8) from student;
--1월생 수
select 
count(decode(to_char( birthday,'mm') ,'01',8)) 
from student;

--2월생수
select 
count(decode(to_char( birthday,'mm') ,'02',8)) 
from student;

--3월생 수
select 
count(decode(to_char( birthday,'mm') ,'03',8)) 
from student;

--3번

SELECT
  COUNT(TEL) AS TOTAL, --전체 번호 합계
  SUM(DECODE(SUBSTR(tel, 1, 2), '02', 1, 0))  AS SEOUL, --서울 02
  SUM(DECODE(SUBSTR(tel, 1, 3), '031', 1, 0)) AS GYEONGGI, --경기 031
  SUM(DECODE(SUBSTR(tel, 1, 3), '051', 1, 0)) AS BUSAN, --부산 051
  SUM(DECODE(SUBSTR(tel, 1, 3), '052', 1, 0)) AS ULSAN, -- 울산 052
  SUM(DECODE(SUBSTR(tel, 1, 3), '053', 1, 0)) AS DAEGU, -- 대구 053
  SUM(DECODE(SUBSTR(tel, 1, 3), '055', 1, 0)) AS GYEONGNAM -- 경남 055
FROM student;

--전체 수
--서울 지역 수 구하기

select tel from student;

-- 국번만 가져오기
--)괄호 위치를 찾아서 -1 하면 가져올 개수를 지역에 구할 수 있다
select tel, substr(tel,1,3) from student;

select tel, instr(tel,')'),instr(tel,')')-1 from student;

select tel, substr(tel,1,instr(tel,')')-1) from student;

--4번
insert into emp(empno, deptno, ename, sal) values (1000, 10, 'Tiger', 3600);
insert into emp(empno, deptno, ename, sal) values (2000, 10, 'Cat', 3000);
commit;

select * from emp;

select
        deptno,
        sum(decode(job, 'CLERK', sal, 0)) "CLERK",
        sum(decode(job, 'MANAGER', sal, 0)) "MANAGER",
        sum(decode(job, 'PRESIDENT', sal, 0)) "PRESIDENT",
        sum(decode(job, 'ANALYST', sal, 0)) "ANALYST",
        sum(decode(job, 'SALESMAN', sal, 0)) "SALESMAN",
        sum(sal) "Total"
from emp
where job is not null
group by rollup(deptno)
order by deptno;

--sal 전체합계
--직급이 clerk sal 합계
-- 부서별 직급이 clerk sal 합계
select sal
from emp;

select sum(sal)
from emp;

select job, sal
from emp;

--job, sal
select job, decode(job,'CLERK',sal,0)
from emp;

select job,sal,decode(job,'CLERK',sal,0)
from emp;

--clerk 만 sal 남기기
select sum(sal), sum(decode(job,'CLERK',sal,0))
from emp;

select sum(sal), sum(decode(job,'CLERK',sal,0))
from emp;

--manager

--salemain
select  
    sum(decode(job,'CLERK',sal,0)),
    sum(sal)
from emp
where job is not null;

--
select  
    sum(decode(job,'CLERK',sal,0)),
    sum(decode(job, null,0,sal))
from emp
where job is not null;

--7번
select ename,sal,sum(sal)over()
from emp;

-- 순서와 누적을 하기위해 order 사용
select ename,sal,sum(sal)over(order by sal)as total
from emp;

--rows로 계산(행으로 계산 하여 누적값 저장)
select ename,sal,sum(sal)over(order by sal rows between unbounded preceding and current row)as total
from emp;

-- over(order by sal)과 기본 형태 동일 
select ename,sal,sum(sal)over(order by sal range between unbounded preceding and current row)as total
from emp;


--8번
select * from emp;

select deptno, ename,sal
from emp
order by 1;

select deptno, ename,sal, 
sum(sal) over(
order by sal)
from emp;

select deptno, ename,sal, 
sum(sal) over(
partition by deptno
order by sal)
from emp;


select deptno, ename,sal, 
sum(sal) over(
partition by deptno
order by sal
rows between unbounded preceding and current row
) as total
from emp
order by 1;

--9번

select *
from emp;

select deptno, ename , sal, sum(sal) over(),
sal/ sum(sal) over()*100
from emp
group by deptno,ename , sal;

select deptno, ename , sal, sum(sal) over(),
round(sal/ sum(sal) over()*100,2)
from emp
group by deptno,ename , sal ;

select deptno, ename , sal, sum(sal) over() as total_sal,
round(sal/ sum(sal) over()*100,2)  as "%"
from emp
group by deptno, ename , sal  
order by sum(sal) desc;


---
select 
deptno, 
ename , 
sal, sum(sal) over(),
sal/ sum(sal) over()*100
from emp;

select 
deptno, 
ename , 
sal, sum(sal) over(),
--sal/ sum(sal) over()*100
ratio_to_report(sal) over()
from emp;


-- join 연습
-- hy대학교 수강신청 프로그램 pdf(조회)

--데이터
create table tbl_course_300 (
        s_id varchar2(5) not null primary key,
        s_name varchar2(20)  ,
        s_grade number(6),
        teacher_id varchar2(10) ,
        weekday char(2) ,
        start_h number(4),
        end_h  number(4)
);

insert into tbl_course_300 values('1001',  '한식만들기' , 2, 1, 'M' , 0900, 1100 );
insert into tbl_course_300 values('1002',  '양식만들기' , 2, 2, 'TU' , 0900, 1200 );
insert into tbl_course_300 values('1003',  '제과제빵' , 3, 4, 'W' , 0900, 1200 );
insert into tbl_course_300 values('1004',  '중식만들기' , 3, 4, 'TH' , 0900, 1200 );
insert into tbl_course_300 values('1005',  '음료만들기' , 2, 5, 'M' , 1300, 1600 );
insert into tbl_course_300 values('1006',  '분식만들기' , 3, 5, 'TH' , 1500, 1800 );
insert into tbl_course_300 values('1007',  '전통주만들기' , 3, 5, 'W' , 1330, 1630 );
insert into tbl_course_300 values('1008',  '반찬만들기' , 2, 3, 'TH' , 1330, 1530 );
insert into tbl_course_300 values('1009',  '김치만들기' , 3, 3, 'F' , 0900, 1200 );
insert into tbl_course_300 values('1010',  '떡만들기' , 3, 2, 'F' , 1300, 1600 );



create table tbl_lecturer_300(
    t_id number(6) not null primary key,
    t_name varchar2(20)  ,
    major varchar2(20),
    field varchar2(20)
);

 

insert into tbl_lecturer_300 values( 1, '정국교수','한식,중식' ,'중식');
insert into tbl_lecturer_300 values( 2, '뷔교수','한식,중식' ,'중식');
insert into tbl_lecturer_300 values( 3, '지민교수','한식,양식' ,'양식');
insert into tbl_lecturer_300 values( 4, '제이홉교수','한식,양식' ,'한식');
insert into tbl_lecturer_300 values( 5, '슈가교수','제과제빵' ,'제과');
insert into tbl_lecturer_300 values( 6, '진교수','분식및음료' ,'분식');
insert into tbl_lecturer_300 values( 7, 'RM교수','분식및음료' ,'분식');
 

 --
 
 select * from tbl_course_300;
 select * from tbl_lecturer_300;


 select c.s_id, c.s_name, c.s_grade
 from tbl_course_300 c
 join tbl_lecturer_300 l
 on c.s_id = l.t_id
 ;

