--------------------------------------------------------------------------------
-- 회사 테이블
CREATE TABLE company
(
    company_id VARCHAR2(10) PRIMARY KEY,
    company_name VARCHAR2(50) NOT NULL
);

-- 유저 테이블
CREATE TABLE userInfo
(
    userId VARCHAR2(10) PRIMARY KEY,
    userPw VARCHAR2(20) NOT NULL,
    userName VARCHAR2(10) NOT NULL,
    company_id VARCHAR2(10) REFERENCES company(company_id)
);

-- 게시글 테이블
CREATE TABLE post
(
    post_id VARCHAR2(10) PRIMARY KEY,
    userId VARCHAR2(10) REFERENCES userInfo(userId),
    post_userCompany VARCHAR2(20) REFERENCES company(company_id),
    post_title VARCHAR2(100),
    post_date DATE DEFAULT CURRENT_DATE,
    post_contents varchar2(2000)
);

-- 댓글 테이블
CREATE TABLE comments
(
    comments_id VARCHAR2(15) PRIMARY KEY,
    post_id VARCHAR2(10) REFERENCES post(post_id),
    userId VARCHAR2(10) REFERENCES userInfo(userId),  -- 테이블 이름 수정
    comments_userCompany VARCHAR2(20) REFERENCES company(company_id),
    comments_contents VARCHAR2(1000),
    comments_date DATE DEFAULT CURRENT_DATE
);
commit;

--------------------------------------------------------------------------------
--설계확인
select * from company;
select * from userInfo;
select * from post;
select * from comments;

drop table company;
drop table userInfo;
drop table post;
drop table comments;

--------------------------------------------------------------------------------
--insert
--sample_company
desc company;
insert into company (company_id, company_name) 
values('C001','새회사');
insert into company 
values('C002','GS칼텍스');
insert into company 
values('C003','sk하이닉스');
insert into company  
values('C004','넥슨');
insert into company  
values('C005','공무원');
insert into company  
values('C006','에스원');
insert into company  
values('C007','경찰청');
insert into company  
values('C008','삼성전자');
insert into company  
values('C009','COUPANG');
insert into company  
values('C010','한의사');
commit;

--sample_user
desc userInfo; 
insert into userInfo (USERID, USERPW, USERNAME , COMPANY_ID ) 
values ('U001' , '1234' , '가나다' , 'C001');
insert into userInfo 
values ('U002' , '2345' , '나다라' , 'C002');
insert into userInfo
values ('U003' , '3456' , '다라마' , 'C003');
insert into userInfo 
values ('U004' , '4567' , '라마바' , 'C004');
insert into userInfo 
values ('U005' , '5678' , '마바사' , 'C005');
insert into userInfo 
values ('U006' , '6789' , '바사아' , 'C006');
insert into userInfo 
values ('U007' , '78910' , '사아자' , 'C007');
insert into userInfo 
values ('U008' , '891011' , '아자차' , 'C008');
insert into userInfo 
values ('U009' , '9101112' , '자차카' , 'C009');
insert into userInfo 
values ('U010' , '10111213' , '차카타' , 'C010');
commit;

--post
desc post; 
INSERT INTO post (POST_ID, USERID, POST_USERCOMPANY, POST_TITLE, POST_DATE, POST_CONTENTS)
VALUES (
    '240911U001',
    'U001',
    'C001',
    '회사에서 시간 어떻게 보냄?',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'),
    'istj인데 회사에서 정말정말 할일 없을땐 ' || CHR(10) ||
    '주중, 주말 식단표 짜기 '  || CHR(10) || 
    '가계부정리 '  || CHR(10) || 
    '이직 및 자기계발 목표 계획 짜기 '  || CHR(10) ||
    '이런거 하는데 시간이 살살 녹음 '  || CHR(10) || 
    '나름 생산적이지 않으면서 시간 순삭할 수 있는 거 하는데 다른 유형들은 뭐하면서 월루해?'
);

insert into post 
values (
    '240911U002',
    'U002' ,
    'C002' ,
    '현대자동차 불합격 이유' ,
    TO_DATE('2024-09-11', 'YYYY-MM-DD'),
    '현차 최종까지 갔다가 떨어졌는데 인성검사 때문인 건지 알 수 있는 방법은 없나..? '  || CHR(10) ||
    '인성 때문인지 면접 때문인지 ,, 알아야 개선할 텐데ㅠㅠ');
    
insert into post 
values (
    '240911U003',
    'U003' ,
    'C003' ,
    '스펙 평가' ,
    TO_DATE('2024-09-11', 'YYYY-MM-DD'),
    '현재는 퇴사한지 1년정도 되었음. '  || CHR(10) ||
    '-대략 30살 '  || CHR(10) ||
    '-회사경험 4년 '  || CHR(10) ||
    '-키175 '  || CHR(10) ||
    '-몸무게70 '  || CHR(10) ||
    '-롤 다이아(대학교 롤대회 우승1회) '  || CHR(10) ||
    '-배그 평딜200은 넣음 '  || CHR(10) ||
    '-옵치 다이아 '  || CHR(10) ||
    '-야구 , 축구, 공놀이는 다 괜찮게 잘함 '  || CHR(10) || 
    '-토익 895 '  || CHR(10) ||
    '-토스 150(IH) '  || CHR(10) || 
    '-컴활 1급 '  || CHR(10) || 
    '-한국사 2급 '  || CHR(10) || 
    '공감능력 좋음 '  || CHR(10) || 
    '-경청능력 좋음 '  || CHR(10) || 
    '-습득능력 빠름 '  || CHR(10) || 
    '-적응 빠름 '  || CHR(10) || 
    '-딴 생각도 잘함 '  || CHR(10) ||
    '-성격 둥글둥글함 '  || CHR(10) || 
    '-화도 잘 안냄 '  || CHR(10) || 
    '알바 경험도 많음(카페만 한 4~5년) '  || CHR(10) ||
    '-지방 국립대 '  || CHR(10) || 
    '-외모 나쁘지 않게 생김 '  || CHR(10) ||
    '-여자친구 있음 '  || CHR(10) || 
    '-주식으로 3년동안 4천만원 벌었는데 지금 -3000 임. '  || CHR(10) ||
    '-군필 '  || CHR(10) || 
    '-술 못마심(주량 반병) ');
    
insert into post 
values (
    '240911U004',
    'U004' ,
    'C004' ,
    '이직할때 사유에 평가에 대한 불만및 연봉동결도 괜찮을까?' ,
    TO_DATE('2024-09-11', 'YYYY-MM-DD'),
    '하...');

insert into post 
values (
    '240912U005',
    'U005' ,
    'C005' ,
    '스콘 지금 가면 망하나요??' ,
    TO_DATE('2024-09-12', 'YYYY-MM-DD'),
    '다들 뜯어 말리는데 '  || CHR(10) || 
    '여기보다 훨 좋던데.. '  || CHR(10) || 
    '참고로 최종 합입니다');
    
insert into post 
values (
    '240912U006',
    'U006' ,
    'C006' ,
    '삼성물산 다니는 친구랑 사귀고싶다...' ,
    TO_DATE('2024-09-12', 'YYYY-MM-DD'),
    '르베이지에 돈 너무많이 갖다줘서'  || CHR(10) || 
    'Ssf 몇년째 다이아몬드인데'  || CHR(10) ||
    '삼성물산 다니면 50% 된다며...? ㅠㅠㅠㅠ');

insert into post 
values (
    '240912U007',
    'U007' ,
    'C007' ,
    '자기소개서 쓰는 이유가 있나요?' ,
    TO_DATE('2024-09-12', 'YYYY-MM-DD'),
    '채용시 외국기업은 이력서만 쓴다는데 국내기업은 자소서를 쓰는 이유가 궁금해서요');

insert into post 
values (
    '240912U008',
    'U008' ,
    'C008' ,
    '면접 2곳이 동시에 잡혔을 때 연차' ,
    TO_DATE('2024-09-12', 'YYYY-MM-DD'),
    '서합 2곳이됐는데 2곳다 상향할 수 있는 기업이야'  || CHR(10) ||
    '우리회사 재택근무는 없어서 연차를 써야하는대 어떻게 써야할까?'  || CHR(10) ||
    '둘다 면접일정 맞춰서 써야 겠지?');

insert into post 
values (
    '240912U009',
    'U009' ,
    'C009' ,
    '밑에 경찰청형 빚 글보고 적어본다' ,
    TO_DATE('2024-09-12', 'YYYY-MM-DD'),
    '난 빚이 10억 4천 이다'  || CHR(10) || 
    '코인에 이제 1억 2천있다'  || CHR(10) || 
    '저번달 퇴사했다'  || CHR(10) || 
    '그래도 산다 가족이 있어서 지키려구'  || CHR(10) || 
    '취업 생각없다 취업해서 이 빚 못갚는다'  || CHR(10) ||
    '미련인줄 알지만 코인밖에 답이없다'  || CHR(10) || 
    '코인으로 진 빚 코인으로 되갚는다'  || CHR(10) || 
    '난 할수있다 해낼것이다'  || CHR(10) || 
    '진득하게 장투 들어간다'  || CHR(10) || 
    '잡스러운 글 안쓰고 오늘부터 성과만 보여준다'  || CHR(10) ||
    '다시 일어선다'  || CHR(10) || 
    '돈이돈을번다'  || CHR(10) || 
    '몇달동안 많이 힘들었지만 나를 일으켜세워줄건 코인밖에없다');

insert into post 
values (
    '240912U010',
    'U010' ,
    'C010' ,
    '최종합격 후 막무가내 취소 통지' ,
    TO_DATE('2024-09-12', 'YYYY-MM-DD'),
    '너무 억울해서 4400원 쓰고 비공개로 글올려요.'  || CHR(10) ||
    '이런 경우 있을까 했는데 진짜 있네요'  || CHR(10) || 
    '지원자 시간 연차 노력 다 뭘로 보는건지.. ㅎㅎ'  || CHR(10) ||
    '서류1차2차 면접 다 보고 나서 최종합격 통보 받고 연봉 협상 하자고 해서 모든 개인정보 서류 다 줬습니다. 이 과정 상에서 연차 및 반차 두번 사용했습니다.'  || CHR(10) || 
    '2주 후에 이제와서 나몰라라 연봉이 비싸다 결론으로 후보자 측에 어떤 협의도 없이 결렬통보받았어요…. ㅋㅋㅋㅋ'  || CHR(10) || 
    '서류부터 해서 모든 과정에서 연봉 선 문의했습니다. 인사팀 선에서 알겠다고 했었는데, 최종 결정권자에서 안된다고 했다는 답만 받았습니다.'  || CHR(10) ||
    '이게 말이 되나요? 결국 나가면 다 소비자 아닌가?'  || CHR(10) || 
    '업계에 대한 실망과 환멸까지 느껴집니다.'  || CHR(10) ||
    '상장사에 업계에서는 상위권 회사인데 이렇게 처우를 하네요..');
commit;

--comments
desc comments;
INSERT INTO comments (COMMENTS_ID, POST_ID, USERID, COMMENTS_USERCOMPANY, COMMENTS_CONTENTS, COMMENTS_DATE)
VALUES (
    '240911U001U010', 
    '240911U001', 
    'U010', 
    'C010', 
    '주제하나 각잡고, 주말에 어떤식으로 탐구할지 계획세우기. 이러니까 그 분야 전문가 되더라. 출판요청도 많이 오고. ISTJ가 그런점에서는 개꿀.',
    TO_DATE('2024-09-12', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U001U009', 
    '240911U001', 
    'U009', 
    'C009', 
    '작성자가 삭제한 댓글입니다.',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U002U008', 
    '240911U002', 
    'U008', 
    'C008', 
    '레퍼런스 체크 떨어진거아니야?',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U002U007', 
    '240911U002', 
    'U007', 
    'C007', 
    '경력? 신입?',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments
VALUES (
    '240911U002U001', 
    '240911U002', 
    'U001', 
    'C001', 
    '운이 안좋았나봅니다. 화이팅!',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240911U002U002', 
    '240911U002', 
    'U002', 
    'C002', 
    'HD랑 현대차랑 다를수도있쥬',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240911U002U003', 
    '240911U002', 
    'U003', 
    'C003', 
    '인성은 1단계 전형이잖아요',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U003U006', 
    '240911U003', 
    'U006', 
    'C006', 
    '친구일 때 가장 재밌는 남자',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U003U005', 
    '240911U003', 
    'U005', 
    'C005', 
    'ㅋㅋㅋㅋㅋ친구들 한테 인기많을듯',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U003U004', 
    '240911U003', 
    'U004', 
    'C004', 
    '같이 롤하고 싶은 스펙이군ㅋㅋㅋㅋㅋ',
    TO_DATE('2024-09-12', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U004U003', 
    '240911U004', 
    'U003', 
    'C003', 
    '네',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U004U002', 
    '240911U004', 
    'U002', 
    'C002', 
    '불만보단 발전적인 방향으로 얘기하자...',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240911U004U001', 
    '240911U004', 
    'U001', 
    'C001', 
    '아니 그건 좋은 사유가 아님',
    TO_DATE('2024-09-11', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240912U005U002', 
    '240912U005', 
    'U002', 
    'C002', 
    '오세요 ㅋ',
    TO_DATE('2024-09-12', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U005U003', 
    '240912U005', 
    'U003', 
    'C003', 
    '정신차리셈 모비스에서 왔던 사람들 다 ㅈㄴ 후회중이다',
    TO_DATE('2024-09-12', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U005U004', 
    '240912U005', 
    'U004', 
    'C004', 
    '개 고민되네\' || CHR(10) ||
    '원래 자회사 까는게 국룰이긴한데.. 쌔하기고 하고',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U006U005', 
    '240912U006', 
    'U005', 
    'C005', 
    '혈육이 삼물이라 ssf할인받을때 진짜 좋음 ㅋㅋㅋㅋ',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));

INSERT INTO comments 
VALUES (
    '240912U006U006', 
    '240912U006', 
    'U006', 
    'C006', 
    '우왕 다이아몬드 호ㄱ...아니 고객님',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U007U007', 
    '240912U007', 
    'U007', 
    'C007', 
    '개꼰대스트들이라서.',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U007U008', 
    '240912U007', 
    'U008', 
    'C008', 
    '이력서만 보는 곳도 있긴 함'  || CHR(10) || 
    '자소서..사실 별 의미없지..',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U007U009', 
    '240912U007', 
    'U009', 
    'C009', 
    '그러게요 저도 이해가 안되긴해요..',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U007U010', 
    '240912U007', 
    'U010', 
    'C010', 
    '아직 공채위주니까 지원자가 너무 많아서 그런거지…'  || CHR(10) ||
    '헤드헌팅이나 경력직만 되도 자소서 잘 안 보잖아',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments
VALUES (
    '240912U008U001', 
    '240912U008', 
    'U001', 
    'C001', 
    '면접 일정에 맞춰서 써야 면접을 갈 수 있겠죠?',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U008U002', 
    '240912U008', 
    'U002', 
    'C002', 
    '뭘 물어 당연한것을',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U009U003', 
    '240912U009', 
    'U003', 
    'C003', 
    '...돈은 누가 벌고 있나요...ㄷㄷ',
    TO_DATE('2024-09-12', 'YYYY-MM-DD'));
    
INSERT INTO comments
VALUES (
    '240912U009U004', 
    '240912U009', 
    'U004', 
    'C004', 
    '집이 얼마짜린데 8억을 빌렸어?',
    TO_DATE('2024-09-12', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U009U005', 
    '240912U009', 
    'U005', 
    'C005', 
    '야 그건 도박하는 마음이야.'  || CHR(10) ||
    '스스로도 알고있지?',
    TO_DATE('2024-09-12', 'YYYY-MM-DD'));
    
INSERT INTO comments
VALUES (
    '240912U009U006', 
    '240912U009', 
    'U006', 
    'C006', 
    '지금이라도 정신차리고 비트코인사라',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U009U004', 
    '240912U009', 
    'U004', 
    'C004', 
    '엉뚱한데서 마진하지말고 진득하게 현물로만 하세요',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U009U005', 
    '240912U009', 
    'U005', 
    'C005', 
    '와 궁금하긴하다 이형이 다시 일어서게 될지',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));

INSERT INTO comments
VALUES (
    '240912U010U007', 
    '240912U010', 
    'U007', 
    'C007', 
    '문서로 오퍼레터받았어?',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U010U008', 
    '240912U010', 
    'U008', 
    'C008', 
    '거기 어딘지 알거같뉴',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U010U009', 
    '240912U010', 
    'U009', 
    'C009', 
    '노무사랑 상담해',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
    
INSERT INTO comments 
VALUES (
    '240912U010U010', 
    '240912U010', 
    'U010', 
    'C010', 
    '와 경우없네',
    TO_DATE('2024-09-13', 'YYYY-MM-DD'));
COMMIT;
    
--------------------------------------------------------------------------------
--select
--전체 게시글목록
SELECT 
    post_title "HOME"
FROM post;

--게시글 상세조회
SELECT 
    p.post_title AS "게시글제목",
    c1.company_name AS "작성자회사",  
    RPAD(p.userId,8,'*') AS "작성자아이디",
    p.post_contents AS "작성내용",
    p.post_date AS "작성날짜",
    LISTAGG(
        c2.company_name || '(' || RPAD(s.userId,8,'*') || '): ' || s.comments_contents || TO_CHAR(s.comments_date, ' YYYY-MM-DD') || CHR(10) ,CHR(10) 
    ) WITHIN GROUP (ORDER BY s.comments_date) AS "모든댓글"
FROM post p
JOIN comments s ON p.post_id = s.post_id
JOIN company c1 ON p.post_usercompany = c1.company_id  -- 게시글 작성자의 회사
JOIN company c2 ON s.comments_userCompany = c2.company_id  -- 댓글 작성자의 회사
WHERE p.post_id ='240911U001'
--'240911U001', '240911U002', '240911U003', '240911U004', '240912U005', '240912U006', '240912U007', '240912U008', '240912U009', '240912U010'
GROUP BY 
    p.post_title,
    p.post_date,
    c1.company_name,
    p.userId,
    p.post_contents
ORDER BY p.post_date;

--토픽베스트 5: 댓글 많은 게시글
SELECT *
FROM (
    SELECT 
        p.post_title AS "토픽베스트 5",
        COUNT(s.comments_id) AS "댓글 수"
    FROM post p
    JOIN comments s ON p.post_id = s.post_id 
    GROUP BY p.post_title
    ORDER BY COUNT(s.comments_id) DESC
) 
WHERE ROWNUM <= 5;

--아이디 별 작성한 댓글
SELECT 
    c.userId AS "아이디", 
    c.comments_contents || ' ' || TO_CHAR(c.comments_date, 'YYYY-MM-DD') || ' (게시글제목: ' || p.post_title || ')' AS "내가 작성한 댓글 (게시글 제목)"
FROM comments c
JOIN post p ON c.post_id = p.post_id
WHERE c.userId = 'U001';
--'U001', 'U002', 'U003', 'U004', 'U005', 'U006', 'U007', 'U008', 'U009', 'U010'
--------------------------------------------------------------------------------











