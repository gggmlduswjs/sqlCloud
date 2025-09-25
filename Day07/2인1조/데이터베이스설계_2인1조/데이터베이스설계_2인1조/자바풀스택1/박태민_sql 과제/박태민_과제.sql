-- 1. 국가
create table country(
country varchar2(50) not null,
c_summary varchar2(3) not null,
capital varchar2(50),
population number(9) not null,
area number(9) not null
);
--                                국가명, 코드, 수도, 인구수, 면적
insert into country values('네덜란드', 'NLD', '암스테르담', 17606532, 41543);
insert into country values('멕시코', 'MEX', '멕시코시티', 128455567, 1962550);
insert into country values('영국', 'GBR', '런던', 67736802, 243891);
insert into country values('모나코', 'MCO', '모나코', 38300, 2.2);
insert into country values('독일', 'DEU', '베를린', 84358845, 357022);
insert into country values('스페인', 'ESP', '마드리드', 47519628, 505990);
insert into country values('핀란드', 'FIN', '헬싱키', 5544156, 338145);
insert into country(country, c_summary, population, area) values('스위스', 'CHE', 8780366, 41285);
insert into country values('이탈리아', 'ITA', '로마', 58870762, 301340);
insert into country values('오스트리아', 'AUT', '빈', 9104722, 83879);
insert into country values('오스트레일리아', 'AUS', '캔버라', 26439111, 7741220);

select country, c_summary, capital, to_char(population, '999,999,999')||'명' 인구수, to_char(area, '999,999,999')||'km^2' 면적
from country;

-- 2. 엔진제조사
create table engine(
e_nm varchar2(50) not null unique,
manufacturer varchar2(50) not null,
mother_company varchar2(50),
establishment number(4)
);
--                                엔진명, 제조사, 모기업, 설립년도
insert into engine values('F1 M14 E Performance', 'Mercedes AMG High Performance Powertrains', 'Mercedes-Benz AG', 1983);
insert into engine values('RBPT H001', 'Red Bull Powertrains', 'Red Bull Racing', 2021);
insert into engine(e_nm, manufacturer, establishment) values('Ferrari 006/10', 'Scuderia Ferrari', 1929);
insert into engine values('Renault E-Tech RE23', 'Renault Sport and Mecachrome', 'Alpine', 1976);

update engine
set e_nm='RBPTH001'
where mother_company='Red Bull Racing';

update engine
set e_nm='Mercedes-AMG F1 M14 E Performance'
where mother_company='Mercedes-Benz AG';

select e_nm, manufacturer, mother_company 모기업, establishment||'년' 설립년도 
from engine;

-- 3. 컨스트럭터(팀)
create table constructor(
t_nm varchar2(50) not null unique, 
principal varchar2(50), 
since number(4) not null, 
con_champ number(2),
c_nationality varchar2(3) not null,
engine varchar2(50) not null references engine(e_nm)
);
--                                      팀명, 감독, 창단년도, 컨챔우승횟수, 국적, 엔진
insert into constructor values('레드불 레이싱', '크리스티안 호너', 2005, 5, 'AUT', 'RBPTH001');
insert into constructor values('메르세데스 벤츠', '토토 볼프', 2010, 8, 'DEU', 'Mercedes-AMG F1 M14 E Performance');
insert into constructor values('스쿠데리아 페라리', '프레데릭 바수르', 1929, 16, 'ITA', 'Ferrari 006/10');
insert into constructor(t_nm, since, c_nationality, engine) values('애스턴 마틴', 2021, 'GBR', 'Mercedes-AMG F1 M14 E Performance');
insert into constructor(t_nm, since, c_nationality, engine) values('알파 로메오', 2019, 'CHE', 'Ferrari 006/10');
insert into constructor(t_nm, since, c_nationality, engine) values('알파 타우리', 2020, 'ITA', 'RBPTH001');
insert into constructor values('맥라렌', '안드레아 스텔라', 1963, 8, 'GBR', 'Mercedes-AMG F1 M14 E Performance');

select t_nm, principal, since||'년' 창단, con_champ||'회' "팀 우승", engine 
from constructor;

-- 4. 서킷
create table circuit(
c_nm varchar2(50) not null,
country varchar2(50) not null,
open number(4) not null
);
--                              서킷이름, 국가, 개장년도
insert into circuit values('레드불링', '오스트리아', 1969);
insert into circuit values('바쿠 시티', '아제르바이잔', 2016);
insert into circuit values('헝가로링', '헝가리', 1986);
insert into circuit values('스파-프랑코샹', '벨기에', 1921);
insert into circuit values('바레인 인터내셔널 서킷', '바레인', 2004);
insert into circuit values('질 빌너브', '캐나다', 1978);

select c_nm, country, open||'년'
from circuit;

-- 5. 드라이버
create table driver(
d_nm varchar2(50) not null primary key,
d_num number(2) not null,
team varchar2(50) not null references constructor(t_nm),
d_nationality varchar2(3) not null, 
GP_wins number(3) default 0,
d_champ number(1) default 0,
most_wins_circuit varchar2(50) default '없음'
);
--                              드라이버명, 번호, 소속팀, 국적, 우승, 월챔우승, 가장 많이 우승한 서킷
insert into driver values('맥스 베르스타펜', 1, '레드불 레이싱', 'NLD', 44, 2, '레드불링');
insert into driver(d_nm, d_num, team, d_nationality, GP_wins, most_wins_circuit) values('세르히오 페레즈', 11, '레드불 레이싱', 'MEX', 6, '바쿠 시티');
insert into driver values('루이스 해밀턴', 44, '메르세데스 벤츠', 'GBR', 103, 7, '헝가로링');
insert into driver(d_nm, d_num, team, d_nationality, GP_wins, most_wins_circuit) values('샤를 르클레', 16, '스쿠데리아 페라리', 'MCO', 5, '스파-프랑코샹');
insert into driver values('페르난도 알론소', 14, '애스턴 마틴', 'ESP', 32, 2, '바레인 인터내셔널 서킷');
insert into driver(d_nm, d_num, team, d_nationality, GP_wins, most_wins_circuit) values('발테리 보타스', 77, '알파 로메오', 'FIN', 10, '레드불링');
insert into driver(d_nm, d_num, team, d_nationality, GP_wins, most_wins_circuit) values('다니엘 리카도', 3, '알파 타우리', 'AUS', 8, '질 빌너브');
insert into driver(d_nm, d_num, team, d_nationality) values('랜도 노리스', 4, '맥라렌', 'GBR');

select d_nm, d_num, team, d_nationality, GP_wins||'회' 우승, d_champ||'회' "월드 챔피언", most_wins_circuit 
from driver;

-- 드라이버와 소속팀(컨스트럭터)
select d.d_nm, d.d_num, d.d_nationality, d.GP_wins||'회' 우승, d.d_champ||'회' "월드 챔피언", d.most_wins_circuit, d.team, ct.principal, ct.since||'년' 창단, ct.con_champ||'회' "팀 우승", ct.engine, ct.c_nationality 
from driver d
join constructor ct
on d.team = ct.t_nm;

-- 컨스트럭터의 그랑프리 우승 횟수
select d.team, sum(d.GP_wins)||'회' "그랑프리 우승"
from driver d
join constructor ct
on d.team = ct.t_nm
group by d.team;

-- 드라이버와 국적
select d.d_nm, d.d_num, d.team, d.GP_wins||'회' 우승, d.d_champ||'회' "월드 챔피언", c.country
from driver d
join country c
on d.d_nationality = c.c_summary;

-- 드라이버와 서킷
select d.d_nm, d.d_num, d.team, d.GP_wins||'회' 우승, c.c_nm, c.country, c.open 
from driver d
join circuit c
on d.most_wins_circuit = c.c_nm;

-- 컨스트럭터와 엔진
select ct.t_nm, ct.principal, ct.since||'년' 창단, e.e_nm, e.manufacturer 
from constructor ct
join engine e
on ct.engine = e.e_nm;

commit;