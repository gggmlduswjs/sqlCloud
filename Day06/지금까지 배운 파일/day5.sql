--5차시 (뷰와 서브쿼리)


  --sum(컬럼)  over()  복습  
 select  * from acorntbl;
 select  * from  member_tbl_11; 
 
 
 --집계함수 sum, avg, max, min
 --윈도우절 over()
 
  select  * from acorntbl;
  select  name, point from acorntbl;
  select  name, point , sum(point) over() from acorntbl; 
  
  
  --over( [partiton by   order by   range|rows])   : 파티션 x,  정렬기준 x
  --over()  비어 있다는것은 파티션과 정렬기준 모두 없으면  :전체합계
  
 
  select  name, point , sum(point) over(  
  order by  birthday
  -- range between unbounded preceding  and current row
  ) from acorntbl; 
 

  select * from  member_tbl_11;
  
  select  m_name, m_grade , m_point  
  from  member_tbl_11
  where m_point is not null;
  
  
  select  m_name, m_grade , m_point   ,
         sum(m_point) over( order by  m_point)  -- 누적을 할 때 ,파티션이 없으면 전체를 대상으로 , 처음부터 현재행까지 누적
  from  member_tbl_11
  where m_point is not null;
  
  
  
  
  
  select  m_name, m_grade , m_point   ,
         sum(m_point) over(          
         partition by m_grade
         order by  m_point)  -- 누적을 할 때 ,파티션이 없으면 전체를 대상으로 , 처음부터 현재행까지 누적
  from  member_tbl_11
  where m_point is not null;
 
 
  
    select  m_name, m_grade , m_point   ,
         sum(m_point) over(          
         partition by m_grade
         order by  m_point
         range between  unbounded preceding and current row  -- 기본값
         )  -- 누적을 할 때 ,파티션이 없으면 전체를 대상으로 , 처음부터 현재행까지 누적
  from  member_tbl_11
  where m_point is not null;
  
   select  m_name, m_grade , m_point   ,
         sum(m_point) over(          
         partition by m_grade
         order by  m_point
         rows between  unbounded preceding and current row  -- 기본값
         )  -- 누적을 할 때 ,파티션이 없으면 전체를 대상으로 , 처음부터 현재행까지 누적
  from  member_tbl_11
  where m_point is not null;
  
  
  select  m_name, m_point  , m_grade
  from member_tbl_11
  where m_point is not null;
  
  select  m_name, m_point  , m_grade  , sum(m_point) over( 
  order by m_point
  
  )  -- 처음부터 현재행까지 의미
  from member_tbl_11
  where m_point is not null;
  
  
  
    select  m_name, m_point  , m_grade  , sum(m_point) over( 
    order by m_point
    rows between unbounded preceding and current row
  
  )  -- 처음부터 현재행까지 의미
  from member_tbl_11
  where m_point is not null;
  
  
  
   
    select  m_name, m_point  , m_grade  , sum(m_point) over( 
    partition by m_grade  --파티션 나누기
    order by m_point      --누적의 정렬기준 (어떤 기준으로 누적할 것인가)
    rows between unbounded preceding and current row-- 파티션 내에서  처음부터 현재행까지 의미
  
  )  
  from member_tbl_11
  where m_point is not null;
 
 --뷰 교재 400페이지
 
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
commit;
 
 
 select * from t_dept;
 select * from t_emp;
 
 --뷰의 목적 
 --보안과  사용자 편의성 
 --불필요한 정보를 제공하지 않는다
 --복잡한 쿼리를 매번작성하지 않는다 
 
 
 --뷰 만들기
 
 -- create view  뷰이름 
 -- as
 -- select ename, deptno
 -- from t_emp;
 
 
 create view  v_emp
 as 
  select ename, deptno
  from t_emp;
 

select * from v_emp;
select ename from v_emp;


--사용자 편의성  (복잡한 쿼리를 매번작성하지 않는다)
--조인쿼리를 뷰로 만든다 

 
 select * from t_dept;
 select * from t_emp;
 
 
 --사원이름 , 급여, 부서명
 
  select * 
  from  t_emp  e
  join  t_dept d
  on e.deptno  = d.deptno;
 
 
 
  select e.ename, e.salary , d.dname 
  from  t_emp  e
  join  t_dept d
  on e.deptno  = d.deptno;
 
 
  create view v_emp_dept
  as
  
  select e.ename, e.salary , d.dname 
  from  t_emp  e
  join  t_dept d
  on e.deptno  = d.deptno;
  
  
  select * from v_emp_dept;
  
 
 
  select * from v_emp_dept
  where salary >=300;
 
  
  --
  select  * from tbl_test_customer;
  select  * from tbl_test_goods;
  select  * from tbl_test_order;
  
  
  --상품별 판매개수 구하기
  
  select *
  from  tbl_test_order  o
  join  tbl_test_goods   g
  on o.pcode = g.pcode;
  
  
  select g.pname,  o.sale_cnt
  from  tbl_test_order  o
  join  tbl_test_goods   g
  on o.pcode = g.pcode;
  
  --상품별 판매수량의 합계 구하기 
  select g.pname,  sum( o.sale_cnt)
  from  tbl_test_order  o
  join  tbl_test_goods   g
  on o.pcode = g.pcode
  group by  g.pname;
  
  
  
  create view  v_order
  as
  select g.pname,  sum( o.sale_cnt)  as  total
  from  tbl_test_order  o
  join  tbl_test_goods   g
  on o.pcode = g.pcode
  group by  g.pname;
  
  
  select * from  v_order;
 
 
   select * 
   from  v_order
   where total >=3; 
  
 --뷰의 종류
 -- 단순뷰 ( 한 개의 테이블로 뷰 만들기)
 -- 복합뷰 ( 조인테이블로 만들기)
 -- 인라인뷰 ( 임시로 만들어지는 뷰 : 서브쿼리의 종류)
 
 
 --서브쿼리
 --쿼리안에 쿼리가 있는 형태
 --바깥쿼리 :메인쿼리
 --안에 있는 쿼리 : 서브쿼리
 
 --서브쿼리가 오는 위치
 --from 절 뒤
 --where절 뒤
 --select  절 뒤 
 
 
 --1) where절  뒤 서브쿼리
 -- 단일행
 -- 복수행
 
 --신동엽 사원보다 급여가 많은 사람의 이름을 조회하시오 
  select * from t_emp;
  
 
  select * from t_emp
  where salary > 280;
 
 
  select ename,salary , comm from t_emp
  where salary > 280;
 
 
  select salary 
  from t_emp
  where ename='신동엽';
  
  
 select ename,salary , comm from t_emp
  where salary > (select salary 
  from t_emp
  where ename='신동엽');
  
  
  --에이콘테이블
  --가장어린사람의 이름조회하기 
  
  select name , birthday
  from acorntbl;
  
  
  --가장어린사람 
  --생일이 가장 늦은 사람
  --생일이 가장 큰것 MAX사용하기
  
  select max(birthday) from acorntbl;
  
  
   select name , birthday
   from acorntbl
   where birthday = '2001-10-07';
  
 
 
 
   select *
   from acorntbl
   where birthday = ( select max(birthday) from acorntbl);
      
   --교재 428페이지 서브쿼리의 종류
   --단일행 서브쿼리
   --서브쿼리의 결과가 단일행 , 단일컬럼 ( 서브쿼리의 결과가  값 하나일 때)
   --단일행 서브쿼리 연산 = , >, < ,>= ,< =  연산자 사용가능하다
   
      
   --문제1)
   --acorntbl 테이블에서 포인트가 가장 높은 사람의 이름을 조회하시오  (서호님)
   --acorntbl 테이블에서 포인트의 평균보다 이상인  사람의 이름을 조회하시오 (대훈님)
   --emp테이블에서 가장 높은  급여를 받는 사람의 이름을 조회하시오 (정문님)
   
   select * from  acorntbl;
   
   --가장 높은 포인트 찾기
   select  max(point)  from  acorntbl;
   
   
    select * from  acorntbl
    where point =9220;
   
   
      
    select * from  acorntbl
    where point =( select  max(point)  from  acorntbl);
    
      
    select name from  acorntbl
    where point =( select  max(point)  from  acorntbl);
    
    
    --평균포인트보다 높은 회원 조회하기
    select name,point --대훈님 
    from acorntbl
    where point >(select avg( point)
    from acorntbl);

    --emp테이블에서 가장 높은  급여를 받는 사람의 이름을 조회하시오 (정문님) 
    SELECT ENAME
    FROM EMP
    WHERE SAL = (SELECT MAX(SAL) FROM EMP);
    
    
    SELECT ENAME
    FROM EMP
    ORDER BY SAL DESC
    FETCH FIRST 1 ROWS ONLY;
    
   --연습문제  429페이지
   --연습문제1 , 문제2
   
   
    --연습문제1
    --  Student 
    --  department     
    select * from student;
    select * from department;
    
    
    --학생테이블에서  Anthony Hopkins 의 1전공 찾기 ( deptno1) --103
    --103과 같은 학생찾기 
    --전공이름이 함께 나오도록한다 
    
    --1) 학생테이블과 학과테이블 조인하기 
    --2) 학생테이블에서  Anthony Hopkins 의 1전공 찾기 
    --3) 합쳐서 서브로쿼리로 완성
    
    --1)
      select * 
      from student s
      join department d
      on  s.deptno1  = d.deptno;
   
    --2)
      select deptno1 
      from student 
      where name= 'Anthony Hopkins';
      
      
      
     --3)
      select * 
      from student s
      join department d
      on  s.deptno1  = d.deptno 
      where s.deptno1  = '103';
      
      
      select * 
      from student s
      join department d
      on  s.deptno1  = d.deptno 
      where s.deptno1  = (
       select deptno1 
       from student 
       where name= 'Anthony Hopkins'
      );
          
      
     
    -- 연습문제 2
    -- professor 테이블과 department 테이블을 조회하여 'Meg Ryan'교수보다 나중에
    -- 입사한 사람의 이름과 입사일, 학과명을 출력하시오.
SELECT * FROM professor;
SELECT * FROM department;


--      이름, 입사일, 학과명
        SELECT hiredate
        FROM professor
        WHERE name = 'Meg Ryan';
        
        
        SELECT * FROM professor
        WHERE HIREDATE > '1985-09-18';
        
        
        SELECT * FROM professor
        WHERE HIREDATE > (SELECT hiredate
                          FROM professor
                          WHERE name = 'Meg Ryan');
        
        
        SELECT * 
        FROM professor p
        JOIN department d
        ON p.DEPTNO = d.DEPTNO;
        
        
        SELECT name, hiredate, dname
        FROM professor p
        JOIN department d
        ON p.DEPTNO = d.DEPTNO
        WHERE HIREDATE > (SELECT hiredate
                          FROM professor
                          WHERE name = 'Meg Ryan');
   
   
   
   --FROM절 뒤에 오는  서브쿼리  ( 인라인 뷰라고 함 )    
   
   --에이콘몰테이블사용하여 고객별 판매수량 합계구하기
   
   
   --고객별 판매수량의 합계
   --이대훈 9
   --유승재 6
   --정지원 2
   --최성원 5
   --전희연 3
   
    select *  from tbl_test_order;
    select *  from tbl_test_customer;
    select *  from tbl_test_goods;
    
    
    select *  from tbl_test_order  o
    join tbl_test_customer c
    on  o.id= c.id;
    
  
  
    select c.name, o.sale_cnt 
    from tbl_test_order  o
    join tbl_test_customer c
    on  o.id= c.id;
      
    
    select c.name, sum( o.sale_cnt ) 
    from tbl_test_order  o
    join tbl_test_customer c
    on  o.id= c.id
    group by c.name; 
   
   
   
   
   
   --from절 뒤의 서브쿼리 (인라인 뷰)사용하여 풀기    
   -- 1) 고객코드별 판매수량합계 구하기 (주문테이블)
   -- 2) 위의 내용과 고객테이블을 조인하여 쿼리 완성하기 
   
   
   select *
   from tbl_test_order   ;
   
   
   select  id, sale_cnt
   from tbl_test_order   ;
   
    
   select  id, sum( sale_cnt) total
   from  tbl_test_order   
   group  by id;
 
  
  --)위의 결과로 부터 
  -- 위의 쿼리를 From 절 뒤의 서브쿼리로 이용하여 
  -- 고객테이블과 조인하여 고객이름이 나오도록 한다
  
  select  *
   from(  select  id, sum( sale_cnt) total
           from  tbl_test_order   
           group  by id)  a
           
   join   tbl_test_customer c
   on a.id  = c.id;
   
   
   
   select  c.name, a.total
   from(  select  id, sum( sale_cnt) total
           from  tbl_test_order   
           group  by id)  a
           
   join   tbl_test_customer c
   on a.id  = c.id;
   
   
  --문제 
    select *  from tbl_test_order;
    select *  from tbl_test_customer;
    select *  from tbl_test_goods;
    
    
  --상품별 판매수량 합을 인라인뷰 (From절 뒤 서브쿼리)를 사용하여  조회하시오
  --상품코드별 판매수량 합 구하기 (인라인 뷰 만들기)
  --상품테이블과 조인하여 상품이름 나오게 하기
    select *  from tbl_test_order;
    select pcode, sale_cnt  from tbl_test_order;
  
    select pcode, sum( sale_cnt) 
    from tbl_test_order
    group by pcode;
    
    select *
    from(select pcode, sum( sale_cnt)  total
    from tbl_test_order
    group by pcode) a 
    
    join  tbl_test_goods g
    on a.pcode  = g.pcode;
    
    
    select g.pname, a.total
    from(select pcode, sum( sale_cnt)  total
    from tbl_test_order
    group by pcode) a 
    
    join  tbl_test_goods g
    on a.pcode  = g.pcode;
    
    
    --고객별 판매수량의 합계  (인라인뷰 )  -고객코드별 판매수량합계  +  고객테이블(조인)
    --상품별 판매수량의 합계  (인라인뷰)   -상품코드별 판맨수량합계  +  상품테이블( 조인)
    
  
    --420페이지  연습문제  1  , 2,  3 , 4     
    
    -- 2)    
    -- 학과별  가장 큰키, 가장높은 몸무게 조회하기 (인라인 뷰로 만들기  - from 절 서브쿼리)
    -- 학과테이블과 조인하여 학과명과 함께 조회하기
    
    
    --성욱님
    
    
      --성욱님  ( 인라인 뷰 사용 안함)
      select d.dname, max(s.weight),max(s.height)
      from student s
      join department d
      on s.deptno1= d.deptno
      group by d.dname;
      
       
      
      --
      SELECT * FROM student;
      SELECT * FROM department;      
      
      --서브쿼리 (인라인뷰 : from절 뒤의 서브쿼리)
      --학과별 가장 높은 키와 몸무게 구하기 
      
      --학과별 가장 높은 키와 몸무게 구하기   (인라인뷰 만들기  , 서브쿼리 from 절 뒤)
      --서브쿼리
      select deptno1, 
      max(height),  max(weight)
      from  student
      group by deptno1;
      
      
      
      --
      select * from department;
      
      
      --합체
      
      select * 
      from( select deptno1, 
            max(height),  max(weight)
            from  student
            group by deptno1)   a      
      join  department  b
      on  a.deptno1  = b.deptno;
      
    --
    
      select *  
      from( select deptno1, 
            max(height)  maxheight, 
            max(weight)  maxweight
            from  student
            group by deptno1)   a      
      join  department  b
      on  a.deptno1  = b.deptno;
      
      
      select b.dname, a.maxheight, a.maxweight  
      from( select deptno1, 
            max(height)  maxheight, 
            max(weight)  maxweight
            from  student
            group by deptno1)   a      
      join  department  b
      on  a.deptno1  = b.deptno;
    
    --3)
    -- Student 테이블과   department  테이블을 사용하여 학과이름, 학과별최대키, 학과별 가장 키가 큰 학생들의 이름과 키를 인라인 뷰 사용하기
    --1) 학생테이블에서 학과별 가장 높은 키 구하기  (인라인 뷰로 만들기)
    --2) 학생테이블과 조인하여 가장 키가 큰 학생조회하기 (조인조건 : 같은학과,  같은 키)
    --3) 학과테이블과 조인하여 학과명이 함께 조회되게 하기
    
     select * from student;
     select * from department;
     
     
     
     --서브쿼리
      select  deptno1, height from student;
     
     --서브쿼리 완성
      select  deptno1, max( height)
      from student
      group by deptno1;     
     
     --서브쿼리의 학과의 가장큰키  학생정보 조회하기 
     
     
     select * from student;
     
     
     
     select * from(     
     
       select  deptno1, max( height)  maxheight
       from student
       group by deptno1
     )  a
     join  student  b
     on  a.deptno1  = b.deptno1 and   a.maxheight  = b.height ;
    
     
     --학과별 가장 키가 큰 학생 정보 조회
        
     select * from(     
     
       select  deptno1, max( height)  maxheight
       from student
       group by deptno1
     )  a
     join  student  b
     on  a.deptno1  = b.deptno1 and   a.maxheight  = b.height ;
     
     
    -- 학과테이블과 조인하여 학과명 조회되도록 하기 
     
     select  a.deptno1 , b.name, b.height , d.dname from(   
     
       select  deptno1, max( height)  maxheight
       from student
       group by deptno1
     )  a
     join  student  b
     on  a.deptno1  = b.deptno1 and   a.maxheight  = b.height 
     join department  d
     on a.deptno1  = d.deptno;
     
     
     --학생, 학과 조인  =>  학생정보,학과명 
     
      --오라클조인 사용 예시 (승재님)      
       SELECT D.DNAME, S.HEIGHT, S.NAME, S.HEIGHT 
        FROM STUDENT S, DEPARTMENT D,
             (SELECT DEPTNO1, MAX(HEIGHT) AS MAX_HEIGHT
              FROM STUDENT
              GROUP BY DEPTNO1) A
        WHERE S.DEPTNO1 = D.DEPTNO
          AND S.DEPTNO1 = A.DEPTNO1
          AND S.HEIGHT = A.MAX_HEIGHT;
          
    
    
     --3번  풀이
    
     -- 서브쿼리 (학과명별 가장키가 큰정보 조회하기 ) 인라인뷰 만들기
       select  deptno1,  d.dname ,   max( height) maxheight  
       from student s
       join department  d
       on s.deptno1 = d.deptno
       group by  deptno1,  d.dname; 
    
       --학생테이블
       select * from student; 
       
       --합체
       select  *
       from(select  deptno1,  d.dname ,   max( height) maxheight  
            from student s
            join department  d
            on s.deptno1 = d.deptno
             group by  deptno1,  d.dname) a
       join student b
       on a.deptno1  = b.deptno1 and a.maxheight  = b.height;
      
    
    --4
          
    
            
         
        
        --서브쿼리
        select grade, avg(height)
        from student
        group by  grade;
        
        
        select * from student;
        
        --
        select *
        from (select grade, avg(height)
                from student
                group by  grade) a
        join student b
        on a.grade = b.grade ;
        
        
        select a.grade, b.name, b.height, a.avg_height
        from (select grade, avg(height) avg_height
                from student
                group by  grade) a
        join student b
        on a.grade = b.grade
        where b.height > a.avg_height
        order by 1;  
               
             
             
             
       select *
        from (select grade, avg(height) avg_height
                from student
                group by  grade) a
        join student b
        on a.grade = b.grade   and b.height > a.avg_height ;
        
        select b.grade, b.name, b.height, a.avg_height
from ( 
select grade , avg(height) avg_height
from student
group by grade) a
join student b
on a.grade=b.grade and b.height >a.avg_height
order by 1;
        
          
     
      -- on  :   조인의 조건
      -- where : 조인된 결과된로 부터 특정 조건에 맞는 것을 걸러냄 
    
    --4)sudent 테이블에서 학생의 키가 동일학년의 평균키보다 큰 학생들의 정보 조회하기
    --1) 학년별 평균키구하기  (인라인뷰 만들기)
    --2) 학생테이블과 조인하여  같은학년이고  평균키보다 높은 학생조회하기 
    
    
  
  
   --where 뒤에 오는 서브쿼리  페이지 432
   --다중행 서브쿼리 
   select * from emp2;
   select * from dept2;
   
   select  empno, name, deptno 
   from emp2
   where  deptno  in (  select dcode from dept2 where  area='Pohang Main Office');
  
   select  empno, name, deptno 
   from emp2
   where  deptno  in (   '0001','1003','1006','1007');
  
  --다중행, 단일컬럼 서브쿼리  사용 가능 연산자 :    IN, EXISTS, >ANY, <ANY,  <ALL, >ALL
  
  
  --where절의 서브쿼리  (다중행) ANY, ALL
  select sal
  from emp
  where deptno  = 20;   -- 800  2975  3000
  
  select ename, sal from emp;
  
  select ename, sal
  from emp
  where sal   > any (select sal
  from emp
  where deptno  = 20);
  
  
  
  
   select ename, sal
  from emp
  where sal   > all (select sal
  from emp
  where deptno  = 20);
  
  
  -- Exists  페이지 432
  -- where 서브쿼리의 결과가 존재하면 메인쿼리가 실행됨
  
  
  select * from t_emp;
  
  select * from t_emp
  where exists  (  select deptno  from t_dept where deptno  = 70); 
  
  
  
  
  --연관서브쿼리 
  --비연관서브쿼리  
   -- : 메인쿼리와 상관없이 서브쿼리가 독립적으로 수행됨 
   --   서브쿼리가 실행될 때 메인쿼리의 값을 사용안한다 
   
   
   --비연관서브쿼리
   --서브쿼리에서 메인쿼리의 값을 사용하지 않음 
   
   --급여가 가장많은 사람의 이름 조회하기
   select * from emp;
   
   
   select  *
   from emp
   where sal  =( select  max(sal) from emp);
  
   
   
   
   --연관서브쿼리
   --메인쿼리의 값을 서브쿼리가 사용한다 
   
   
    select * from emp;   
   --자신의 부서의 평균보다 높은 사람 조회하기 
   
   select * 
   from emp e
   where e.sal > (
   
           select  avg(e2.sal)
           from emp e2
           where  e2.deptno  = e.deptno          
   
   ) ;
   
   --2258
   select  avg(e2.sal)
   from emp e2
   where  e2.deptno  = 20;
   
   --연관서브쿼리 실행 순서
   --1.메인쿼리의 값이 서브쿼리에 전달 
   --2.서브쿼리 실행
   --3.메인쿼리에서 사용함
   --4.조건에 맞으면 결과에 나옴
   
   
   
   --스칼라 서브쿼리
   --select절의 서브쿼리
   
   select  *
   from  emp;
   
   --학과명을 select절의 서브쿼리로 가져오기   
   --스칼라서브쿼리(select 절 서브쿼리) 반드시 단일행, 단일컬럼이어야 한다 
   select  e.ename,  e.deptno  , ( select  d.dname  from dept d  where d.deptno  =e.deptno)
   from  emp  e;
   
     
   
   
    -- SQL  -DML, DDL, DCL
   ---dml (CRUD) :create, read, update, delete
   --데이터 조회하기 :select 
   --데이터 추가하기 :insert 
   --데이터 변경하기 :update
   --데이터 삭제하기 :delete 
   
   
   -- acorntbl
   -- 새로운 학생 추가하기 
   -- 이채민  , 임윤아
   select * from acorntbl;
   --데이터 추가하기
   insert into acorntbl(id, pw, name, point, birthday ) values( 'king',  '9999',  '이채민' ,999999, '2001-01-01');  --이채민
   
   --컬럼명을 명시하지 않을 경우 
   --순서와 개수가 일치해야 함
   insert into acorntbl values('yoona',  '1234',  '임윤아' ,800, '1994-01-01');   
   commit; 
   --
   insert into acorntbl(id, pw, name ) values( 'hong',  '5678',  '홍길동' );  --이채민

   select * from acorntbl;
   
   
   --변경하기 
   
   update  acorntbl
   set  point = 2500
   where id ='king';   
   
   --주의사항 
   commit;
   
   
   --포인트인상 업데이트 쿼리 실행
   --where  조건이 없으면 모든행(레코드)에 적용됨
   
   update  acorntbl
   set  point = point+1000;
   
   commit;
   
   
   
   
   
   --삭제하기 
   --조회하기
   select * from acorntbl;
   
   --홍길동 삭제하기    
   delete
   from  acorntbl
   where id ='hong';
   
   commit; 
   
   select * from acorntbl;
   
   
   
   --테이블 복사하기
   --테이블 복사하기 내용없이 
   --쿼리결과로  insert하기
   
   --1)
    create table  professor2
    as 
       select * from professor;
   
  
    select * from  professor2;
    
    --2)
    create table  professor6
    as 
       select * from professor
       where 1=2;
   
    select * from professor3;
 
 
   --3)조회된 결과로  insert 하기 
    insert into professor3
    select * from professor;
 
  
   --성욱님 질문   
   create table test12
    as
    select profno,
           case when name is not null then cast(null as varchar2(50)) 
                else cast(null as varchar2(50)) end as name,
           position
    from professor;
    
    
    
