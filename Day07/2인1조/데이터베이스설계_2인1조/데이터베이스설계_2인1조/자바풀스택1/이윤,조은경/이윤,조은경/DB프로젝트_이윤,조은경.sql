-- 멤버 릴레이션 스키마
create table member_list(
    mb_id  VARCHAR2(4) not null primary key,
    mb_Name  VARCHAR2(10) not null,
    mb_birth date not null,
    mb_Nickname VARCHAR2(20) not null
);

insert into member_list values('mb01', '김종현', '1990-04-08', '블링블링'); 
insert into member_list values('mb02', '김기범', '1991-09-23', '만능열쇠'); 
insert into member_list values('mb03', '최민호', '1991-12-09', '불꽃카리스마');
insert into member_list values('mb04', '이태민', '1993-07-18', '박력탬');
insert into member_list values('mb05', '샤이니', '2008-05-25', 'SHINee');


-- 포지션 릴레이션 스키마
create table position_list(
    pt_id VARCHAR2(4) not null primary key, 
    pt_name VARCHAR2(20) not null
);

insert into position_list values('pt01', '보컬'); 
insert into position_list values('pt02', '메인보컬'); 
insert into position_list values('pt03', '리드보컬'); 
insert into position_list values('pt04', '메인래퍼'); 
insert into position_list values('pt05', '리드래퍼'); 
insert into position_list values('pt06', '메인댄서'); 
insert into position_list values('pt07', '리드댄서'); 

-- 포지션 세팅 릴레이션 스키마
create table position_setting(
    mb_id VARCHAR2(20) references member_list(mb_id),
    pt_id VARCHAR2(4) references position_list(pt_id),
    primary key(pt_id, mb_id)
);

insert into position_setting values('mb01', 'pt02'); 
insert into position_setting values('mb02', 'pt01'); 
insert into position_setting values('mb02', 'pt05'); 
insert into position_setting values('mb02', 'pt07'); 
insert into position_setting values('mb03', 'pt01'); 
insert into position_setting values('mb03', 'pt04'); 
insert into position_setting values('mb04', 'pt06'); 
insert into position_setting values('mb04', 'pt03'); 

-- 앨범 릴레이션 스키마
create table album_list(
  al_id varchar2(7) not null primary key,
  al_name varchar2(100) not null,
  al_date date not null
);

insert into album_list values('AL00001', 'The SHINee World (SHINee The First Album)', '2008-08-28');
insert into album_list values('AL00002', 'The 2nd Album ''LUCIFER''', '2010-07-19');
insert into album_list values('AL00003', 'SHINee The 3rd Album ''The Misconceptions Of Us''', '2013-08-08');
insert into album_list values('AL00004', 'Odd - The 4th Album', '2015-05-18');
insert into album_list values('AL00005', '1 of 1 - The 5th Album', '2016-10-05');
insert into album_list values('AL00006', '''The Story of Light'' Epilogue - The 6th Album', '2018-09-10');
insert into album_list values('AL00007', 'Don''t Call Me - The 7th Album', '2021-02-22');
insert into album_list values('AL00008', 'HARD - The 8th Album', '2023-06-26');



-- 곡 릴레이션 스키마
create table song_list(
  so_id varchar2(7) not null primary key,
  so_name varchar2(100) not null,
  al_id varchar2(5) references album_list(al_id)
);


insert into song_list values('SL00001', 'The SHINee World', 'AL00001');
insert into song_list values('SL00002', '사랑의 길', 'AL00001');
insert into song_list values('SL00003', '산소같은 너', 'AL00001');
insert into song_list values('SL00004', '너 아니면 안되는 걸', 'AL00001');
insert into song_list values('SL00005', '그녀가 헤어졌다', 'AL00001');
insert into song_list values('SL00006', '화장을 하고', 'AL00001');
insert into song_list values('SL00007', '마지막 선물', 'AL00001');
insert into song_list values('SL00008', '내 곁에만 있어', 'AL00001');
insert into song_list values('SL00009', '혜야', 'AL00001');
insert into song_list values('SL00010', '눈을 감아보면', 'AL00001');
insert into song_list values('SL00011', 'In My Room', 'AL00001');
insert into song_list values('SL00012', '누난 너무 예뻐', 'AL00001');

insert into song_list values('SL00012', 'Up & Down', 'AL00002');
insert into song_list values('SL00013', 'Lucifer', 'AL00002');
insert into song_list values('SL00014', 'Electric Heart', 'AL00002');
insert into song_list values('SL00015', 'A-Yo', 'AL00002');
insert into song_list values('SL00016', '욕', 'AL00002');
insert into song_list values('SL00017', '화살', 'AL00002');
insert into song_list values('SL00018', '악', 'AL00002');
insert into song_list values('SL00019', 'WOWOWOW', 'AL00002');
insert into song_list values('SL00020', 'Your Name', 'AL00002');
insert into song_list values('SL00021', 'Life', 'AL00002');
insert into song_list values('SL00022', 'Ready Or Not', 'AL00002');
insert into song_list values('SL00023', 'Love Pain', 'AL00002');
insert into song_list values('SL00024', '사.계.후', 'AL00002');


insert into song_list values('SL00025', 'Spoiler', 'AL00003');
insert into song_list values('SL00026', 'Dream Girl', 'AL00003');
insert into song_list values('SL00027', '히치하이킹', 'AL00003');
insert into song_list values('SL00028', 'Punch Drunk Love', 'AL00003');
insert into song_list values('SL00029', 'Girls, Girls, Girls', 'AL00003');
insert into song_list values('SL00030', '방백', 'AL00003');
insert into song_list values('SL00031', '아름다워', 'AL00003');
insert into song_list values('SL00032', '다이너마이트', 'AL00003');
insert into song_list values('SL00033', 'Runaway', 'AL00003');
insert into song_list values('SL00034', '너와 나의 거리', 'AL00003');
insert into song_list values('SL00035', 'Nigntmare', 'AL00003');
insert into song_list values('SL00036', 'Why So Serious?', 'AL00003');
insert into song_list values('SL00037', 'SHINe', 'AL00003');
insert into song_list values('SL00038', '오르골', 'AL00003');
insert into song_list values('SL00039', 'Dangerous', 'AL00003');
insert into song_list values('SL00040', 'Like a Fire', 'AL00003');
insert into song_list values('SL00041', 'Excuse Me Miss', 'AL00003');
insert into song_list values('SL00042', 'Evil', 'AL00003');
insert into song_list values('SL00043', '떠나지 못해', 'AL00003');
insert into song_list values('SL00044', '버리고 가', 'AL00003');

insert into song_list values('SL00045', 'Odd Eye', 'AL00004');
insert into song_list values('SL00046', 'Love Sick', 'AL00004');
insert into song_list values('SL00047', 'View', 'AL00004');
insert into song_list values('SL00048', 'Romance', 'AL00004');
insert into song_list values('SL00049', 'Trigger', 'AL00004');
insert into song_list values('SL00050', '이별의 길', 'AL00004');
insert into song_list values('SL00051', '너의 노래가 되어', 'AL00004');
insert into song_list values('SL00052', 'Alive', 'AL00004');
insert into song_list values('SL00053', 'WoofWoof', 'AL00004');
insert into song_list values('SL00054', 'Black Hole', 'AL00004');
insert into song_list values('SL00055', '재연', 'AL00004');

insert into song_list values('SL00056', 'Prism', 'AL00005');
insert into song_list values('SL00057', '1 of 1', 'AL00005');
insert into song_list values('SL00058', 'Feel Good', 'AL00005');
insert into song_list values('SL00059', '투명 우산', 'AL00005');
insert into song_list values('SL00060', 'Lipstick', 'AL00005');
insert into song_list values('SL00061', 'Don''t stop', 'AL00005');
insert into song_list values('SL00062', 'SHIFT', 'AL00005');
insert into song_list values('SL00063', 'U Need Me', 'AL00005');
insert into song_list values('SL00064', 'So Amazing', 'AL00005');


insert into song_list values('SL00065', 'All Day All Night', 'AL00006');
insert into song_list values('SL00066', '셀 수 없는', 'AL00006');
insert into song_list values('SL00067', '데리러 가', 'AL00006');
insert into song_list values('SL00068', 'Chemistry', 'AL00006');
insert into song_list values('SL00069', 'Electric', 'AL00006');
insert into song_list values('SL00070', '독감', 'AL00006');
insert into song_list values('SL00071', '네가 남겨둔 말', 'AL00006');
insert into song_list values('SL00072', 'I Say', 'AL00006');
insert into song_list values('SL00073', 'Retro', 'AL00006');
insert into song_list values('SL00074', 'Drive', 'AL00006');
insert into song_list values('SL00075', 'I Want You', 'AL00006');
insert into song_list values('SL00076', 'Undercover', 'AL00006');
insert into song_list values('SL00077', 'JUMP', 'AL00006');
insert into song_list values('SL00078', 'Tonight', 'AL00006');
insert into song_list values('SL00079', '안녕', 'AL00006');
insert into song_list values('SL00080', 'Lock You Down', 'AL00006');


insert into song_list values('SL00081', 'Don''t Call Me', 'AL00007');
insert into song_list values('SL00082', 'Heart Attack', 'AL00007');
insert into song_list values('SL00083', 'Marry You', 'AL00007');
insert into song_list values('SL00084', 'CØDE', 'AL00007');
insert into song_list values('SL00085', 'I Really Want You', 'AL00007');
insert into song_list values('SL00086', 'Kiss Kiss', 'AL00007');
insert into song_list values('SL00087', 'Body Rhythm', 'AL00007');
insert into song_list values('SL00088', 'Attention', 'AL00007');
insert into song_list values('SL00089', '빈칸', 'AL00007');

insert into song_list values('SL00090', 'HARD', 'AL00008');
insert into song_list values('SL00091', 'JUICE', 'AL00008');
insert into song_list values('SL00092', '10X', 'AL00008');
insert into song_list values('SL00093', 'Satellite', 'AL00008');
insert into song_list values('SL00094', 'Identity', 'AL00008');
insert into song_list values('SL00095', 'The Feeling', 'AL00008');
insert into song_list values('SL00096', 'Like It', 'AL00008');
insert into song_list values('SL00097', 'Sweet Misery', 'AL00008');
insert into song_list values('SL00098', '불면증', 'AL00008');
insert into song_list values('SL00099', 'Gravity', 'AL00008');


-- 작곡가 릴레이션 스키마
create table songwriter_list(
  sw_id varchar2(7) not null primary key,
  sw_name varchar2(100) not null unique
);

-- 작사가 릴레이션 스키마
create table lyricist_list(
  ly_id varchar2(7) not null primary key,
  ly_name varchar2(100) not null unique
);


