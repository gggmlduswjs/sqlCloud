
----메뉴정보----

CREATE TABLE mc_menu(

menu_code      VARCHAR2(4) NOT NULL PRIMARY KEY ,
menu_set       VARCHAR2(50) default '판매중지' UNIQUE ,
menu_price     number(10) check (menu_price > 0)
);

insert into mc_menu values ('A001' , '불고기버거세트' , '8900' );
insert into mc_menu values ('A002' , '빅맥세트' , '9300' );
insert into mc_menu values ('A003' , '치즈버거세트' , '7000' );
insert into mc_menu values ('A004' , '창녕갈릭버거세트' , '12000' );
insert into mc_menu values ('A005' , '더블쿼터파운더세트' , '12000' );
insert into mc_menu(MENU_CODE, MENU_PRICE) values ('A006','7200' );


----고객정보----

CREATE TABLE MC_customer(

 cust_code varchar(5) not null primary key ,
 cust_name varchar(20) not null ,
 cust_adress varchar (50)
 );
 
 
insert into mc_customer values ('B001' , '김민규' , '강서구 우주빌라' );
insert into mc_customer values ('B002' , '김민우' , '양천구 한성아파트' );
insert into mc_customer values ('B003' , '김민수' , '은평구 신아빌라' );
insert into mc_customer values ('B004' , '김민주' , '마포구 신아빌라' );
insert into mc_customer values ('B005' , '김민후' , '강남구 롯데캐슬' );
COMMIT;




----주문 정보----

CREATE TABLE MC_ORDER(

ORDER_CODE VARCHAR2(5) NOT NULL PRIMARY KEY ,
ORDER_M_CODE VARCHAR2(5) NOT NULL ,
ORDER_C_CODE VARCHAR2(5) NOT NULL ,
order_S_CODE varchar2(5) not null,
ORDER_SALE_CNT NUMBER CHECK ( ORDER_SALE_CNT > 0 )



);

insert into MC_ORDER values ('C001' , 'A001' , 'B001','P001' ,5);
insert into MC_ORDER values ('C002' , 'A002' , 'B004','P004' ,1);
insert into MC_ORDER values ('C003' , 'A002' , 'B003','P003' ,1);
insert into MC_ORDER values ('C004' , 'A003' , 'B002','P002' ,2);
insert into MC_ORDER values ('C005' , 'A004' , 'B005','P005' ,1);
insert into MC_ORDER values ('C006' , 'A002' , 'B002','P002' ,2);
insert into MC_ORDER values ('C007' , 'A003' , 'B004','P004' ,3);
insert into MC_ORDER values ('C008' , 'A005' , 'B001','P001' ,1);
insert into MC_ORDER values ('C009' , 'A001' , 'B002','P002' ,1);



----매장정보----

create table mc_store_loc (
  store_code varchar2(5) not null primary key ,
  store_loc  VARCHAR2(20) not null UNIQUE
);

insert into mc_store_loc values ('P001' , '강서점');
insert into mc_store_loc values ('P002' , '양천점');
insert into mc_store_loc values ('P003' , '은평점');
insert into mc_store_loc values ('P004' , '마포점');
insert into mc_store_loc values ('P005' , '강남점');
COMMIT;


---비상시 사용---
DROP TABLE MC_MENU; 
DROP TABLE MC_CUSTOMER;
DROP TABLE MC_ORDER;
drop table mc_store_loc;
-----------------

SELECT * FROM MC_MENU;
SELECT * FROM MC_CUSTOMER;
SELECT * FROM MC_ORDER;
select * from mc_store_loc;









select 
m.MENU_SET AS 메뉴이름,
TO_CHAR(m.MENU_PRICE, '999,999')||'원' AS 메뉴가격,

-- 고객이름 암호화--

SUBSTR(c.CUST_NAME, 1, 1) || '**' as 고객이름,

c.CUST_ADRESS AS 고객주소,


o.ORDER_SALE_CNT AS 주문수량,
o.ORDER_M_CODE AS 메뉴코드,
o.ORDER_CODE AS 주문코드 ,
o.ORDER_C_CODE AS 고객코드,
o.ORDER_S_CODE AS 매장코드,



s.STORE_LOC AS 매장명,
to_char(SUM(m.menu_price * o.ORDER_SALE_CNT), '999,999') || '원' AS 매출액

from mc_order o
join MC_CUSTOMER c on o.ORDER_C_CODE = c.CUST_CODE
join MC_MENU m on o.ORDER_M_CODE=m.MENU_CODE
JOIN MC_STORE_LOC s on o.ORDER_S_CODE= s.STORE_CODE

group by 
s.STORE_LOC,
m.MENU_SET,
m.MENU_PRICE,
c.CUST_NAME,
c.CUST_ADRESS,
o.ORDER_SALE_CNT,
o.ORDER_M_CODE,
o.ORDER_CODE,
o.ORDER_C_CODE,
o.ORDER_S_CODE;


-- 매장별 매출액 --

select 
s.STORE_LOC AS 매장명,
to_char(SUM(m.menu_price * o.ORDER_SALE_CNT), '999,999') || '원' AS 매출액

from mc_order o
join MC_MENU m on o.ORDER_M_CODE=m.MENU_CODE
JOIN MC_STORE_LOC s on o.ORDER_S_CODE= s.STORE_CODE

group by s.STORE_LOC;
