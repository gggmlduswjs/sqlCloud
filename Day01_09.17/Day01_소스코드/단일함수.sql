--단일행함수 
--여러건의 데이터를 한 번에 하나씩 처리하는 함수 
--각 행에 대해서 함수가 실행된다
SELECT * FROM acorntbl;
SELECT * FROM emp;

--문자함수 : 데이터베이스는 문자, 문자열을 구분하지 않는다.
--'  ' 로 감싸고 '자체를 문자로 사용할 때는 ' ' 더 작성한다

--SUBSTR() : 주어진 문자에서 특정 문자만 추출 -> 인덱스 1부터 시작함
SELECT ename, SUBSTR(ename,1,1) AS 성
FROM emp;

--LOWER() : 소문자로 변경
SELECT LOWER(ename)
FROM emp;
--UPPER() : 대문자로 변경
SELECT UPPER(ename)
FROM emp;

--함수를 연습용으로 조회할 때는 dual 임시테이블 사용하기
SELECT UPPER('apple') FROM dual;

--숫자함수
--ROUND() : 반올림 / TRUNC() :  버림
--반올림하여 소수첫째자리까지 보여주기
SELECT ename, ROUND((sal * 12)/8, 1) FROM emp;

SELECT ename, ROUND(sal, -1) FROM emp;

--날짜함수
--현재 날짜 가져오기
SELECT sysdate FROM dual;

--일반함수
--(조건함수)
SELECT * FROM acorntbl;
SELECT name, point FROM acorntbl;

--포인트 500이상 A
--포인트 200이상 B
--나머지            C
SELECT point, CASE WHEN point >= 500 THEN 'A'
                            WHEN point >= 200 THEN 'B'
                            ELSE 'C'
                    END AS  등급
FROM acorntbl;

--null 처리하는 함수 nv1, nv2
SELECT * FROM member_tbl_11;

--포인트를 100인상하는 조회하기
SELECT m_point, m_point + 100               --이 방법 x
FROM member_tbl_11;

--nvl( 컬럼명, null일 때 사용할 값)
--null이면 0으로 처리 -> nvl() 사용
SELECT m_point, NVL(m_point, 0) + 100
FROM member_tbl_11;

--nvl2(컬럼명, null 아닌 경우, null인 경우)
SELECT NVL2(m_point, m_point + 100, 0)
FROM member_tbl_11;



