SELECT * FROM member_tbl_11;


--1
SELECT m_grade
FROM member_tbl_11;


SELECT  DISTINCT m_grade
FROM member_tbl_11;

SELECT m_id  AS "USERID"
FROM member_tbl_11;


CREATE TABLE CUST_INFO(
 ID VARCHAR2(13) NOT NULL PRIMARY KEY ,
 FIRST_NM VARCHAR2(10) , 
 LAST_NM VARCHAR2(10) ,
 ANNL_PERF NUMBER(10,2) 
);
COMMIT;
INSERT INTO CUST_INFO VALUES ('8301111567897' , 'JHUN' , 'KIM', 330.08);
INSERT INTO CUST_INFO VALUES ('9302112567897' , 'JINYOUNG' , 'LEE', 857.61);
INSERT INTO CUST_INFO VALUES ('8801111567897' , 'MIJA' , 'HAN', -76.77);
INSERT INTO CUST_INFO VALUES ('9901111567897' , 'YOUNGJUN' , 'HA', 468.54);
INSERT INTO CUST_INFO VALUES ('9801112567897' , 'DAYOUNG' , 'SUNG', -890);
INSERT INTO CUST_INFO VALUES ('9701111567897' , 'HYEJIN' , 'SEO', 47.44);
COMMIT;

SELECT * FROM cust_info;


--
SELECT  substr(id,7,1) AS  "GENDER"
FROM cust_info;




SELECT  id ,  lower(last_nm )
FROM cust_info;


SELECT first_nm  || ', ' || last_nm   name
FROM cust_info;



--숫자함수
SELECT   id,   round(annl_perf,1)
FROM cust_info;



SELECT   id,   trunc(annl_perf,1)
FROM cust_info;

--날짜함수
SELECT  sysdate  FROM dual;

--case when 





SELECT id,  annl_perf, CASE WHEN  annl_perf >=300 THEN  ' 고수익'
                            WHEN  annl_perf >=100 THEN  '일반수익' 
                            ELSE  '변동없음'
                       END  AS   "result"
FROM cust_info;



--기타함수

SELECT  m_name,   nvl(m_point,0)
FROM member_tbl_11;



--포인트가 있는사람(null이 아닌 사람)
--포인트가 없는사람( null인 사람)

 

SELECT  m_name,   nvl2(m_point,m_point+100, 100 )
FROM member_tbl_11;

--교재71
--문자함수
 SELECT * FROM emp;

 --1)  initcap()
 -- 첫글자만 대문자로 변경합니다
SELECT   initcap(ename)
FROM emp;

-- lower함수 
-- 소문자로 바꾸기

SELECT  lower(ename)
FROM emp;


-- upper함수
SELECT  upper('apple')  FROM  dual;

-- length
-- 문자열길이 구하기
SELECT  ename , LENGTH(ename) ,LENGTHB('우주연')
FROM emp;


-- concat()함수  연결하는 함수  ,  || 연산자 
SELECT  concat(ename , job)
FROM emp;


SELECT  concat(ename, ', ') 
FROM emp;


SELECT  concat(  concat(ename, ', ')  , job)
FROM emp;


--substr 
--문자열의 일부 가져오기 
--substr(컬럼, 시작위치, 가져올 개수)  :데이터베이스에서 인덱스는 1부터

SELECT 
substr(ename,1,1) , 
substr(ename,2,2) , 
substr(ename,2)
FROM emp;


--instr(컬럼, 찾는글자 , 시작위치)
--문자내에서 특정문자의 위치반환 
SELECT   instr('051)2222-44444', ')' )
FROM dual;

SELECT   instr('02)2222-44444', ')' )
FROM dual;

--78
SELECT name, tel , instr(tel, ')')
FROM student;


-- 
SELECT name,  substr(tel, 1, 3  )
FROM student;


SELECT  name,  substr(tel,1  ,  instr( tel, ')')-1 ) FROM student;


--lpad(컬럼, 자릿수 , 채울문자)함수 
--
SELECT lpad(ename , 10 ,  '*')
FROM emp;


--rpad(컬럼, 자릿수, 채울문자) 함수
SELECT  rpad(ename, 10,  '-')
FROM emp;

SELECT  lpad('aa' ,5 , '0')
FROM dual;

--trim() 함수  : 공백제거, 또는 특정문자 제거 할 수  있다 
--ltrim(), rtrim()

SELECT trim(' abc ')  FROM dual;
SELECT rtrim(' abc ')  FROM dual;
SELECT ltrim(' abc ')  FROM dual;

SELECT ltrim('hello','h')  FROM dual;

--replace(컬럼, '찾는문자' ,'바꿀문자') 함수 
-- 컬럼(문자)안에서  특정문자를 원하는 문자로 변경하는 함수 

SELECT  REPLACE('02)541-0408',')' ,'-' )FROM dual;

--
 SELECT * FROM acorntbl;

 SELECT  REPLACE(name ,'우' ,'*') FROM acorntbl;
 
 SELECT  name,  substr(name,1,1) FROM ACORNTBL ;

 SELECT  name,  substr(name,1,1) FROM ACORNTBL ;
 
 SELECT  REPLACE(name ,substr(name,1,1) ,'*') FROM acorntbl;
 
 --우**
 --최**
 
 --
 --  퀴즈4

 SELECT *
 FROM student;
 

 SELECT   name, tel 
 FROM student;
 
 
 
 SELECT   name,  REPLACE(tel  ,  '2158' ,'****')
 FROM  student;
 
 
 
 
 SELECT   name, substr(tel  ,9  ,4 )
 FROM student;
 
 
  SELECT   name,  REPLACE(tel  ,  substr(tel  ,9  ,4 )  ,'****')
 FROM  student;
  
  
  
   
 SELECT   name, tel, substr(tel  ,9  ,4 )
 FROM student;
 
 
 
 --  -하이픈 찾기
  SELECT   name, tel  , instr( tel  ,'-'  )+1
 FROM student;
 
 
    
 SELECT   name, tel, substr(tel  ,  instr( tel  ,'-'  )+1  ,4 )
 FROM student;
 
 
 
 
  SELECT 
  name, 
  tel, 
  replace( tel,substr(tel  , instr( tel  ,'-'  )+1  ,4 ) , '****')
 FROM student;
 
  
  
  --숫자함수 
  --round(컬럼 또는 숫자, 출력을 원하는 자리수), trunc
  --출력을 원하는 자리수 : -2 -1 ,0 , 1   2  3
  --출력을 원하는 자리수 오른쪽에서 반올림 됨
  
  SELECT  round( 1234.5678 ,0)  FROM dual;   
  SELECT  round( 1238.5678 ,-1)  FROM dual;
  
  
  --trunc  :버림
  SELECT trunc( 1234.5678,0) FROM dual;
  SELECT trunc( 1238.5678,-1) FROM dual;
  
  --  mod : 나머지 
  --  ceil주어진 숫자에서 가까운 큰 정수  3.56  -> 가까운 정수 3 ,4  (4)
  --  floor  :주어진 숫자에서 가까운 작은 정수   3.56  -> 가까운 정수 3 ,4(3)
  
  SELECT  mod(10,3) FROM dual;
  
  SELECT  floor(3.56) FROM dual;
  SELECT  floor(-3.56) FROM dual;   -- -3  -4 (-4)
  
  
  SELECT ceil(3.56) FROM dual;  --4  
  SELECT ceil(-3.56) FROM dual;  -- 음수  -3   -4(-3)
  
 
 
   --날짜함수 
  
  --현재날짜 구하기
  SELECT sysdate FROM  dual;
  
  -- 날짜 - 날짜  = 수 (일 수 )
  -- 날짜 +3  => 날짜
  -- 날짜 -3  => 날짜 
  
  
  --months_between(큰날짜, 작은날짜)
  SELECT MONTHS_BETWEEN( sysdate , '2025-07-14') FROM dual;
  
  --나이구하기 
  
  --add_months  :주어진 날짜에 개월을 더함  
  SELECT  ADD_MONTHS('2025-07-14',6) FROM dual;
  
  
  --next_day()함수
  SELECT NEXT_day( sysdate, '월요일') FROM dual;
  
  
  --last_day() 함수 :주어진 날짜의 마지막 날짜 구하기
  SELECT LAST_day( sysdate) FROM dual;
  
  --
  select sysdate,
       extract (year from sysdate) as year,
       extract (month from sysdate) as month,
       extract (day from sysdate) as day        
   from dual; 

  --형변환함수 
  --묵시적형변환(자동형변환)
  
  SELECT  2+'2' FROM dual;
  -- '2' -> 숫자로 자동으로 형변환이 된 것 
  
  SELECT  2+ to_number( '2'  ) FROM dual;
  
  --to_char()  :  숫자, 날짜를 문자로 형변환하는 것 
  
  SELECT  to_char( sysdate ,'YYYY-MM-DD' ) from dual;
  SELECT  to_char( sysdate ,'YYYY/MM/DD' ) from dual;
  SELECT  to_char( sysdate ,'YY/MM/DD' ) from dual;
  SELECT  to_char( sysdate, 'YYYY') FROM dual;
  SELECT  to_char( sysdate, 'MM') FROM dual;
  SELECT  to_char( sysdate, 'dd') FROM dual;
  SELECT  to_char( sysdate, 'day') FROM dual;
  SELECT  to_char( sysdate, 'dy') FROM dual;
  
  --시 분 초      
  
  select 
  sysdate, 
  to_char( sysdate, 'YYYY-MM-DD :HH24:MI:SS')
  from dual;
  
  --숫자 -> 문자로 형변환  (포멧형식: 천단위구분기호 , 원화,달러표시)
  SELECT name, point FROM acorntbl;
  
  SELECT name,  to_char(point ,  '999,999') FROM acorntbl;
  SELECT name,  to_char(point ,  'L999999') FROM acorntbl;
  SELECT name,  to_char(point ,  '$999999') FROM acorntbl;
  SELECT name,  to_char(point ,  '0999999') FROM acorntbl;
  
  
  --형변환 주의사항    문자  -> 문자변환 X   to_char(숫자 또는 문자)
  --             숫자  -> 숫자변환 X 
  
  
  --교재 107)
  --사용예
  SELECT  empno, ename, sal, comm
  FROM emp;
  
  SELECT  empno, ename, sal, comm , sal*12+comm
  FROM emp;
  
   
  SELECT  empno, ename, sal, comm , 
          to_char(sal*12+comm, '999,999')
  FROM emp;
  
  
  
  --15%
  -- 연봉* 1.15     
  -- 연봉+ 연봉 * 0.15
  
  -- 만원   20%인상된 금액
  -- 만원 *1.2       = 12000원
  -- 만원 + 만원*0.2   = 12000원

  --설정된 통화정보 확인하기
SELECT * FROM NLS_SESSION_PARAMETERS
WHERE PARAMETER LIKE '%CURRENCY%';
    
  --ALTER DATABASE SET NLS_CURRENCY = '₩'; (원화로 변경하기)
  
  
  --106페이지  형변환 함수 2 
  --입사일이  1,2,3월 사람 조회

   SELECT    hiredate,  to_char(HIREDATE   ,'MM')
   FROM emp;
   
   SELECT  *
   FROM emp
   WHERE  to_char(HIREDATE   ,'MM')  IN ('01','02','03');
  
   SELECT   empno, ename,  to_char(hiredate ,'YYYY-MM-DD')
   FROM emp
   WHERE  to_char(HIREDATE   ,'MM')  IN ('01','02','03');
  
  --108페이지  형변환 함수 3
   
  SELECT *
  FROM emp;
  
  
  
  SELECT  empno, ename,
   hiredate,  
   SAL*12 + comm,
   (SAL*12 + comm ) *1.15   
  FROM emp
  WHERE comm IS NOT NULL;
   
  
  SELECT  empno, ename,
   hiredate,  
   SAL*12 + comm,
  to_char( (SAL*12 + comm ) *1.15   , 'L999,999')
  FROM emp
  WHERE comm IS NOT NULL;
  
  --일반함수  :null 처리함수
  --nvl()
  --nvl2()  :null아닌경우,  null인 경우
  
  SELECT comm,  nvl(comm, 5) FROM emp;
  SELECT comm,  nvl2(comm, comm+100, 3) FROM emp;
  
  
  --decode함수
  SELECT * FROM MEMBER_TBL_11 ;  
  --decode 에서 해당되지 않는값은  null로 처리됨 
  --null 대신 다른 값을 사용하고 싶으면 원하는 값으로 정해야 함
  SELECT m_name, 
         decode(m_grade ,
         '01','vip',
         '02','GOLD',
         '03','SILVER'
          )
  FROM MEMBER_TBL_11;
  
  
  --118페이지
  
  SELECT deptno, 
   name ,
   decode(deptno,101, decode(name,'Audie Murphy' ,'BEST!','GOOD!'  )  )
  FROM PROFESSOR ;
  
  
  --교재 120   퀴즈1
  SELECT  jumin, name, 
  decode( substr(jumin,7,1) , 1, '남자' ,2,'여자')
  FROM student;
  
  
  
  --교재 123  case 
  SELECT empno, ename, sal 
  , CASE WHEN sal  BETWEEN 1    AND 1000 THEN   'LEVEL 1'
         WHEN sal  BETWEEN 1001 AND  2000 THEN  'LEVEL 2'
         WHEN sal  BETWEEN 2001 AND  3000 THEN  'LEVEL 3'
         WHEN sal  BETWEEN 3001 AND  4000 THEN  'LEVEL 4'
         WHEN sal  >4001 THEN  'LEVEL5'
    END AS "LEVEL"
  FROM emp;
  
  
  --156페이지 
  --복수행함수  ( sum , avg, max, min , count)
  
  SELECT  SUM(sal), avg(sal), max(sal) , min(sal), count(*)
  FROM emp;
  
  
  --집계함수는  null 제외시킴
  --sum()함수 :여러행에 대해서 수행함  , null을 제외시킴 
  SELECT sum(sal), sum(comm)
  FROM emp;
  
  
   SELECT max(sal), max(comm)
  FROM emp;
   
   SELECT min(sal), min(comm)
  FROM emp;
   
   --count(컬럼명) :  컬럼에서   null 을 제외하고 카운트 함
   SELECT count(sal), count( comm),  count(*)
   FROM emp;
  
  
   --count(*) :행의개수를 반환함 
   --count(컬럼명) : 컬럼명에   null 을 제외하고 개수를 구함 
   
   --group by  (그룹별 집계 내기)
   --group by  전 단계를 잘 만들자  (조회하기)
   
   SELECT * 
   FROM MEMBER_TBL_11 ;
   
   
   SELECT m_grade, m_point  
   FROM MEMBER_TBL_11 ;
    
   
   SELECT m_grade, sum(m_point )
   FROM MEMBER_TBL_11 
   GROUP BY m_grade;
   
   --그룹바이 된 결과내에서 조건에 맞는것은 조회하고 싶다면 
   --having절 추가하기  (반드시 group by절이 있어야 함 )
   
   
   SELECT m_grade, sum(m_point )
   FROM MEMBER_TBL_11 
   GROUP BY m_grade
   HAVING sum(m_point ) >=5000;
    
      
   --
   SELECT *
   FROM member_tbl_11
   WHERE m_point IS NOT NULL
   
   
   SELECT m_grade, m_point
   FROM member_tbl_11
   WHERE m_point IS NOT NULL;
   
   
    
   SELECT m_grade, sum(m_point)
   FROM member_tbl_11
   WHERE m_point IS NOT NULL
   GROUP BY m_grade;
   
   
   SELECT m_grade, sum(m_point)
   FROM member_tbl_11
   WHERE m_point IS NOT NULL
   GROUP BY m_grade
   HAVING  sum(m_point)>=5000;
   
   
   SELECT m_grade, sum(m_point)
   FROM member_tbl_11
   WHERE m_point IS NOT NULL
   GROUP BY m_grade
   HAVING  sum(m_point)>=5000
   ORDER BY 1;
   
   
   SELECT m_grade , m_point AS point
   FROM MEMBER_TBL_11 ;
   --앨리아스를 사용할 수 있는  시점은 앨리아스를 적용한 이후의 순서에서 가능하다
   
   
   SELECT m_grade, sum(m_point) AS total                --5
   FROM member_tbl_11                                   --1
   WHERE m_point IS NOT NULL                            --2
   GROUP BY m_grade                                     --3
   HAVING sum(m_point) >=5000                           --4
   ORDER BY total desc;                                 --6
   
   
   SELECT *
   FROM member_tbl_11;
   
   --그룹바이 전 단계 
   SELECT m_grade, M_POINT
   FROM member_tbl_11
   WHERE m_point IS NOT NULL;
   
  
      --그룹바이 실행
   SELECT m_grade, sum( M_POINT)
   FROM member_tbl_11
   WHERE m_point IS NOT NULL
   GROUP BY m_grade;
   
   --그룹바이 된 결과내에서  조건주기 
   --having  절 추가 
   
   SELECT m_grade, sum( M_POINT) AS totalpoint
   FROM member_tbl_11
   WHERE m_point IS NOT NULL
   GROUP BY m_grade
   HAVING sum( M_POINT) >=5000;   -- totalpoint 앨리아스 사용 불가
   
   
   --정렬하기 추가
   SELECT m_grade, sum( M_POINT) AS totalpoint
   FROM member_tbl_11
   WHERE m_point IS NOT NULL
   GROUP BY m_grade
   HAVING sum( M_POINT) >=5000   -- totalpoint 앨리아스 사용 불가
   ORDER BY  totalpoint;  --select  절의 앨리아스 사용가능 
 
 
   --집합연산자
   
select * from student;
select * from professor;

  -- 개수, 타입이 같아야 한다
  --

 select  studno , name,  deptno1 ,1
 from student
 where deptno1 =101
 union all 
 select  profno , name,  deptno ,2
 from professor
 where deptno =101;
 




 select  studno , name,  deptno1 ,1
 from student
 where deptno1 =101
 union   
 select  profno , name,  deptno ,2
 from professor
 where deptno =101;
 
 
 -- intersect   교집합  
 
 select  *
 from student;
 
 
 select  studno , name 
 from student
 where deptno1 =101
 union all 
 select  studno , name 
 from student
 where deptno2 =201;
 
 
 select  studno , name 
 from student
 where deptno1 =101
 union  
 select  studno , name 
 from student
 where deptno2 =201;
 
 
 
 --
 
 select  studno , name 
 from student
 where deptno1 =101
 intersect  
 select  studno , name 
 from student
 where deptno2 =201;
 
 --  minus
 
 select empno, ename,  sal
 from emp
 minus 
  select empno, ename,  sal
 from emp
 where sal  > 2500;
 
 
 
 
 
 --그룹화 연습문제
 
 
CREATE TABLE empSample (
    empno    NUMBER(4) CONSTRAINT pk_emp PRIMARY KEY, -- 사원번호
    ename    VARCHAR2(10),                           -- 이름
    job      VARCHAR2(9),                            -- 직급
    mgr      NUMBER(4),                              -- 상급자 사번
    hiredate DATE,                                   -- 입사일
    sal      NUMBER(7,2),                            -- 급여
    comm     NUMBER(7,2),                            -- 커미션
    deptno   NUMBER(2)                               -- 부서번호
);



INSERT INTO empSample VALUES (7369, '손민영',  'CLERK',     7902, TO_DATE('1980-12-17','YYYY-MM-DD'),  800, NULL, 20);
INSERT INTO empSample VALUES (7499, '이혜린',  'SALESMAN',  7698, TO_DATE('1981-02-20','YYYY-MM-DD'), 1600,  300, 30);
INSERT INTO empSample VALUES (7521, '우동훈',   'SALESMAN',  7698, TO_DATE('1981-02-22','YYYY-MM-DD'), 1250,  500, 30);
INSERT INTO empSample VALUES (7566, '윤태민',  'MANAGER',   7839, TO_DATE('1981-04-02','YYYY-MM-DD'), 2975, NULL, 20);
INSERT INTO empSample VALUES (7654, '최정문', 'SALESMAN',  7698, TO_DATE('1981-09-28','YYYY-MM-DD'), 1250, 1400, 30);
INSERT INTO empSample VALUES (7698, '이동규',  'MANAGER',   7839, TO_DATE('1981-05-01','YYYY-MM-DD'), 2850, NULL, 30);
INSERT INTO empSample VALUES (7782, '김민희',  'MANAGER',   7839, TO_DATE('1981-06-09','YYYY-MM-DD'), 2450, NULL, 10);
INSERT INTO empSample VALUES (7788, '김서호',  'ANALYST',   7566, TO_DATE('1987-04-19','YYYY-MM-DD'), 3000, NULL, 20);
INSERT INTO empSample VALUES (7839, '유승재',   'PRESIDENT', NULL, TO_DATE('1981-11-17','YYYY-MM-DD'), 5000, NULL, 10);
INSERT INTO empSample VALUES (7844, '박성욱', 'SALESMAN',  7698, TO_DATE('1981-09-08','YYYY-MM-DD'), 1500,    0, 30);
INSERT INTO empSample VALUES (7876, '정지원',  'CLERK',     7788, TO_DATE('1987-05-23','YYYY-MM-DD'), 1100, NULL, 20);
INSERT INTO empSample VALUES (7900, '최성원',  'CLERK',     7698, TO_DATE('1981-12-03','YYYY-MM-DD'),  950, NULL, 30);
INSERT INTO empSample VALUES (7902, '박두식',   'ANALYST',   7566, TO_DATE('1981-12-03','YYYY-MM-DD'), 3000, NULL, 20);
INSERT INTO empSample VALUES (7934, '이성빈', 'CLERK',     7782, TO_DATE('1982-01-23','YYYY-MM-DD'), 1300, NULL, 10);
INSERT INTO empSample VALUES (7930, '김현희', 'CLERK',     7782, TO_DATE('1982-01-23','YYYY-MM-DD'), 1300, NULL, 10);
INSERT INTO empSample VALUES (7931, '이대훈', 'CLERK',     7782, TO_DATE('1982-01-23','YYYY-MM-DD'), 1300, NULL, 10);
INSERT INTO empSample VALUES (7932, '전희연', 'CLERK',     7782, TO_DATE('1982-01-23','YYYY-MM-DD'), 1300, NULL, 10);

commit;

-- 전체 조회하기
   select * from empSample;


-- 문제1
-- 부서별 직원 수를 구하라.
   select deptno 
   from empSample;

   select deptno , count(*)
   from empSample
   GROUP BY deptno;

-- 문제2
-- 직급(job)별 평균 급여를 소수점 둘째자리까지 구하라.
   select job, sal 
   from empSample;

   select job,   round(avg(sal),2)   
   from empSample
   GROUP BY job;


-- 문제3
--부서별 최대 급여를 구하되, 커미션(COMM)이 있는 직원만 대상으로 하라.
--(커미션이  null이 아닌 직원대상)
   
   
   select deptno,     sal  
   from empSample
   WHERE comm IS NOT NULL;
  
      
   select deptno,   max(  sal  )
   from empSample
   WHERE comm IS NOT NULL
   GROUP BY deptno;
 
-- 문제4 (다중 그룹핑)
-- 부서별 + 직급별 직원 수를 구하라.   
   --그룹바이 전 단계 만들기
   SELECT  deptno, job 
   FROM empSample
   ORDER BY 1; 
      
   SELECT  deptno, job , count(*)
   FROM empSample
   GROUP BY deptno, job ;


 
 
 
  
  
   
  
  
  
  
  
  
  
  
  




  
  
  
  
  
  
  
  
  
  
  
  
 
 
 
 


















