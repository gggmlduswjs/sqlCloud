-- 미용실 - 김민지

-- 디자이너
create table designer_list(
  des_id varchar2(20) not null primary key,
  des_name varchar2(20) not null,
  des_tel varchar2(20) check(des_tel like '010-%-____') unique,
  des_salary number(20),
  des_career varchar(20) not null,
  des_rank varchar(20) not null
);
commit;

insert into designer_list values('D001','디자이너1','010-1111-2222',200,'1년','초급');
insert into designer_list values('D002','디자이너2','010-3233-2232',300,'5년','중급');
insert into designer_list values('D003','디자이너3','010-5866-6757',400,'10년','고급');
commit;

select * from designer_list;

-- 업데이트
update designer_list
set des_tel='010-5858-7979'
where des_id='D003';
commit;
------------------------------------------------------------------

-- 고객
create table customer_list(
  cus_id varchar2(20) not null primary key,
  cus_name varchar2(20) not null,
  cus_tel varchar2(20) check(cus_tel like '010-%-____') unique,
  cus_designer_id varchar2(20) references designer_list(des_id),
  cus_want_hair varchar2(20) not null
);
commit;

-- 테이블 수정
alter table customer_list modify cus_id varchar2(15);
alter table customer_list rename column cus_designer_id to cus_des_id;
alter table customer_list add (adder varchar2(50));
alter table customer_list drop column adder;

insert into customer_list values('A001','김민지','010-1234-5678','D001','파마');
insert into customer_list values('A002','박지현','010-2222-3333','D002','염색');
insert into customer_list values('A003','박나윤','010-3333-5555','D003','커트');
insert into customer_list values('A004','박나래','010-6666-7777','D002','매직');
insert into customer_list values('A005','손성경','010-8888-9999','D003','붙임머리');
commit;

select * from customer_list;