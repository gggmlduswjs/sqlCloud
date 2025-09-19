SELECT * FROM member_tbl_11;
--1)MEMBER_TBL_11 테이블로부터 고객등급 조회
SELECT m_grade FROM member_tbl_11;

--2)MEMBER_TBL_11 테이블로부터 고객등급 조회하기, 중복된 값 제외하고 조회하기
SELECT DISTINCT m_grade
FROM member_tbl_11;

--3)고객테이블로부터 아이디  USERID라는 이름으로 조회하기 (AS 는 생략가능함)
SELECT m_id AS USERID
FROM member_tbl_11;

--4)고객테이블로부터 이름에 ‘님’자를 붙여 NAME이라는 컬럼으로 조회
SELECT m_name || '님' AS NAME
FROM member_tbl_11;

--CUST_INFO 테이블 문제
CREATE TABLE CUST_INFO(
    ID  VARCHAR(13) NOT NULL PRIMARY KEY,
    FRIST_NM    VARCHAR(10),
    LAST_NM     VARCHAR(10),
    ANNL_PERF   NUMBER(10,2)
);
COMMIT;

INSERT INTO CUST_INFO VALUES ('8301111567897' , 'JHUN' , 'KIM', 330.08);
INSERT INTO CUST_INFO VALUES ('9302112567897' , 'JINYOUNG' , 'LEE', 857.61);
INSERT INTO CUST_INFO VALUES ('8801111567897' , 'MIJA' , 'HAN', -76.77);
INSERT INTO CUST_INFO VALUES ('9901111567897' , 'YOUNGJUN' , 'HA', 468.54);
INSERT INTO CUST_INFO VALUES ('9801112567897' , 'DAYOUNG' , 'SUNG', -890);
INSERT INTO CUST_INFO VALUES ('9701111567897' , 'HYEJIN' , 'SEO', 47.44);

COMMIT;

SELECT * FROM CUST_INFO;
--<문자함수>
--1) 고객정보 테이블로부터 주민번호 7번째 숫자 (성별을 나타내는)를 추출하여 GENDER 라는 이름으로 주민번호와 함께 조회
SELECT ID, SUBSTR(ID, 7, 1) AS GENDER
FROM cust_info;

--2) 고객정보 테이블로부터  주민번호,  LAST_NM을 모두 소문자로 조회
SELECT ID, LOWER(LAST_NM)
FROM cust_info;

--3) 고객정보 테이블로부터 DM발송을 위해서  NAME이라는 이름으로 KIM, JIHOON 과 같은형식으로 조회될 수 있도록
SELECT LAST_NM || ', ' || FRIST_NM AS NAME
FROM cust_info;

--<숫자함수>
--1) 고객정보 테이블로부터 고객 주민번호, 수익을 소수 둘째에서 반올림하여 소수 첫째자리까지 표시
SELECT ID, ROUND(ANNL_PERF, 1)
FROM cust_info;

--2) 고객정보 테이블로부터 고객 주민번호, 수익을 소수 첫째에서 버림하여 정수로 나타낼수 있도록 조회
SELECT ID, TRUNC(ANNL_PERF)
FROM cust_info;

--<날짜함수>
--1) 현재날짜 조회
SELECT SYSDATE FROM DUAL;

--2) 고객테이블로부터 주민번호 , 수익이 300이상이면 고수익 100이상은 일반수익 0이하이면 손해 , 나머지는 변동없음 내용이 RESULT컬럼명으로 조회
SELECT ID, CASE WHEN ANNL_PERF >= 300 THEN '고수익'
                        WHEN ANNL_PERF >= 100 THEN '일반수익'
                        WHEN ANNL_PERF <= 0 THEN '손해'
                        ELSE '변동없음'
                END AS RESULT
FROM cust_info;

--<기타함수>
SELECT * FROM member_tbl_11;
--1) 고객테이블로부터 이름과 포인트를 조회
--(단, 포인트가 적립되지 않은 고객은 0으로 표시되도록 하시오)  힌트:NVL 함수 사용
SELECT m_name, NVL(m_point, 0)
FROM member_tbl_11;

--2) 고객테이블로부터 기존포인트 점수에서 100포인트씩 인상하려고 합니다.  NEXT_POINT라는 컬럼으로 조회, 고객이름, 포인트와 함께 조회
--( 기존포인트가 없는 사람은 0포인트로 간주합니다) 힌트: NVL2함수를 사용
SELECT m_name, m_point, NVL2(m_point, m_point + 100, 0) AS NEXT_POINT
FROM member_tbl_11;







