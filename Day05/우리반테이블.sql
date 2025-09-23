drop  table acorntbl;


create table  acorntbl  (
    id  varchar2(10) primary key,
    pw  varchar2(10) ,
    name varchar2(10),
    point number(6) , 
    birthday date    
);

--crud   => create(insert ) , read( select ), u(update) , d(delete)  

select *  from acorntbl ;
insert into acorntbl values('victoai', '0408', '우주연' ,100 , '1975-12-10'); 
  
commit;
 

insert into acorntbl(id, pw, name, point, birthday)  values('dnehdgns', '1234', '우동훈' ,150 , '1996-01-05'); 
insert into acorntbl(id, pw, name, point, birthday)  values('j.choi', '8256', '최정문' ,500 , '1999-07-19');
insert into acorntbl(id, pw, name, point, birthday)  values('popstar', '0909', '이성빈' ,111 , '2001-09-18');
insert into acorntbl(id, pw, name, point, birthday)  values('SMY', '0408', '손민영' ,300 , '1995-08-12');
insert into acorntbl(id, pw, name, point, birthday)  values('jeongjiwon', '1007', '정지원' ,999 , '2001-10-07');
insert into acorntbl(id, pw, name, point, birthday)  values('you__win_', '0610', '유승재' ,100 , '1998-06-10'); 
insert into acorntbl(id, pw, name, point, birthday)  values('sword', '0723', '최성원' ,119 , '2001-07-23');
insert into acorntbl(id, pw, name, point, birthday)  values('ldh', '5566', '이대훈' ,110 , '2000-12-15');
insert into acorntbl(id, pw, name, point, birthday)  values('mhkim', '3616', '김민희' ,155 , '1999-06-18');
insert into acorntbl(id, pw, name, point, birthday)  values('entlrqkr', '7126', '박두식' ,9220 , '1992-02-08');
insert into acorntbl(id, pw, name, point, birthday)  values('LHR', '1111', '이혜린' ,222 , '2001-01-29');
insert into acorntbl(id, pw, name, point, birthday)  values('gyu', '1019', '이동규' ,123 , '2000-10-19');
 insert into acorntbl(id, pw, name, point, birthday)  values('psw', '1234', '박성욱' ,100 , '1996-05-30');
insert into acorntbl(id, pw, name, point, birthday)  values('tm', '2589', '윤태민' ,589 , '2000-11-24');
insert into acorntbl(id, pw, name, point, birthday)  values('seoho', '0708', '김서호' ,123 , '1995-07-08');
insert into acorntbl(id, pw, name, point, birthday)  values('hh', '7825', '김현희' ,1280 , '2000-04-18');
commit;

 select *
 from acorntbl 
 where name = '김현희';
 
 
 
 select   * from  acorntbl where    to_char(sysdate ,'MM')   =  to_char( birthday,'MM');
 
 
 
 --생일이 가장 높은사람 
 --생일이 가장 늦은사람
 select max(birthday) from  acorntbl;
 
 
 
 
 select  *
 from acorntbl
 where  birthday   = '2001-10-07' ; 
 
 
 --서브쿼리 
 select  *
 from acorntbl
 where  birthday   = (
 select max(birthday) from  acorntbl); 
 
 
 