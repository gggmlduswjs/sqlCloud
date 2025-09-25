


--�װ��� ���̺�


drop table airline_11;

create table airline_11 (
     ar_code varchar2(2) not null,
     ar_name varchar2(30) not null,
     ap_code varchar2(6) not null  primary key
     );
     
insert into airline_11 values ('KE', '�����װ�', 'B737');
insert into airline_11 values ('OZ', '�ƽþƳ��װ�', 'B767');
insert into airline_11 values ('TW', 'Ƽ�����װ�', 'A320');
insert into airline_11 values ('KE', '�����װ�', 'EF2000');
insert into airline_11 values ('LJ', '������', 'MD80');
insert into airline_11 values ('LJ', '������', 'B787');
insert into airline_11 values ('KE', '�����װ�', 'E175');
insert into airline_11 values ('KE', '�����װ�', 'DH4');
insert into airline_11 values ('BX', '����λ�', 'CRJ2');
insert into airline_11 values ('OZ', '�ƽþƳ��װ�', 'DC9');
insert into airline_11 values ('OZ', '�ƽþƳ��װ�', 'MD90');

commit;

select * from airline_11;




--�� ���̺�

alter table aircus_11
drop column cus_grade;

create table aircus_11 (
    cus_id varchar2(20) not null,
    cus_name char(10) not null,
    cus_birth number(8) not null,
    cus_pp varchar(9) not null primary key,
    cus_m number(10) default '0'
    );
    
insert into aircus_11 values ('lcrztw9k', '���ϴ�', '19990101', 'M12345678','', '56468');
insert into aircus_11 values ('xjvpi7mn', '������', '20000411', 'M23456789','' ,'456213');
insert into aircus_11 values ('wstqpe2y', '�����', '20010101', 'M34567890','' ,'587845');
insert into aircus_11 values ('bmdfrz1x', '�ֵ���', '19750412', 'M45678901','' ,'231');
insert into aircus_11 values ('jkpvl4qz', '���μ�', '19920617', 'M56789012','' ,'6544');
insert into aircus_11 values ('nrxwz5pf', '������', '19870830', 'M67890123','', '964');
insert into aircus_11 values ('qcrb7tkj', '����ȣ', '19660923', 'M78901234', '','674523');
insert into aircus_11 values ('fvspl8lw', '���Ƹ�', '19710514', 'M89012345', '','65872');
insert into aircus_11 values ('xjtvr3ml', '������', '19800307', 'M90123456', '','3214');
insert into aircus_11 values ('yqknb4zx', '������', '20020812', 'M01234567', '','65432');
insert into aircus_11 values ('dhlr7vcp', '�ۼ���', '20010222', 'M13467985', '','98654');
insert into aircus_11 values ('mnbv6wzk', '�ۺ�ȭ', '20000213', 'M24579036','', '0');
insert into aircus_11 values ('tqvkp2js', '������', '19990915', 'M35680147','', '4474');
insert into aircus_11 values ('zpwgr8yf', '�Һ���', '19960507', 'M46791258','', '9999');
insert into aircus_11 values ('hsmcr9lv', '�����', '20040831', 'M57802369','', '7894531');

commit;

select * from aircus_11;


drop table airflight_11;
--�װ��� ���̺�

create table airflight_11 (
    bookno_ar number (4) not null primary key,
    book_pp varchar(9) REFERENCES aircus_11(cus_pp),
    book_date number(8) not null,
    arrival_c varchar2(20) not null,
    dep_t number(4) not null,
    arr_t number(4) not null,
    seat_grade varchar(20) not null,
    seat_no varchar2(5) not null,
    price number(8) check (price >= 0),
    af_code varchar2(6) REFERENCES airline_11(ap_code)
    );
    
insert into airflight_11 values ('1','M45678901','20240915','������','0825','0940','Economy','2A','169000','B737');    
insert into airflight_11 values ('2','M23456789','20241006','�ٸ����γ�','1110','2255','First','14F','6374400','EF2000');
insert into airflight_11 values ('3','M90123456','20240929','����','1955','2335','Economy','6B','303900','B787');
insert into airflight_11 values ('4','M56789012','20241101','����','1050','1720','Economy','21E','653600','MD90');
insert into airflight_11 values ('5','M67890123','20240925','��','0945','1515','Economy','15C','301800','EF2000');
insert into airflight_11 values ('6','M89012345','20241203','����','1000','1105','Business','3C','2977100','DC9');    
insert into airflight_11 values ('7','M57802369','20241012','����','1010','1240','Business','6V','497500','MD80');    
insert into airflight_11 values ('8','M01234567','20241125','����ũǪ��Ʈ','1125','1720','First','8A','5958800','E175');      
insert into airflight_11 values ('9','M24579036','20240918','������','1245','1820','Ecomomy','8C','421500','A320');         
insert into airflight_11 values ('10','M13467985','20240923','�ν���������','1430','0830','First','14E','5516200','B737');
insert into airflight_11 values ('11','M46791258','20241212','������丣','0745','1025','Economy','11E','270800','CRJ2');
insert into airflight_11 values ('12','M35680147','20241225','�ж��','1225','1805','Business','23D','1778600','B767');
insert into airflight_11 values ('13','M78901234','20241105','�����ī','0800','0920','Economy','6F','136800','DH4');
insert into airflight_11 values ('14','M34567890','20241111','���Ŀ��','1725','0515','Economy','12D','2018900','DH4');
insert into airflight_11 values ('15','M89012345','20241223','������','1050','1610','Economy','15J','558600','E175');
insert into airflight_11 values ('16','M01234567','20241223','��Ƽ�ư�','1725','0750','Economy','11K','1932800','MD90');
insert into airflight_11 values ('17','M24579036','20241005','�����Ʈ','1325','2115','Economy','13O','673200','EF2000');
insert into airflight_11 values ('18','M67890123','20241123','����','1850','2225','Economy','12P','222000','E175');

commit;


select * from airline_11;
select * from aircus_11;
select * from airflight_11;




--������ ���

--�� �װ��� ���

select ac.cus_name as name, to_date(ac.cus_birth, 'YYYY-MM-DD') as birthday, ac.cus_pp as "Passport Number",
       to_date(af.book_date, 'YYYY-MM-DD') as "Date", af.arrival_c as city,
       to_char(to_date(LPAD(af.dep_t,4,0),'HH24MI'), 'HH24:MI') as "Departure Time",
       to_char(to_date(LPAD(af.arr_t,4,0),'HH24MI'), 'HH24:MI') as "Arrival Time",
       af.seat_grade as class, seat_no as seat, to_char(af.price,'999,999,999') as price,
       af.af_code airplane
from airflight_11 af
join aircus_11 ac
on af.book_pp = ac.cus_pp;

--���� �װ��� ���

select ac.cus_name as name, to_date(ac.cus_birth, 'YYYY-MM-DD') as birthday, ac.cus_pp as "Passport Number",
       to_date(af.book_date, 'YYYY-MM-DD') as "Date", af.arrival_c as city,
       to_char(to_date(LPAD(af.dep_t,4,0),'HH24MI'), 'HH24:MI') as "Departure Time",
       to_char(to_date(LPAD(af.arr_t,4,0),'HH24MI'), 'HH24:MI') as "Arrival Time",
       af.seat_grade as class, seat_no as seat, to_char(af.price,'999,999,999') as price,
       af.af_code airplane
from airflight_11 af
join aircus_11 ac
on af.book_pp = ac.cus_pp
where cus_name = '������';


--�װ��纰 ����

select *
from airline_11 ar
join airflight_11 af
on ar.ap_code = af.af_code;


select ar.ar_name, ar.ar_code, sum(af.price)
from airline_11 ar
join airflight_11 af
on ar.ap_code = af.af_code
group by ar.ar_name, ar.ar_code;

--���� ���� ��Ȳ, ����

select * from airflight_11;

select substr(book_date, 5, 2) month,count(substr(book_date, 5, 2)) reservation , sum(price) Revenue 
from airflight_11
group by substr(book_date, 5, 2)
order by substr(book_date, 5, 2) ;

--�� ���ϸ����� ���

select * from aircus_11;

select cus_id, cus_name,to_date(cus_birth, 'YYYY-MM-DD') as birthday, cus_pp, cus_m,
       case when cus_m >= 500000 then 'Diamond' 
            when cus_m >= 200000 then 'Platinum'
            when cus_m >= 50000 then 'Gold'
            when cus_m >= 5000 then 'Silver' 
            else 'Standard ' 
       end as grade
from aircus_11;

--���ϸ��� ����

select * 
from airflight_11 af
join aircus_11 ac
on af.book_pp = ac.cus_pp;

select ac.cus_name as name, ac.cus_pp as "Passport Number",
       to_date(af.book_date, 'YYYY-MM-DD') as "Date", af.arrival_c as city,
       to_char(to_date(LPAD(af.dep_t,4,0),'HH24MI'), 'HH24:MI') as "Departure Time",
       to_char(to_date(LPAD(af.arr_t,4,0),'HH24MI'), 'HH24:MI') as "Arrival Time",
       af.seat_grade as class, seat_no as seat, to_char(af.price,'999,999,999') as price,
       to_char(cus_m,'999,999,999') mileage, 
       case when (price - cus_m)>0 then to_char((price - cus_m),'999,999,999') || ' '
       else '���� ���ϸ��� ���� ����'
       end as "Mileage use"
from airflight_11 af
join aircus_11 ac
on af.book_pp = ac.cus_pp;



select  case when (15-10 )>0 then  (15-10)   ||  '  ' 
             else   '������'
            end as  "result"
    from dual;
    
    
    

    
