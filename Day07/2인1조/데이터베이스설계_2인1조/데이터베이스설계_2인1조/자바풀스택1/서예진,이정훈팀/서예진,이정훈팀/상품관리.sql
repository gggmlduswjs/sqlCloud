--회원정보
create table u_info(
u_id varchar2(15) primary key,
name varchar2(30) not null,
adress varchar2(30) not null,
tel varchar2(15) check(tel like '010-%-%'),
gender varchar2(1) check(gender in('M','F'))
);

insert into u_info values('aaa111', '홍길동','서울시 마포구', '010-2323-1212','F');
insert into u_info values('bbb222', '김길동','서울시 서초구', '010-3434-4545','M');
insert into u_info values('ccc333', '한길동','서울시 구로구', '010-5656-6767','M');
insert into u_info values('ddd444', '심길동','서울시 종로구', '010-7878-8989','F');
insert into u_info values('eee555', '고길동','서울시 은평구', '010-9090-0101','F');

--상품정보
create table product_tbl(
	goods_code varchar2(20) primary key,
	brand_name varchar2(100) not null,
	goods_name varchar2(100) not null,
	category varchar2(20) check(category in('상의','바지','아우터','스커트')),
	g_size varchar2(5) check(g_size in('S','M','L','XL')),
	price number(38) not null
);
insert into product_tbl values('P001','Mardi Mercredi' , 'SWEATSHIRT FLOWERMARDI_BLACK PINK','상의','M',75000);
insert into product_tbl values('P002','BROWNBREATH' ,'TAG KP TEE - BLACK' ,'상의' ,'S',36000);
insert into product_tbl values('P003', 'MARITHE', 'W CLASSIC LOGO TEE white','상의', 'L', 45000);

insert into product_tbl values('P004', 'WOOALONG', 'Signature relax wide pants - BLACK','바지','S',79000);
insert into product_tbl values('P005', 'TRILLION' ,'바이오스톤 워싱 섬머 쿨 와이드 데님 팬츠 (SUMMER BLUE)','바지','L',54000);
insert into product_tbl values('P006','ILLIGO','스트링 카고 밴딩 팬츠 브라운','바지','XL',112000);
insert into product_tbl values('P007', 'ADIDAS','파이어버드 트랙탑 - 블랙','아우터','L',99000);

insert into product_tbl values('P008', 'NACHE','SHIRRING LEATHER JACKET (UNISEX / BLACK)','아우터','M',206000);
insert into product_tbl values('P009', 'CPGN STUDIO','크래킹 후드 윈드브레이커 그레이','아우터','S',110000);

insert into product_tbl values('P010', 'KOLEAT','여름 쿨링 바스락 카고 밴딩 미니스커트' ,'스커트','S',52000);
insert into product_tbl values('P011', 'MIXXO','플리츠 미디 스커트','스커트','M',59900);
insert into product_tbl values('P012', 'IST KUNST', '스크리블 로고 스웻 스커트_그레이','스커트','XL',59000);

--주문정보
create table goods_order(
order_code varchar2(20) primary key,
id varchar2(15) not null
constraint id_fk references u_info(u_id),
goods_code varchar2(4) not null
constraint goods_code_fk references product_tbl(goods_code),
goods_cnt number(2) not null
);

insert into goods_order values('G001', 'aaa111', 'P001', 2);
insert into goods_order values('G002', 'ccc333', 'P003', 3);
insert into goods_order values('G003', 'bbb222', 'P002', 1);
insert into goods_order values('G004', 'eee555', 'P006', 1);
insert into goods_order values('G005', 'ddd444', 'P006', 4);
insert into goods_order values('G006', 'eee555', 'P010', 2);
insert into goods_order values('G007', 'aaa111', 'P002', 3);
insert into goods_order values('G008', 'bbb222', 'P004', 1);
insert into goods_order values('G009', 'ddd444', 'P003', 6);
insert into goods_order values('G010', 'ddd444', 'P009', 5);

select 
          o.order_code 주문코드,
          p.GOODS_CODE 상품코드,
          u.U_ID 아이디,
          p.GOODS_NAME 상품명,
          p.CATEGORY 카테고리,
          p.G_SIZE 사이즈,
          to_char(p.PRICE, '999,999')  가격,
          u.NAME 이름,
          u.ADRESS 주소,
          u.TEL 전화번호,
          o.goods_cnt 주문수량
from goods_order o
join product_tbl p
on o.goods_code = p.goods_code
join u_info u
on o.id = u.u_id;

