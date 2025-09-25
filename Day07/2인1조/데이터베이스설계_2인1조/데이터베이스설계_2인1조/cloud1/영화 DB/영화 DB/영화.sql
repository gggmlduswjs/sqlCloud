-- 1. 고객정보 테이블 생성
CREATE TABLE 고객정보 (
    고객번호 NUMBER PRIMARY KEY,
    고객이름 VARCHAR2(100) NOT NULL,
    핸드폰번호 VARCHAR2(13) NOT NULL UNIQUE,
    CONSTRAINT chk_핸드폰번호_형식 CHECK (REGEXP_LIKE(핸드폰번호, '^010-[0-9]{3,4}-[0-9]{4}$'))
);


-- 2. 영화정보 테이블 생성 
CREATE TABLE 영화정보 (
    영화번호 NUMBER PRIMARY KEY,
    영화이름 VARCHAR2(100) NOT NULL,
    감독 VARCHAR2(100) NOT NULL,
    주연 VARCHAR2(100),
    개봉일 DATE,
    등급 VARCHAR2(10) CHECK (등급 IN ('전체', '12', '15', '18')),
    장르 VARCHAR2(50) CHECK (장르 IN ('액션', '코미디', '드라마', 'SF', '공포', '로맨스', '스릴러')),
    런타임 NUMBER NOT NULL  
);


-- 3. 영화관정보 테이블 생성
CREATE TABLE 영화관정보 (
    영화관번호 NUMBER PRIMARY KEY,
    전체좌석수 NUMBER NOT NULL CHECK (전체좌석수 > 0),
    예약가능좌석수 NUMBER NOT NULL CHECK (예약가능좌석수 >= 0),
    상영관이름 VARCHAR2(100) NOT NULL
);


-- 4. 좌석정보 테이블 생성
CREATE TABLE 좌석정보 (
    좌석번호 NUMBER PRIMARY KEY,
    영화관번호 NUMBER NOT NULL,
    좌석위치 VARCHAR2(10) NOT NULL,
    CONSTRAINT fk_영화관번호 FOREIGN KEY (영화관번호) REFERENCES 영화관정보(영화관번호)
);


-- 5. 상영정보 테이블 생성
CREATE TABLE 상영정보 (
    상영번호 NUMBER PRIMARY KEY,
    영화관번호 NUMBER NOT NULL,
    영화번호 NUMBER NOT NULL,
    상영시간 DATE NOT NULL,
    FOREIGN KEY (영화관번호) REFERENCES 영화관정보(영화관번호),
    FOREIGN KEY (영화번호) REFERENCES 영화정보(영화번호)
);


-- 6. 예매표정보 테이블 생성 (상영시간 추가)
CREATE TABLE 예매표정보 (
    예매번호 NUMBER PRIMARY KEY,
    좌석번호 NUMBER NOT NULL,
    예매일자 DATE NOT NULL,
    예매수량 NUMBER NOT NULL CHECK (예매수량 > 0),
    고객번호 NUMBER NOT NULL,
    영화번호 NUMBER NOT NULL,
    영화관번호 NUMBER NOT NULL,
    상영시간 DATE NOT NULL,  
    FOREIGN KEY (좌석번호) REFERENCES 좌석정보(좌석번호),
    FOREIGN KEY (고객번호) REFERENCES 고객정보(고객번호),
    FOREIGN KEY (영화번호) REFERENCES 영화정보(영화번호),
    FOREIGN KEY (영화관번호) REFERENCES 영화관정보(영화관번호)
);

-- 고객정보 데이터 삽입
INSERT INTO 고객정보 (고객번호, 고객이름, 핸드폰번호) 
VALUES (1, '홍길동', '010-1234-5678');
INSERT INTO 고객정보 (고객번호, 고객이름, 핸드폰번호) 
VALUES (2, '김영희', '010-9876-5432');
INSERT INTO 고객정보 (고객번호, 고객이름, 핸드폰번호) 
VALUES (3, '이철수', '010-1111-2222');
INSERT INTO 고객정보 (고객번호, 고객이름, 핸드폰번호) 
VALUES (4, '박민수', '010-3333-4444');
INSERT INTO 고객정보 (고객번호, 고객이름, 핸드폰번호) 
VALUES (5, '최지은', '010-5555-6666');
INSERT INTO 고객정보 (고객번호, 고객이름, 핸드폰번호) 
VALUES (6, '이민호', '010-7777-8888');

select * from 고객정보;

-- 영화정보 데이터 삽입 (런타임 추가)
INSERT INTO 영화정보 (영화번호, 영화이름, 감독, 주연, 개봉일, 등급, 장르, 런타임) 
VALUES (1, '어벤져스', 'Joss Whedon', 'Robert Downey Jr.', TO_DATE('2012-05-04', 'YYYY-MM-DD'), '12', '액션', 143);
INSERT INTO 영화정보 (영화번호, 영화이름, 감독, 주연, 개봉일, 등급, 장르, 런타임) 
VALUES (2, '인셉션', 'Christopher Nolan', 'Leonardo DiCaprio', TO_DATE('2010-07-16', 'YYYY-MM-DD'), '12', 'SF', 148);
INSERT INTO 영화정보 (영화번호, 영화이름, 감독, 주연, 개봉일, 등급, 장르, 런타임) 
VALUES (3, '인터스텔라', 'Christopher Nolan', 'Matthew McConaughey', TO_DATE('2014-11-07', 'YYYY-MM-DD'), '12', 'SF', 169);
INSERT INTO 영화정보 (영화번호, 영화이름, 감독, 주연, 개봉일, 등급, 장르, 런타임) 
VALUES (4, '기생충', '봉준호', '송강호', TO_DATE('2019-05-30', 'YYYY-MM-DD'), '15', '드라마', 132);
INSERT INTO 영화정보 (영화번호, 영화이름, 감독, 주연, 개봉일, 등급, 장르, 런타임) 
VALUES (5, '타이타닉', 'James Cameron', 'Leonardo DiCaprio', TO_DATE('1997-12-19', 'YYYY-MM-DD'), '12', '드라마', 195);
INSERT INTO 영화정보 (영화번호, 영화이름, 감독, 주연, 개봉일, 등급, 장르, 런타임) 
VALUES (6, '다크나이트', 'Christopher Nolan', 'Christian Bale', TO_DATE('2008-07-18', 'YYYY-MM-DD'), '15', '액션', 152);

select * from 영화관정보;


-- 영화관정보 데이터 삽입
INSERT INTO 영화관정보 (영화관번호, 전체좌석수, 예약가능좌석수, 상영관이름) 
VALUES (1, 100, 80, 'CGV 강남');
INSERT INTO 영화관정보 (영화관번호, 전체좌석수, 예약가능좌석수, 상영관이름) 
VALUES (2, 150, 120, '롯데시네마 건대');
INSERT INTO 영화관정보 (영화관번호, 전체좌석수, 예약가능좌석수, 상영관이름) 
VALUES (3, 200, 150, '메가박스 강변');
INSERT INTO 영화관정보 (영화관번호, 전체좌석수, 예약가능좌석수, 상영관이름) 
VALUES (4, 180, 140, 'CGV 용산');
INSERT INTO 영화관정보 (영화관번호, 전체좌석수, 예약가능좌석수, 상영관이름) 
VALUES (5, 120, 100, 'CGV 청담');
INSERT INTO 영화관정보 (영화관번호, 전체좌석수, 예약가능좌석수, 상영관이름) 
VALUES (6, 160, 120, '롯데시네마 월드타워');

desc 좌석정보;

-- 좌석정보 데이터 삽입
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치) 
VALUES (1, 1, 'A1');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치) 
VALUES (2, 1, 'A2');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치) 
VALUES (3, 2, 'B1');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치) 
VALUES (4, 2, 'B2');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치 ) 
VALUES (5, 3, 'C1');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치 ) 
VALUES (6, 3, 'C2');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치 ) 
VALUES (7, 4, 'D1');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치 ) 
VALUES (8, 4, 'D2');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치 ) 
VALUES (9, 1, 'A3');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치 ) 
VALUES (10, 2, 'B3');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치 ) 
VALUES (11, 3, 'C3');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치 ) 
VALUES (12, 4, 'D3');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치) 
VALUES (13, 5, 'E1');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치) 
VALUES (14, 5, 'E2');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치) 
VALUES (15, 6, 'F1');
INSERT INTO 좌석정보 (좌석번호, 영화관번호, 좌석위치) 
VALUES (16, 6, 'F2');

select * from 좌석정보;

-- 상영정보 데이터 삽입
INSERT INTO 상영정보 (상영번호, 영화관번호, 영화번호, 상영시간) 
VALUES (1, 1, 1, TO_DATE('2024-09-15 14:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO 상영정보 (상영번호, 영화관번호, 영화번호, 상영시간) 
VALUES (2, 2, 2, TO_DATE('2024-09-16 18:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO 상영정보 (상영번호, 영화관번호, 영화번호, 상영시간) 
VALUES (3, 3, 3, TO_DATE('2024-09-17 16:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO 상영정보 (상영번호, 영화관번호, 영화번호, 상영시간) 
VALUES (4, 4, 4, TO_DATE('2024-09-18 19:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO 상영정보 (상영번호, 영화관번호, 영화번호, 상영시간) 
VALUES (5, 5, 5, TO_DATE('2024-09-19 16:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO 상영정보 (상영번호, 영화관번호, 영화번호, 상영시간) 
VALUES (6, 6, 6, TO_DATE('2024-09-20 19:00', 'YYYY-MM-DD HH24:MI'));
-- 상영정보 추가 데이터 삽입
INSERT INTO 상영정보 (상영번호, 영화관번호, 영화번호, 상영시간) 
VALUES (7, 1, 2, TO_DATE('2024-09-21 14:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 상영정보 (상영번호, 영화관번호, 영화번호, 상영시간) 
VALUES (8, 2, 3, TO_DATE('2024-09-22 16:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 상영정보 (상영번호, 영화관번호, 영화번호, 상영시간) 
VALUES (9, 3, 4, TO_DATE('2024-09-23 18:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 상영정보 (상영번호, 영화관번호, 영화번호, 상영시간) 
VALUES (10, 4, 5, TO_DATE('2024-09-24 20:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 상영정보 (상영번호, 영화관번호, 영화번호, 상영시간) 
VALUES (11, 5, 6, TO_DATE('2024-09-25 19:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 상영정보 (상영번호, 영화관번호, 영화번호, 상영시간) 
VALUES (12, 6, 1, TO_DATE('2024-09-26 21:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 상영정보 (상영번호, 영화관번호, 영화번호, 상영시간) 
VALUES (13, 1, 3, TO_DATE('2024-09-27 14:00', 'YYYY-MM-DD HH24:MI'));

desc 예매표정보;

select * from 상영정보;

-- 예매표정보 데이터 삽입 (상영시간 포함)
INSERT INTO 예매표정보 (예매번호, 좌석번호, 예매일자, 예매수량, 고객번호, 영화번호, 영화관번호, 상영시간) 
VALUES (1, 1, TO_DATE('2024-09-12', 'YYYY-MM-DD'), 2, 1, 1, 1, TO_DATE('2024-09-15 14:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 예매표정보 (예매번호, 좌석번호, 예매일자, 예매수량, 고객번호, 영화번호, 영화관번호, 상영시간) 
VALUES (2, 4, TO_DATE('2024-09-13', 'YYYY-MM-DD'), 1, 3, 2, 2, TO_DATE('2024-09-16 18:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 예매표정보 (예매번호, 좌석번호, 예매일자, 예매수량, 고객번호, 영화번호, 영화관번호, 상영시간) 
VALUES (3, 6, TO_DATE('2024-09-14', 'YYYY-MM-DD'), 1, 4, 3, 3, TO_DATE('2024-09-17 16:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 예매표정보 (예매번호, 좌석번호, 예매일자, 예매수량, 고객번호, 영화번호, 영화관번호, 상영시간) 
VALUES (4, 8, TO_DATE('2024-09-15', 'YYYY-MM-DD'), 2, 2, 4, 4, TO_DATE('2024-09-18 19:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 예매표정보 (예매번호, 좌석번호, 예매일자, 예매수량, 고객번호, 영화번호, 영화관번호, 상영시간) 
VALUES (5, 10, TO_DATE('2024-09-16', 'YYYY-MM-DD'), 1, 1, 5, 5, TO_DATE('2024-09-19 16:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 예매표정보 (예매번호, 좌석번호, 예매일자, 예매수량, 고객번호, 영화번호, 영화관번호, 상영시간) 
VALUES (6, 12, TO_DATE('2024-09-16', 'YYYY-MM-DD'), 2, 5, 6, 6, TO_DATE('2024-09-20 19:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 예매표정보 (예매번호, 좌석번호, 예매일자, 예매수량, 고객번호, 영화번호, 영화관번호, 상영시간) 
VALUES (7, 2, TO_DATE('2024-09-17', 'YYYY-MM-DD'), 1, 3, 1, 1, TO_DATE('2024-09-21 14:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 예매표정보 (예매번호, 좌석번호, 예매일자, 예매수량, 고객번호, 영화번호, 영화관번호, 상영시간) 
VALUES (8, 5, TO_DATE('2024-09-18', 'YYYY-MM-DD'), 2, 4, 2, 2, TO_DATE('2024-09-22 16:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 예매표정보 (예매번호, 좌석번호, 예매일자, 예매수량, 고객번호, 영화번호, 영화관번호, 상영시간) 
VALUES (9, 7, TO_DATE('2024-09-19', 'YYYY-MM-DD'), 1, 6, 3, 3, TO_DATE('2024-09-23 18:00', 'YYYY-MM-DD HH24:MI'));

INSERT INTO 예매표정보 (예매번호, 좌석번호, 예매일자, 예매수량, 고객번호, 영화번호, 영화관번호, 상영시간) 
VALUES (10, 9, TO_DATE('2024-09-20', 'YYYY-MM-DD'), 1, 2, 4, 4, TO_DATE('2024-09-24 20:00', 'YYYY-MM-DD HH24:MI'));

select * from 예매표정보;


--1.특정 고객 예매 내역 조회
SELECT  
    고객정보.고객이름,
    고객정보.핸드폰번호,
    영화정보.영화이름,
    TO_CHAR(상영정보.상영시간, 'YYYY-MM-DD HH24:MI') AS 상영시간,
    좌석정보.좌석위치,
    예매표정보.예매수량,
    TO_CHAR(예매표정보.예매일자, 'YYYY-MM-DD') AS 예매일자
FROM 
    예매표정보
JOIN
    고객정보 ON 예매표정보.고객번호 = 고객정보.고객번호
JOIN 
    영화정보 ON 예매표정보.영화번호 = 영화정보.영화번호
JOIN
    상영정보 ON 예매표정보.상영시간 = 상영정보.상영시간
JOIN
    좌석정보 ON 예매표정보.좌석번호 = 좌석정보.좌석번호;

--2.특정 영화관의 상영 영화
SELECT 
    영화관정보.상영관이름,
    영화정보.영화이름,
    상영정보.상영시간
FROM 
    상영정보
JOIN 
    영화관정보 ON 상영정보.영화관번호 = 영화관정보.영화관번호
JOIN 
    영화정보 ON 상영정보.영화번호 = 영화정보.영화번호
WHERE 
    영화관정보.상영관이름 = 'CGV 강남';

--3. 영화별 예매 내역 조회
SELECT 
    영화정보.영화이름,
    좌석정보.좌석위치,
    고객정보.고객이름,
    예매표정보.예매일자
FROM 
    예매표정보
JOIN 
    영화정보 ON 예매표정보.영화번호 = 영화정보.영화번호
JOIN 
    좌석정보 ON 예매표정보.좌석번호 = 좌석정보.좌석번호
JOIN 
    고객정보 ON 예매표정보.고객번호 = 고객정보.고객번호
WHERE 
    영화정보.영화번호 = 1;
    
--4. 영화별 예매 수량 조회
SELECT 
    영화정보.영화이름,
    COUNT(예매표정보.예매번호) AS 총예매건수
FROM 
    예매표정보
JOIN 
    영화정보 ON 예매표정보.영화번호 = 영화정보.영화번호
GROUP BY 
    영화정보.영화이름;

--5. 특정 날짜 이후 영화 상영 목록 조회
SELECT 
    영화정보.영화이름,
    영화관정보.상영관이름,
    상영정보.상영시간
FROM 
    상영정보
JOIN 
    영화정보 ON 상영정보.영화번호 = 영화정보.영화번호
JOIN 
    영화관정보 ON 상영정보.영화관번호 = 영화관정보.영화관번호
WHERE 
    상영정보.상영시간 > TO_DATE('2024-09-14', 'YYYY-MM-DD HH24:MI');

select * from 좌석정보;
select * from 예매표정보;

--7. 특정 영화관 예약가능좌석 조회
SELECT 
    영화관정보.상영관이름,
    좌석정보.좌석위치,
    CASE 
        WHEN 좌석정보.좌석위치 IN (SELECT 좌석위치 FROM 예매표정보 JOIN 좌석정보 ON 예매표정보.좌석번호 = 좌석정보.좌석번호)
        THEN '예약됨'
        ELSE '예약가능'
    END AS 좌석상태
FROM 
    좌석정보
JOIN 
    영화관정보 ON 좌석정보.영화관번호 = 영화관정보.영화관번호
where
    영화관정보.영화관번호 = 1;

--8. 특정 영화 예매 고객 조회

