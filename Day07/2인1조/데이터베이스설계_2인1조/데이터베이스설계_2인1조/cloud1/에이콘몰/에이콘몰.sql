CREATE TABLE user_100 (
	id varchar2(20) primary key,
	name varchar2(20) not null,
	phone varchar2(13) not null check(phone like '010-____-____'),
	address varchar2(100) not null,
	gender varchar2(1) check(gender in ('M', 'F')),
    height number(3),
	weight number(3)
);

CREATE TABLE brand_100 (
	brand_no varchar2(10) primary key,
	name varchar2(30) not null
);

CREATE TABLE product_100 (
	product_no varchar2(10) primary key,
	brand_no varchar2(10) references brand_100(brand_no),
	name varchar2(50) not null,
	category varchar2(30) not null,
	price number(10) not null
);

CREATE TABLE order_100 (
	order_id varchar2(10) primary key,
	user_id varchar2(20) references user_100(id),
	order_date date not null
);

CREATE TABLE order_item_100 (
	item_no varchar2(10) primary key,
	order_id varchar2(10) references order_100(order_id),
	product_no varchar2(10) references product_100(product_no),
	quantity number(3) not null check(quantity > 0),
	item_size varchar2(10) not null
);

CREATE TABLE review_100 (
	review_id varchar2(10) primary key,
    user_id varchar2(20) references user_100(id),
    product_no varchar2(10) references product_100(product_no),
    item_no varchar2(10) references order_item_100(item_no),
	content varchar2(200) not null,
	rating varchar2(3) not null check(rating in ('1.0', '1.5', '2.0', '2.5', '3.0', '3.5', '4.0', '4.5', '5.0'))
);



insert into user_100(id, name, phone, address , gender, weight, height) values('universe21', '유다은', '010-1111-2222', '서울시', 'F', 160, 46);
insert into user_100 (id, name, phone, address , gender, weight, height) values('eclipse33', '손현우', '010-1223-4434', '부산', 'M', 180, 68);
insert into user_100 (id, name, phone, address , gender, weight, height) values('latest665', '백준우', '010-5555-3333', '대전광역시', 'M', 175, 70);
insert into user_100 (id, name, phone, address , gender, weight, height) values('quadra9965', '서수현', '010-0000-1133', '강원도 강릉시', 'F', 165, 54);
insert into user_100 (id, name, phone, address , gender, weight, height) values('ummm111', '엄준식', '010-6666-6666', '서울특별시', 'M', 180, 60);
insert into user_100 (id, name, phone, address) values('maga2024', '도널드 트럼프', '010-8888-8888', '뉴욕');
insert into user_100 (id, name, phone, address) values('biden2024', '조 바이든', '010-9999-9999', '시카고');
insert into user_100 (id, name, phone, address) values('northkoreano1', '김정은', '010-2222-7777', '평양');
insert into user_100 (id, name, phone, address) values('chinano999', '시진핑', '010-6366-6635', '베이징');
insert into user_100 (id, name, phone, address) values('bol04', '안지영', '010-0404-0404', '서울 강남구');

insert into brand_100 (brand_no, name) values('b001', '토마스모어');
insert into brand_100 (brand_no, name) values('b002', '러프사이드');
insert into brand_100 (brand_no, name) values('b003', '디스이즈네버댓');
insert into brand_100 (brand_no, name) values('b004', '어나더오피스');
insert into brand_100 (brand_no, name) values('b005', '그라미치');

insert into product_100 (product_no, brand_no, name, category, price) values('p001', 'b001', 'TE5-SH07 페이퍼셔츠', '상의', 59700);
insert into product_100 (product_no, brand_no, name, category, price) values('p002', 'b002', 'Comfort Jacket Charcoal', '아우터', 188000);
insert into product_100 (product_no, brand_no, name, category, price) values('p003', 'b003', 't.n. Fleece Cap Black', '모자', 49000);
insert into product_100 (product_no, brand_no, name, category, price) values('p004', 'b004', 'Santiago Slacks (Heather Gray)', '하의', 164000);
insert into product_100 (product_no, brand_no, name, category, price) values('p005', 'b005', '루즈테이퍼드 팬츠 Olive', '하의', 129000);
insert into product_100 (product_no, brand_no, name, category, price) values('p006', 'b004', 'Daily Life Shirt', '상의', 105000);
insert into product_100 (product_no, brand_no, name, category, price) values('p007', 'b004', 'Volume Shirt', '상의', 124000);
insert into product_100 (product_no, brand_no, name, category, price) values('p008', 'b004', 'Link M51 Shorts', '하의', 111000);
insert into product_100 (product_no, brand_no, name, category, price) values('p009', 'b001', '잭 래글런 슬리브', '상의', 32700);
insert into product_100 (product_no, brand_no, name, category, price) values('p010', 'b001', '덴스 오피서 팬츠', '하의', 79500);
insert into product_100 (product_no, brand_no, name, category, price) values('p011', 'b002', 'Regular Chino Pants', '하의', 148000);
insert into product_100 (product_no, brand_no, name, category, price) values('p012', 'b002', 'Drape Denim Pants', '하의', 168000);
insert into product_100 (product_no, brand_no, name, category, price) values('p013', 'b002', 'Mild T-Shirt', '상의', 39000);
insert into product_100 (product_no, brand_no, name, category, price) values('p014', 'b003', 'T-Logo L/S Tee White', '상의', 55000);
insert into product_100 (product_no, brand_no, name, category, price) values('p015', 'b003', 'Arch-Logo Hoodie Heather', '상의', 95000);
insert into product_100 (product_no, brand_no, name, category, price) values('p016', 'b003', 'Paneled Pant Black', '하의', 139000);
insert into product_100 (product_no, brand_no, name, category, price) values('p017', 'b005', '리그 카고 팬츠', '하의', 159000);
insert into product_100 (product_no, brand_no, name, category, price) values('p018', 'b005', '라인 나일론 캡', '모자', 69000);


insert into order_100(order_id, user_id, order_date) values('o001', 'universe21', to_date('2024-07-21 13:23:11', 'YYYY-MM-DD HH24:MI:SS'));
insert into order_100 (order_id, user_id, order_date)values('o002', 'eclipse33', to_date('2024-08-02 16:27:34', 'YYYY-MM-DD HH24:MI:SS'));
insert into order_100(order_id, user_id, order_date) values('o003', 'quadra9965', to_date('2024-08-08 20:13:28', 'YYYY-MM-DD HH24:MI:SS'));
insert into order_100 (order_id, user_id, order_date)values('o004', 'latest665', to_date('2024-08-12 01:45:05', 'YYYY-MM-DD HH24:MI:SS'));
insert into order_100(order_id, user_id, order_date) values('o005', 'ummm111', to_date('2024-08-31 15:17:57', 'YYYY-MM-DD HH24:MI:SS'));
insert into order_100(order_id, user_id, order_date) values('o006', 'quadra9965', to_date('2024-08-31 17:04:59', 'YYYY-MM-DD HH24:MI:SS'));
insert into order_100(order_id, user_id, order_date) values('o007', 'bol04', to_date('2024-09-01 11:33:04', 'YYYY-MM-DD HH24:MI:SS'));
insert into order_100(order_id, user_id, order_date) values('o008', 'eclipse33', to_date('2024-09-01 13:11:11', 'YYYY-MM-DD HH24:MI:SS'));
insert into order_100(order_id, user_id, order_date) values('o009', 'eclipse33', to_date('2024-09-01 13:25:09', 'YYYY-MM-DD HH24:MI:SS'));
insert into order_100(order_id, user_id, order_date) values('o010', 'maga2024', to_date('2024-09-01 16:41:15', 'YYYY-MM-DD HH24:MI:SS'));
insert into order_100(order_id, user_id, order_date) values('o011', 'quadra9965', to_date('2024-09-02 07:05:44', 'YYYY-MM-DD HH24:MI:SS'));
insert into order_100(order_id, user_id, order_date) values('o012', 'latest665', to_date('2024-09-02 10:51:01', 'YYYY-MM-DD HH24:MI:SS'));

insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i001', 'o001', 'p001', 1, 'M');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i002', 'o001', 'p004', 1, 'L');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i003', 'o002', 'p002', 2, 'L');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i004', 'o003', 'p003', 1, 'S');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i005', 'o004', 'p004', 3, 'M');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i006', 'o005', 'p005', 1, 'L');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i007', 'o003', 'p002', 2, 'L');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i008', 'o006', 'p006', 1, 'M');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i009', 'o006', 'p012', 2, 'L');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i010', 'o006', 'p018', 3, 'M');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i011', 'o007', 'p008', 2, 'M');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i012', 'o007', 'p011', 1, 'S');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i013', 'o007', 'p013', 1, 'M');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i014', 'o007', 'p015', 2, 'L');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i015', 'o008', 'p010', 1, 'M');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i016', 'o008', 'p009', 4, 'S');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i017', 'o008', 'p016', 2, 'L');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i018', 'o009', 'p007', 1, 'M');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i019', 'o010', 'p017', 5, 'XL');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i020', 'o011', 'p014', 3, 'S');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i021', 'o012', 'p002', 1, 'M');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i022', 'o012', 'p007', 1, 'M');
insert into order_item_100 (item_no, order_id, product_no, quantity, item_size) values('i023', 'o012', 'p014', 3, 'S');



insert into review_100(review_id, user_id, product_no, item_no, content, rating) values('r001', 'latest665', 'p004', 'i005', '재질이 좋아서 마음에 들어요', '5.0');
insert into review_100(review_id, user_id, product_no, item_no, content, rating) values('r002', 'universe21', 'p001', 'i001', '깔끔하고 예쁩니다. 굿!', '4.5');
insert into review_100(review_id, user_id, product_no, item_no, content, rating) values('r003', 'quadra9965', 'p006', 'i008', '좀 크긴한데 데일리룩으로 입기 좋아요', '4.5');
insert into review_100(review_id, user_id, product_no, item_no, content, rating) values('r004', 'bol04', 'p008', 'i011', '저렴하고 예뻐요', '4.0');
insert into review_100(review_id, user_id, product_no, item_no, content, rating) values('r005', 'quadra9965', 'p002', 'i007', '조금 아쉬워요', '2.5');
insert into review_100(review_id, user_id, product_no, item_no, content, rating) values('r006', 'eclipse33', 'p002', 'i003', '마음에 듭니다', '4.5');
insert into review_100(review_id, user_id, product_no, item_no, content, rating) values('r007', 'universe21', 'p004', 'i002', '무난해요', '3.0');
insert into review_100(review_id, user_id, product_no, item_no, content, rating) values('r008', 'bol04', 'p011', 'i012', '좋습니다', '5.0');
insert into review_100(review_id, user_id, product_no, item_no, content, rating) values('r009', 'latest665', 'p014', 'i023', '사이즈가 조금 안 맞네요', '3.5');
insert into review_100(review_id, user_id, product_no, item_no, content, rating) values('r010', 'latest665', 'p007', 'i022', '배송이 조금 오래걸렸어요', '2.0');
insert into review_100(review_id, user_id, product_no, item_no, content, rating) values('r011', 'latest665', 'p002', 'i021', '잘 어울려서 좋아요', '5.0');

commit;

-- 1.전체 판매량, 판매금액
select sum(i.quantity) 판매량, sum(i.quantity * p.price) 판매금액
from order_100 o
join order_item_100 i
on o.order_id = i.order_id
join product_100 p
on i.product_no = p.product_no;

-- 2.브랜드별 판매량, 판매금액
select b.name 브랜드, sum(i.quantity) 판매량, sum(p.price * i.quantity) 판매금액
from brand_100 b
join product_100 p
on b.brand_no = p.brand_no
join order_item_100 i
on p.product_no = i.product_no
group by b.name;

-- 3.제품별 판매량, 판매금액
select p.name 제품, sum(i.quantity) 판매량, sum(i.quantity * p.price) 판매금액
from product_100 p
join order_item_100 i
on p.product_no = i.product_no
group by p.name;

-- 4.카테고리별 판매량, 판매금액
select p.category 카테고리, sum(i.quantity) 판매량, sum(p.price * i.quantity) 판매금액
from product_100 p
join order_item_100 i
on p.product_no = i.product_no
group by p.category;

-- 5.고객별 구매량, 구매금액
select u.name 고객, sum(i.quantity) 구매량, sum(i.quantity * p.price) 구매금액
from order_100 o
join order_item_100 i
on o.order_id = i.order_id
join user_100 u
on o.user_id = u.id
join product_100 p
on i.product_no = p.product_no
group by u.name;

-- 6.제품별 평균평점
select p.name 제품, round(avg(r.rating), 2) 평균평점
from review_100 r
join product_100 p
on r.product_no = p.product_no
group by p.name;


-- 7.고객별 구매량, 구매금액 (주문 하지 않은 고객 포함)
select u.name 고객, sum(nvl(i.quantity, 0)) 구매량, sum(nvl(i.quantity * p.price, 0)) 구매금액
from user_100 u
left outer join order_100 o
on u.id = o.user_id
left outer join order_item_100 i
on o.order_id = i.order_id
left outer join product_100 p
on i.product_no = p.product_no
group by u.name;