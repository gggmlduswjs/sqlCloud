-- 고객 테이블 생성
create table custom_tbl(
    custom_id varchar2(20) primary key,
    custom_nm varchar2(20) not null,
    custom_gender varchar2(10) not null,
    custom_phone varchar2(15) check (custom_phone like '010-%-____') not null);

    insert into custom_tbl values ('Back','백바울','남','010-1111-2222');
    insert into custom_tbl values ('Song','송병화','남','010-2222-3333');
    insert into custom_tbl values ('Yoo','우주연','여','010-3333-4444');
    insert into custom_tbl values ('Choi','최종훈','남','010-3394-5544');
    insert into custom_tbl values ('Shin','신예원','여','010-2333-4004');
    insert into custom_tbl values ('Lim','임진아','여','010-2593-5954');
    insert into custom_tbl values ('Jang','장동현','남','010-3498-3984');
    insert into custom_tbl values ('Gil','최문길','남','010-3903-4408');
    insert into custom_tbl values ('Yong','용지민','남','010-3322-9084');
    insert into custom_tbl values ('Soobin','송수빈','여','010-1923-4878');
    
    commit;
    
-- 주문 테이블 생성
create table order_tbl(
    order_no number(10) primary key,
    book_id varchar2(50) 
        references book_tbl (book_id)
        on delete cascade,
    custom_id varchar2(20) 
        references custom_tbl (custom_id)
        on delete cascade,
    order_date date default sysdate,
    order_qnt number(3) not null);

    insert into order_tbl(order_no, book_id, custom_id,order_qnt) values('2024091101' , 'A0003' , 'Song' , 1);
    insert into order_tbl(order_no, book_id, custom_id,order_qnt) values('2024091102' , 'A0001' , 'Song' , 1);
    insert into order_tbl(order_no, book_id, custom_id,order_qnt) values('2024091103' , 'A0005' , 'Yoo' , 2);
    insert into order_tbl(order_no, book_id, custom_id,order_qnt) values('2024091104' , 'A0001' , 'Back' , 2);
    insert into order_tbl(order_no, book_id, custom_id,order_qnt) values('2024091105' , 'A0004' , 'Yoo' , 1);
    insert into order_tbl(order_no, book_id, custom_id,order_qnt) values('2024091106' , 'A0002' , 'Back' , 1);
    insert into order_tbl values('2024090901' , 'A0007' , 'Choi' ,'24/09/09', 2);
    insert into order_tbl values('2024090902' , 'A0008' , 'Shin' ,'24/09/09', 1);
    insert into order_tbl values('2024090903' , 'A0006' , 'Gil' ,'24/09/09', 3);
    insert into order_tbl values('2024090904' , 'A0009' , 'Jang' ,'24/09/09', 1);
    insert into order_tbl values('2024090905' , 'A0004' , 'Yong' ,'24/09/09', 2);
    insert into order_tbl values('2024091001' , 'A0010' , 'Lim' ,'24/09/10', 2);
    insert into order_tbl values('2024091002' , 'A0005' , 'Lim' ,'24/09/10', 1);
    insert into order_tbl values('2024091003' , 'A0009' , 'Song' ,'24/09/10', 2);
    insert into order_tbl values('2024091004' , 'A0003' , 'Shin' ,'24/09/10', 1);
    insert into order_tbl values('2024091005' , 'A0004' , 'Gil' ,'24/09/10', 1);
    insert into order_tbl values('2024091006' , 'A0010' , 'Yoo' ,'24/09/10', 1);
    
    commit;
        
-- 책 테이블 생성
create table book_tbl(
    book_id varchar2(50) primary key,
    book_nm varchar2(100) not null,
    book_author varchar2(30) not null,
    book_price number(10) not null);
    
    insert into book_tbl values('A0001' , '빛이 이끄는 곳으로' , '백희성' , 18800);
    insert into book_tbl values('A0002' , '언젠가 우리가 같은 별을 바라본다면' , '차인표' , 12000);
    insert into book_tbl values('A0003' , '영원한 천국' , '정유정' , 19800);
    insert into book_tbl values('A0004' , '고전이 답했다 마땅히 살아야 할 삶에 대하여' , '고명환' , 16800);
    insert into book_tbl values('A0005' , '가벼운 고백(풋사과 책갈피 에디션)' , '김영민' , 18800);
    insert into book_tbl values('A0006' , '이중 하나는 거짓말' , '김애란' , 16000);
    insert into book_tbl values('A0007' , '해커스 토익 기출 VOCA(보카)' , 'David Cho' , 12900);
    insert into book_tbl values('A0008' , '트렌드 코리아 2025' , '김난도' , 20000);
    insert into book_tbl values('A0009' , '자기주관으로 나의 언어를 만들어라' , '요시타니 고로' , 18500);
    insert into book_tbl values('A0010' , '당신이 누군가를 죽였다' , '히가시노 게이고' , 19800);
    
    commit;
    
-- 장르 테이블 생성
    CREATE TABLE book_genre (
    book_id     VARCHAR2(50) references book_tbl(book_id),
    genre     VARCHAR2(100) NOT NULL
);
    
    insert into book_genre values('A0001','공포');
    insert into book_genre values('A0001','추리');
    insert into book_genre values('A0002','로맨스');
    insert into book_genre values('A0003','판타지');
    insert into book_genre values('A0004','과학');
    insert into book_genre values('A0004','추리');
    insert into book_genre values('A0005','무협');
    insert into book_genre values('A0006','게임');
    insert into book_genre values('A0007','과학');
    insert into book_genre values('A0008','로맨스');
    insert into book_genre values('A0008','스릴러');
    insert into book_genre values('A0009','게임');
    insert into book_genre values('A0010','추리');
    
    commit;
    
-- 고객별 구매금액에 따른 등급 조회
select c.custom_id, to_char(nvl(sum(o.order_qnt*b.book_price),0),'999,999')||'원' 구매금액,
        case when sum(o.order_qnt*b.book_price) >= 70000 then 'GOLD'
             when sum(o.order_qnt*b.book_price) >= 40000 then 'SILVER'
             else 'BRONZE'
             end 등급
from order_tbl o 
join book_tbl b
on o.book_id = b.book_id
right outer join custom_tbl c
on o.custom_id = c.custom_id
group by c.custom_id
order by 2 desc;


-- 책별 판매내역 조회

select o.book_id, b.book_nm 제목, to_char(sum(b.book_price*o.order_qnt),'999,999')||'원' 판매금액,
        dense_rank() over(order by sum(b.book_price*o.order_qnt) desc) 판매순위
from order_tbl o
join book_tbl b
on o.book_id = b.book_id 
group by o.book_id, b.book_nm;


-- 일별 판매내역 조회

select to_date(o.order_date, 'YY-MM-DD') 주문일자, to_char(sum(o.order_qnt*b.book_price), '999,999' ) || '원' 판매금액
from order_tbl o
join book_tbl b
on o.book_id = b.book_id
group by to_date(o.order_date, 'YY-MM-DD')
order by 1;


-- 남녀별 판매 내역
select c.custom_gender 성별, to_char(sum(a.total), '999,999')||'원' 판매금액
from custom_tbl c
join
(
    select o.custom_id , sum(order_qnt*book_price) total
    from order_tbl o
    join book_tbl b
    on o.book_id = b.book_id
    group by o.custom_id
) a
on c.custom_id = a.custom_id
group by c.custom_gender;



--책 테이블 장르 포함해서 출력
select b.book_id, b.book_nm 제목, b.book_author 저자, to_char(b.book_price, '999,999')||'원' 가격, g.genre 장르
from book_tbl b
join (select book_id, LISTAGG(genre, ',') within group (order by genre) AS genre
from book_genre
group by book_id) g
on b.book_id = g.book_id;


--장르별 판매량 순위
select rank() over(order by sum(o.order_qnt) desc) 순위,sum(o.order_qnt) 판매수량, g.genre 장르
from order_tbl o
join book_tbl b 
on o.book_id = b.book_id
join book_genre g
on b.book_id = g.book_id
group by genre
order by sum(o.order_qnt) desc;

--장르별 가장 많이 팔린 책

select book_nm "장르별 베스트셀러", genre 장르
from 
(
    select b.book_nm,sum(o.order_qnt),g.genre, row_number() over(partition by genre order by sum(o.order_qnt) desc) rank
    from order_tbl o
    join book_tbl b
    on o.book_id = b.book_id
    join book_genre g
    on b.book_id = g.book_id 
    group by b.book_nm,g.genre
)
where rank = 1;
