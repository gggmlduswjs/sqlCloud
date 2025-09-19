select * from member_tbl_11;

--1. 고객등급이 ‘01’이고 포인트가 2000이상인 고객의 아이디, 이름 정보를 조회
select m_id, m_name
from member_tbl_11
where m_grade = '01' and m_point >= 2000;

--2. 고객등급이 ‘01’ 이거나 포인트가 2000이상인 고객의 아이디, 이름 정보를 조회
select m_id, m_name
from member_tbl_11
where m_grade = '01' or m_point >= 2000;

--3. 김씨성을 가진 고객의 아이디, 이름, 등급 정보를 조회
select m_id, m_name, m_grade
from member_tbl_11
where m_name like '김%';

-- 4. 이름이 수로 끝나는 고객의 아이디, 이름 , 등급 정보를 조회
select m_id, m_name, m_grade
from member_tbl_11
where m_name like '%수';

--5. 고객등급이 ‘01’, ‘03’ 인 고객의 아이디, 이름, 등급 정보를 조회 (IN 연산자 사용)
select m_id, m_name, m_grade
from member_tbl_11
where m_grade in ('01', '03');

--6. 고객등급이 ‘01’, ‘02’ 이 아닌 고객의 아이디, 이름, 등급 정보를 조회 (NOT IN 연산자 사용)
select m_id, m_name, m_grade
from member_tbl_11
where m_grade not in('01', '02');

-- 7. 고객등급이 ‘02’ 이거나 이름이 이씨성을 가진 고객의 정보의 아이디와 이름 , 등급 정보를 조회
select m_id, m_name, m_grade
from member_tbl_11
where m_grade = '02' or m_name like '이%';

--8. 생일이 2004-05-01이전에 태어나거나 고객등급이 ‘03’인 고객의 아이디, 이름, 생일 정보를 조회
select m_id, m_name, m_birthday
from member_tbl_11
where m_birthday < '2004-05-01' or m_grade = '03';













