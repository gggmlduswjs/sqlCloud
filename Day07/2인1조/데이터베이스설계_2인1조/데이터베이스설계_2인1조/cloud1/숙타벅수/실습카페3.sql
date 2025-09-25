-- �޴� ���̺�   ���̵�,�̸�,����,����Ʈ
create table menu_tbl 
(
menu_id char(4) primary key,   
menu_name varchar2(25) not null,
menu_price varchar2(10) not null,  
menu_point varchar2(10) not null,   
storesid char(4) default 'all' 
); 

select * from menu_tbl;

insert into menu_tbl(menu_id, menu_name, menu_price, menu_point) values('A001','���̽��Ƹ޸�ī��','2000','20');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point) values('A002','�ް���ī��','3000','30');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point)  values('A003','ī���','2900','29');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point) values('A004','īǪġ��','2900','29');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point)  values('A005','ī��Ḷ���ƶ�','3700','37');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point)  values('B001','���Ʈ������','3900','39');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point)  values('B002','��������������','3900','39');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point)  values('B003','�������ֽ�','4000','40');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point) values('B004','����','2500','25');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point)  values('B005','ĳ����','2500','25');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point) values('C001','������Ű','4000','40');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point) values('C002','ġ������ũ','4500','45');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point) values('C003','����','4500','45');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point) values('C004','��ī��','3000','30');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point)  values('C005','��Ϻ귡��','7000','70');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point,storesid) values('D001','�ӱ���','9300','93','S004');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point,storesid) values('D002','�Һ�','33000','330','S001');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point,storesid) values('D003','��Ƽ���Ǿƿ���','14000','140','S003');
insert into menu_tbl(menu_id, menu_name, menu_price, menu_point,storesid) values('D004','���','99000','990','S003');
commit;

-- �� ���̺�   ���̵�,�̸�,��ȭ��ȣ,����,��������Ʈ
create table customer_tbl4
(
customer_id char(4) primary key,       
customer_name varchar2(20) not null,
customer_tell char(13) unique,
customer_birth varchar2(10),
customer_point varchar2(10)
);

insert into customer_tbl4(customer_id, customer_name, customer_tell, customer_birth, customer_point)
            values('Z001','�輼��','010-8441-8438','03-27','0');
insert into customer_tbl4(customer_id, customer_name, customer_tell, customer_birth, customer_point)
            values('Z002','Ȳ����','010-9876-5432','08-10','18751');
insert into customer_tbl4(customer_id, customer_name, customer_tell, customer_birth, customer_point) 
            values('Z003','���ֿ�','010-1597-7532','09-12','13250');
insert into customer_tbl4(customer_id, customer_name, customer_tell, customer_birth, customer_point) 
            values('Z004','������','010-2587-9632','12-25','460');
insert into customer_tbl4(customer_id, customer_name, customer_tell, customer_birth, customer_point) 
            values('Z005','���','010-7468-9285','06-01','1510');
insert into customer_tbl4(customer_id, customer_name, customer_tell, customer_birth, customer_point) 
            values('Z006','ȫ�浿','010-1234-5678','01-01','990');
commit;

-- ���� ���̺�   ���̵�,�̸�,������ȭ��ȣ,������
create table store_tbl
(
store_id char(4) primary key,       
store_name varchar2(20) not null,
store_tell varchar2(13) not null unique,
store_total varchar2(12) not null
);

insert into store_tbl(store_id, store_name, store_tell, store_total)
            values('S001','�����ܺ���','02-2231-6412','61,758,000');
insert into store_tbl(store_id, store_name, store_tell, store_total) 
            values('S002','������','02-2231-6472','28,462,000');
insert into store_tbl(store_id, store_name, store_tell, store_total) 
            values('S003','��������','02-2232-2484','48,441,000');
insert into store_tbl(store_id, store_name, store_tell, store_total) 
            values('S004','���׿���','054-2798-8354','13,517,000');
commit;


-- �ֹ� ���̺�  
--( ��id, �޴�id, �޴�����, �޴�����, �����ݾ�, ��������Ʈ, ����id)
create table order_tbl1
(
order_Cid char(4) not null,
order_Mid char(4) not null,
order_cnt varchar2(3) not null,
order_price varchar2(10) not null,
order_point varchar2(10) not null,
order_Sid char(4) not null
);

insert into order_tbl1(order_Cid, order_Mid, order_cnt, order_price, order_point, order_Sid)
            values('Z002','A002','1','3000','30','S004');
insert into order_tbl1(order_Cid, order_Mid, order_cnt, order_price, order_point, order_Sid) 
            values('Z001','B001','1','3900','39','S003');
insert into order_tbl1(order_Cid, order_Mid, order_cnt, order_price, order_point, order_Sid) 
            values('Z003','B005','3','7500','75','S001');
insert into order_tbl1(order_Cid, order_Mid, order_cnt, order_price, order_point, order_Sid) 
            values('Z001','C005','1','7000','70','S003');
insert into order_tbl1(order_Cid, order_Mid, order_cnt, order_price, order_point, order_Sid) 
            values('Z002','C002','2','9000','90','S001');
insert into order_tbl1(order_Cid, order_Mid, order_cnt, order_price, order_point, order_Sid) 
            values('Z004','A001','2','4000','40','S001');
insert into order_tbl1(order_Cid, order_Mid, order_cnt, order_price, order_point, order_Sid) 
            values('Z005','B002','1','3900','39','S002');
insert into order_tbl1(order_Cid, order_Mid, order_cnt, order_price, order_point, order_Sid) 
            values('Z006','D004','1','99000','990','S003');
insert into order_tbl1(order_Cid, order_Mid, order_cnt, order_price, order_point, order_Sid) 
            values('Z002','D002','5','165000','1650','S001');
insert into order_tbl1(order_Cid, order_Mid, order_cnt, order_price, order_point, order_Sid) 
            values('Z003','D001','1','9300','93','S004');
insert into order_tbl1(order_Cid, order_Mid, order_cnt, order_price, order_point, order_Sid) 
            values('Z002','D003','1','14000','140','S003');
commit;


select * from menu_tbl;
select * from customer_tbl4;
select * from store_tbl;
select * from order_tbl1;

--�÷� �߰� �غ��� 
--alter table menu_tbl add ( storeid char(4));
--�÷� ���� ���� ���� �� default �� ���� �ְ������ �̺κ��� null ������ ���´�,. �̰� ���̺������ �����ϱ� 
--alter table menu_tbl modify storeid varchar2(4) default 'all';



--�ֹ� ���̺�� sum �̿��Ͽ� 1�δ� �����ݾ� ���ϱ� 
select * from order_tbl1;
select * from customer_tbl4;
select * from order_tbl1 o join customer_tbl4 c on o.order_cid = c.customer_id;

select o.order_cid, customer_name,customer_tell,order_price
from order_tbl1 o join customer_tbl4 c on o.order_cid = c.customer_id;

--���̸�  �͸�ȭ ��Ű��
select  substr(customer_name, 1,2)||'*' as ���̸� from customer_tbl4;
select customer_id, substr(customer_name, 1,2)||'*' as ���̸� from customer_tbl4;
select replace(customer_name, substr(customer_name, 2,1),'*') as ���̸� from customer_tbl4;

--������ ��ȭ��ȣ ������
select substr(customer_tell,1,4)|| '****' || substr (customer_tell, 9,5) as ������ from customer_tbl4;

select order_cid, sum(order_price) as �����ݾ� from order_tbl1 group by order_cid;

--�ֹ� ���̺��� �̿��Ͽ� 1�δ� �����ݾ� ���ϱ� (�������� * �� ����)
select o.order_cid , 
substr(customer_name, 1,1)||'**' as ���̸�,
substr(customer_tell,1,4)|| '****' || substr (customer_tell, 9,5) as ������,
to_char(sum(order_price),'999,999')||'��' as ����ݾ�
from order_tbl1 o join customer_tbl4 c on o.order_cid = c.customer_id
group by o.order_cid , 
substr(customer_name, 1,1)||'**' ,
substr(customer_tell,1,4)|| '****' || substr (customer_tell, 9,5)
order by  o.order_cid asc ;




--�ֹ� ���̺�� sum �̿��Ͽ� ������ ���� ���ϱ� 
select * from order_tbl1 o join store_tbl s on o.order_sid = s.store_id;

select o.order_sid , s.store_name, s.store_tell,o.order_price  from order_tbl1 o join store_tbl s on o.order_sid = s.store_id;


select o.order_sid , s.store_name, s.store_tell,
sum( o.order_price) as ����ݾ�
from order_tbl1 o join store_tbl s on o.order_sid = s.store_id
group by  o.order_sid , s.store_name, s.store_tell;

--���� �� , �� �� �ֱ� 
select order_sid,order_price  from order_tbl1;
select order_sid, sum(order_price)||'��' as ����ݾ� from order_tbl1 group by order_sid;
select order_sid, to_char(sum(order_price),'999,999')||'��' as ����ݾ� from order_tbl1 group by order_sid;

--�ֹ� ���̺��� �̿��Ͽ� ������ �����ݾ� ���ϱ� 
select o.order_sid , s.store_name, s.store_tell,
to_char(sum(order_price),'999,999')||'��' as ����ݾ�
from order_tbl1 o join store_tbl s on o.order_sid = s.store_id
group by  o.order_sid , s.store_name, s.store_tell
order by sum(order_price) desc;





