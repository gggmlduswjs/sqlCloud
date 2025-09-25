create table 공연(
공연id varchar2(10)  primary key,
공연이름 varchar2(50)  not null,
날짜 date not null,
 varchar2(10),
공연시간 varchar2(10),
구매처 varchar2(30)
);

 
 ALTER table  공연 ADD(   placeddfdd   varchar2(30) );
 ALTER TABLE  공연 ADD ( ADDR VARCHAR2(50) ) ;
 ALTER TABLE  공연 ADD ( 공연장소 VARCHAR2(50) ) ;
 ALTER TABLE  공연 DROP  COLUMN ADDR;
 ALTER TABLE  공연 MODIFY 시작시간 VARCHAR2(20);
 ALTER TABLE  공연 DROP  COLUMN placeddfdd;
 
select * from 공연;
desc 공연;

--NH00001		/   칸예 웨스트   /    2024/08/23 / 오후8시   / 		/	고양종합운동장	/ 멜론

insert into 공연(공연id, 공연이름, 날짜, 시작시간, 공연시간, 구매처 , 공연장소) values('NH00001', '칸예 웨스트', '2024/08/23' ,'오후8시', null,'멜론'  ,'고양종합운동장'  );
insert into 공연(공연id, 공연이름, 날짜, 시작시간, 공연시간, 구매처 , 공연장소) values('NH00002', '조자 스미스', '2024/10/25' , '오후8시', '60분', '예스24','예스24 라이브홀');
insert into 공연(공연id, 공연이름, 날짜, 시작시간, 공연시간, 구매처 , 공연장소) values('NH00003', '노벨 브라이트','2024/10/26', '오후5시', '110분', '예스24','예스24 라이브홀');
insert into 공연(공연id, 공연이름, 날짜, 시작시간, 공연시간, 구매처 , 공연장소) values('NH00004', '다이앤 리브스','2024/11/01', '오후7시30분', '75분','인터파크','서울아트센터 도암홀');
insert into 공연(공연id, 공연이름, 날짜, 시작시간, 공연시간, 구매처 , 공연장소) values('NH00005', '유우리', '2024/11/11', '오후7시30분', '90분', '예스24', '예스24 라이브홀');
insert into 공연(공연id, 공연이름, 날짜, 시작시간, 공연시간, 구매처 , 공연장소) values('NH00006', '웨스트 라이프','2024/11/23','오후6시',null,'인터파크','인스파이어 아레나');
insert into 공연(공연id, 공연이름, 날짜, 시작시간, 공연시간, 구매처 , 공연장소) values('NH00007', '찰리푸스','2024/12/07','오후8시','70분','예스24','고척 스카이돔');
insert into 공연(공연id, 공연이름, 날짜, 시작시간, 공연시간, 구매처 , 공연장소) values('NH00008', '포터 로빈슨','2024/12/31','오후8시',null,'인터파크','명화 라이브 홀');



commit;




--변경
update  공연
set 시작시간 ='오후5시10분' , 공연이름= '칸예 웨스트'
where 공연id  ='NH00001' ;



--삭제
delete from 공연
where 공연id= 'NH00001';





--티켓가격

create table 티켓가격(
공연id varchar2(10) references 공연( 공연id ) ,
좌석 varchar2(5),
금액 number(7));

select * from  티켓가격;

insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00001' , 'VIP',  250000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00001' , 'RS',  210000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00001' , 'R', 170000 );
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00001' , 'S',  130000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00001' , 'A',  80000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00002' , 'VIP', 110000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00002' , 'RS',  99000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00003' , 'VIP',  99000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00003' , 'RS',  99000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00004' , 'VIP',  143000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00004' , 'RS',  121000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00004' , 'R',  110000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00004' , 'S',  88000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00005' , 'VIP',  143000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00005' , 'RS',  132000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00006' , 'VIP',  163000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00006' , 'RS',  143000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00006' , 'R',  121000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00006' , 'S',  110000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00006' , 'A',  99000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00007' , 'VIP',  187000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00007' , 'RS',  165000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00007' , 'R',  154000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00007' , 'S',  143000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00007' , 'A',  132000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00007' , 'B',  110000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00007' , 'C',  99000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00007' , 'D',  88000);
insert into 티켓가격( 공연id, 좌석, 금액) values( 'NH00008' , 'VIP',  99000);

commit;



 
