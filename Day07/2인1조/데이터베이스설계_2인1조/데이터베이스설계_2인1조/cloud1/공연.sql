create table ����(
����id varchar2(10)  primary key,
�����̸� varchar2(50)  not null,
��¥ date not null,
 varchar2(10),
�����ð� varchar2(10),
����ó varchar2(30)
);

 
 ALTER table  ���� ADD(   placeddfdd   varchar2(30) );
 ALTER TABLE  ���� ADD ( ADDR VARCHAR2(50) ) ;
 ALTER TABLE  ���� ADD ( ������� VARCHAR2(50) ) ;
 ALTER TABLE  ���� DROP  COLUMN ADDR;
 ALTER TABLE  ���� MODIFY ���۽ð� VARCHAR2(20);
 ALTER TABLE  ���� DROP  COLUMN placeddfdd;
 
select * from ����;
desc ����;

--NH00001		/   ĭ�� ����Ʈ   /    2024/08/23 / ����8��   / 		/	������տ��	/ ���

insert into ����(����id, �����̸�, ��¥, ���۽ð�, �����ð�, ����ó , �������) values('NH00001', 'ĭ�� ����Ʈ', '2024/08/23' ,'����8��', null,'���'  ,'������տ��'  );
insert into ����(����id, �����̸�, ��¥, ���۽ð�, �����ð�, ����ó , �������) values('NH00002', '���� ���̽�', '2024/10/25' , '����8��', '60��', '����24','����24 ���̺�Ȧ');
insert into ����(����id, �����̸�, ��¥, ���۽ð�, �����ð�, ����ó , �������) values('NH00003', '�뺧 �����Ʈ','2024/10/26', '����5��', '110��', '����24','����24 ���̺�Ȧ');
insert into ����(����id, �����̸�, ��¥, ���۽ð�, �����ð�, ����ó , �������) values('NH00004', '���̾� ���꽺','2024/11/01', '����7��30��', '75��','������ũ','�����Ʈ���� ����Ȧ');
insert into ����(����id, �����̸�, ��¥, ���۽ð�, �����ð�, ����ó , �������) values('NH00005', '���츮', '2024/11/11', '����7��30��', '90��', '����24', '����24 ���̺�Ȧ');
insert into ����(����id, �����̸�, ��¥, ���۽ð�, �����ð�, ����ó , �������) values('NH00006', '����Ʈ ������','2024/11/23','����6��',null,'������ũ','�ν����̾� �Ʒ���');
insert into ����(����id, �����̸�, ��¥, ���۽ð�, �����ð�, ����ó , �������) values('NH00007', '����Ǫ��','2024/12/07','����8��','70��','����24','��ô ��ī�̵�');
insert into ����(����id, �����̸�, ��¥, ���۽ð�, �����ð�, ����ó , �������) values('NH00008', '���� �κ�','2024/12/31','����8��',null,'������ũ','��ȭ ���̺� Ȧ');



commit;




--����
update  ����
set ���۽ð� ='����5��10��' , �����̸�= 'ĭ�� ����Ʈ'
where ����id  ='NH00001' ;



--����
delete from ����
where ����id= 'NH00001';





--Ƽ�ϰ���

create table Ƽ�ϰ���(
����id varchar2(10) references ����( ����id ) ,
�¼� varchar2(5),
�ݾ� number(7));

select * from  Ƽ�ϰ���;

insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00001' , 'VIP',  250000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00001' , 'RS',  210000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00001' , 'R', 170000 );
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00001' , 'S',  130000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00001' , 'A',  80000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00002' , 'VIP', 110000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00002' , 'RS',  99000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00003' , 'VIP',  99000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00003' , 'RS',  99000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00004' , 'VIP',  143000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00004' , 'RS',  121000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00004' , 'R',  110000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00004' , 'S',  88000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00005' , 'VIP',  143000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00005' , 'RS',  132000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00006' , 'VIP',  163000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00006' , 'RS',  143000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00006' , 'R',  121000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00006' , 'S',  110000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00006' , 'A',  99000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00007' , 'VIP',  187000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00007' , 'RS',  165000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00007' , 'R',  154000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00007' , 'S',  143000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00007' , 'A',  132000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00007' , 'B',  110000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00007' , 'C',  99000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00007' , 'D',  88000);
insert into Ƽ�ϰ���( ����id, �¼�, �ݾ�) values( 'NH00008' , 'VIP',  99000);

commit;



 
