--1. 모든 정보 조회
select * from member_tbl_11;

--2. 모든 고객의 이름과 생일 정보 조회
select m_name, m_birthday
from member_tbl_11;

--3. 이름이 박해수인 고객아이디, 생일, 포인트  정보 조회
select m_id, m_birthday, m_point
from member_tbl_11
where m_name = '박해수';

--4. 포인트가 2000점 이상인 고객이름, 전화번호  정보 조회
select m_name, m_tel
from member_tbl_11
where m_point >= 2000;

--5. 포인트가 2000점에서 3000점 사이의 고객이름, 전화번호 정보 조회
select m_name, m_tel
from member_tbl_11
where m_point between 2000 and 3000;

--6. 고객등급이 ‘01’인 고객이름, 전화번호 , 포인트 정보 조회
select m_name, m_tel, m_point
from member_tbl_11
where m_grade = '01';

--7. 생일이 2004-06-01 이후인 고객이름 전화번호 정보 조회
select m_name, m_tel, m_birthday
from member_tbl_11
where m_birthday > '2004-06-01';

--8. 생일이 2004-05-01이전에 태어난 고객의 고객이름 , 생일 정보 조회
select m_name, m_birthday
from member_tbl_11
where m_birthday < '2004-05-01';

--9. 고객등급이 ‘01’이 아닌 고객의 고객이름, 전화번호, 고객등급 정보 조회
select m_name, m_tel, m_grade
from member_tbl_11
where m_grade not in('01');

--10. 고객 등급이 ‘02’ 인  고객의 고객아이디, 이름, 전화번호 정보 조회
select m_id, m_name, m_tel
from member_tbl_11
where m_grade = '02';

--11. 포인트가 1500점 미만인  고객의  고객이름, 전화번호 조회
select m_name, m_tel
from member_tbl_11
where m_point < 1500;

--12. 포인트가 적립되지 않은 고객정보 조회
select * 
from member_tbl_11
where m_point is null;

--13. 포인트가 부여된 (포인트 금액을 가지고 있는) 고객정보 조회
select *
from member_tbl_11
where m_point is not null;

--14. 고객등급이 중복되지 않도록 고객등급을 조회
select DISTINCT m_grade
from member_tbl_11;








