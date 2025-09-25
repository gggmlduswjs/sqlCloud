create table mp_server(
sv_code varchar2(10)
                constraint sv_code_pk1 not null primary key,
sv_name varchar2(20)
                constraint sv_name_nn1 not null
);
insert into mp_server values ('UUU', '유니온서버');
insert into mp_server values ('BBB', '버닝서버');
insert into mp_server values ('RRR', '리부트서버');
insert into mp_server values ('CCC', '크로아서버');
insert into mp_server values ('PPP', '판테온서버');

select * from mp_server;
--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
drop table mp_vip;
create table mp_vip(
grade_code varchar2(10)
constraint mp_gradetbl_pk primary key,
grade_name varchar2(20)
constraint mp_gradetbl_nn not null,
grade_dr number(10)
constraint gradetbl_dr_ck
check (grade_dr>=0)
);
insert into mp_vip values ('V001', '레드', 10);
insert into mp_vip values ('V002', '골드', 7);
insert into mp_vip values ('V003', '실버', 4);
insert into mp_vip values ('V004', '브론즈', 0);
select * from mp_vip;
--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
drop table item_cubetbl;
CREATE TABLE item_cubetbl (
  item_code varchar2(10)
    constraint item_cubetbl_pk primary key,
  item_name varchar2(20)
    constraint item_cubetbl_nn not null
    constraint item_cubetbl_uk unique,
  up_percent number(10)
    constraint cubetbl_percent_ck check (up_percent>0),
  item_price number(10)
    constraint cubetbl_price_nn not null
);

insert into item_cubetbl values('C001','블랙큐브',10,2200);
insert into item_cubetbl values('C002','레드큐브',3,1200);
insert into item_cubetbl values('C003','에디큐브',5,2400);
insert into item_cubetbl values('C004','명장큐브',2,800);
select * from item_cubetbl;
--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
drop table mp_wp;
create table mp_wp(
  wp_code varchar2(20) 
             constraint wp_pk11_  not null primary key,
   wp_cat varchar2(20) 
              constraint wp_cat_ch11__
              check (wp_cat in('앱솔랩스','파프니르','아케인',null)),
  wp_price number(20) default 0,
              constraint wp_p_ch11__ check(wp_price >= 0)
  );
  insert into mp_wp values ('w001','앱솔랩스', 5000);
  insert into mp_wp values ('w002','파프니르', 2000);
  insert into mp_wp values ('w003','아케인', 7000);
  insert into mp_wp values ('w004',null,0);
  select * from mp_wp;
--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
drop table mp_usertbl;
CREATE TABLE mp_usertbl(
user_id varchar2(20)
constraint mp_usertbl_pk primary key,
grade varchar2(10)
constraint mp_usergrade_ref references mp_vip(grade_code),
sv_code varchar2(10)
constraint mp_sv_ref references mp_server(sv_code)
);

insert into mp_usertbl values('망나니식코딩','V001','CCC');
insert into mp_usertbl values('하나빼면제로','V002','UUU');
insert into mp_usertbl values('타락파워전사','V004','BBB');
select * from mp_usertbl;
--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
drop table mp_store;
create table mp_store (
order_id varchar2(10)
                constraint order_id_pk11 not null primary key,
user_id varchar2(20)
                constraint user_id_rf11 references mp_usertbl(user_id),
item_code varchar2(10)
                constraint item_code_rf11 references item_cubetbl(item_code),
wp_code varchar2(10)
                constraint wp_code_rf11 references mp_wp(wp_code),
cnt number (10)
                constraint cnt_ck11 check (cnt > 0)
);
insert into mp_store values ('O001','망나니식코딩',null,'w001',8);
insert into mp_store values ('O002','하나빼면제로',null,'w003',9);
insert into mp_store values ('O003','타락파워전사','C001',null,10);
insert into mp_store values ('O004','망나니식코딩','C003',null,30);
insert into mp_store values ('002','망나니식코딩','C003','w002',30);
select * from mp_store;
--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


SELECT s.order_id 주문번호, u.user_id 유저아이디,v.grade_name 등급, 
    MAX(CASE
        WHEN c.item_code IS NOT NULL THEN c.item_name
        WHEN w.wp_code IS NOT NULL THEN w.wp_cat
        ELSE ''
    END) AS 상품명,
    s.cnt 주문수량,
    SUM(CASE
        WHEN c.item_code IS NOT NULL THEN c.item_price
        WHEN w.wp_code IS NOT NULL THEN w.wp_price
        ELSE 0
    END) AS 개당가격,
    SUM(CASE
        WHEN c.item_code IS NOT NULL THEN c.item_price * s.cnt
        WHEN w.wp_code IS NOT NULL THEN w.wp_price * s.cnt
        ELSE 0
    END) AS 총가격,
        SUM(CASE
        WHEN c.item_code
             IS NOT NULL THEN c.item_price * s.cnt * (1-v.grade_dr/100)
        WHEN w.wp_code
             IS NOT NULL THEN w.wp_price * s.cnt * (1-v.grade_dr/100)
        ELSE 0
    END) AS 할인가
FROM mp_store s
JOIN mp_usertbl u ON s.user_id = u.user_id
LEFT JOIN item_cubetbl c ON s.item_code = c.item_code
LEFT JOIN mp_wp w ON s.wp_code = w.wp_code
JOIN mp_vip v ON u.grade = v.grade_code
GROUP BY s.order_id, u.user_id, v.grade_name, s.cnt;




