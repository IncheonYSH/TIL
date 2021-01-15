

# MariaDB

```powershell
cd C:\Users\---
dir /w
mysql -u root -p
source employees.sql
```

기본키

후보키

외래키

```mysql
[mysqld]
datadir = C:/Program Files/MariaDB 10.3/data
port = 3306
innodb_buffer_pool_size = 3833M
character-set-server = utf8
[client]
port = 3306
plugin-dir = C:/Program Files/MariaDB 10.3/lib/plugin

-- select 열 이름 from 테이블 이름 [where 조건]
select memberID from membertbl where memberName = '지운이';

-- ctrl + space 키를 누르면 자동완성 가능
-- 모든 sql 쿼리는 ; 로 종결한다.
select * from producttbl; -- * All


-- 특정열을 나열함
select memberID, memberName from membertbl;

-- create table `my testTBL` (id INT);

-- 테이블 삭제
-- drop table `my testtbl`;

-- 지워진 데이터를 보관할 테이블 생성
create table deleteMemberTBL
    (
    memberID char(8),
    memberName char(5),
    memberAddres char(20),
    deletedDate date -- 삭제한 날짜
    );

-- 트리거 생성
DELIMITER //
CREATE TRIGGER tra_deletedmemberTBL -- trigger
    AFTER DELETE -- 삭제후에 동작
    ON memberTBL -- memberTBL 에서 삭제가 일어나면 트리거 동작
    FOR EACH ROW -- 각각의 행 마다 적용
BEGIN
    INSERT INTO deleteMemberTBL
    values(OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE()) -- OLD. 휴지통 개념
END
DELIMITER ;

```

## 예제

```mysql


create table 고객
(
    고객아이디 varchar(20) not null,
    고객이름 varchar(10) not null,
    나이 int,
    등급 varchar(10) not null,
    직업 varchar(20),
    적립금 int default 0,
    primary key(고객아이디)
);


create table 제품
(
    제품번호 char(3) not null,
    제품명 varchar(20),
    재고량 int,
    단가 int,
    제조업체 varchar(20),
    primary key(제품번호),
    check (재고량>= 0 and 재고량<= 10000)
);


create table 주문
(
    주문번호 char(3) not null,
    주문고객 varchar(20),
    주문제품 char(3),
    수량 int,
    배송지 varchar(30),
    주문일자 date,
    primary key(주문번호),
    foreign key(주문고객) references 고객(고객아이디),
    foreign key(주문제품) references 제품(제품번호)
);

-- [고객 테이블에 튜플 삽입]
INSERT INTO 고객 VALUES ('apple', '정소화', 20, 'gold', '학생', 1000);
INSERT INTO 고객 VALUES ('banana', '김선우', 25, 'vip', '간호사', 2500);
INSERT INTO 고객 VALUES ('carrot', '고명석', 28, 'gold', '교사', 4500);
INSERT INTO 고객 VALUES ('orange', '김용욱', 22, 'silver', '학생', 0);
INSERT INTO 고객 VALUES ('melon', '성원용', 35, 'gold', '회사원', 5000);
INSERT INTO 고객 VALUES ('peach', '오형준', NULL, 'silver', '의사', 300);
INSERT INTO 고객 VALUES ('pear', '채광주', 31, 'silver', '회사원', 500);

-- [제품 테이블에 튜플 삽입]
INSERT INTO 제품 VALUES ('p01', '그냥만두', 5000, 4500, '대한식품');
INSERT INTO 제품 VALUES ('p02', '매운쫄면', 2500, 5500, '민국푸드');
INSERT INTO 제품 VALUES ('p03', '쿵떡파이', 3600, 2600, '한빛제과');
INSERT INTO 제품 VALUES ('p04', '맛난초콜릿', 1250, 2500, '한빛제과');
INSERT INTO 제품 VALUES ('p05', '얼큰라면', 2200, 1200, '대한식품');
INSERT INTO 제품 VALUES ('p06', '통통우동', 1000, 1550, '민국푸드');
INSERT INTO 제품 VALUES ('p07', '달콤비스킷', 1650, 1500, '한빛제과');

-- [주문 테이블에 튜플 삽입]
INSERT INTO 주문 VALUES ('o01', 'apple', 'p03', 10, '서울시 마포구', '19/01/01');
INSERT INTO 주문 VALUES ('o02', 'melon', 'p01', 5, '인천시 계양구', '19/01/10');
INSERT INTO 주문 VALUES ('o03', 'banana', 'p06', 45, '경기도 부천시', '19/01/11');
INSERT INTO 주문 VALUES ('o04', 'carrot', 'p02', 8, '부산시 금정구', '19/02/01');
INSERT INTO 주문 VALUES ('o05', 'melon', 'p06', 36, '경기도 용인시', '19/02/20');
INSERT INTO 주문 VALUES ('o06', 'banana', 'p01', 19, '충청북도 보은군', '19/03/02');
INSERT INTO 주문 VALUES ('o07', 'apple', 'p03', 22, '서울시 영등포구', '19/03/15');
INSERT INTO 주문 VALUES ('o08', 'pear', 'p02', 50, '강원도 춘천시', '19/04/10');
INSERT INTO 주문 VALUES ('o09', 'banana', 'p04', 15, '전라남도 목포시', '19/04/11');
INSERT INTO 주문 VALUES ('o10', 'carrot', 'p03', 20, '경기도 안양시', '19/05/22');
```




```mysql

create table 배송업체
(
    업체번호 char(3) not null,
    업체명 varchar(20),
    주소 varchar(20),
    전화번호 varchar(20),
    primary key(업체번호)
);


-- 테이블에 속성 추가
alter table 고객 add 가입날짜 date;


-- 테이블 속성 삭제
alter table 고객 drop column 가입날짜;
select * from 고객;


-- 고객 테이블에 나이가 20세 이상인 회원만 가입하도록 제약 추가
alter table 고객 add constraint chk_age check(나이 >= 20);


-- 제약 조건 확인
select * from information_schema.table_constraints;

use `판매`; 


-- 제약조건 삭제
alter table 고객 drop constraint chk_age;


-- 테이블 삭제 : drop table
drop table 배송업체;


-- 데이터 검색
-- select[all|distinct] 속성1, 속성2
-- from 테이블리스트;

-- [all|distinct] - 중복허용여부결정
-- 테이블을 먼저 확인한 뒤 필요한 필드를 선택하는 순서로 실행된다.

select 고객아이디, 고객이름, 등급
from 고객;


-- 고객테이블에 존재하는 모든 속성 검색
select *
from 고객;


-- all/distinct
-- 제품 테이블에서 제조업체 속성을 검색
-- 거래하는 제조업체 확인
-- 중복 제거
select distinct 제조업체
from 제품;


-- 출력되는 필드(속성)의 이름을 바꾸어서 출력
-- AS 키워드 : 속성이름을 바꾸어 출력
-- AS는 생략 가능
select 제조업체 as 거래처
from 제품;


-- 제품 테이블에서 제품명과 단가 검색
select 제품명, 단가 as 가격, 단가 * 1.1 as 인상단가
from 제품;


-- 산술식을 이용한 검색
-- select 키워드와 함께 산술식을 제시
-- 속성 산술연산자 상수 : 단가 * 1.1
-- 속성값이 실제 변경되는 것은 아니고 결과테이블에서만 계산된 결과값이 출력됨
select 제품명, 단가 + 500 as 조정단가
from 제품;

-- 새 별명에 공백이 있는 경우
select 제품명, 단가 + 500 as `조정 단가`
from 제품;


-- where 키워드와 함께 비교, 논리 연산자등을 이용한 검색 조건 제시
-- 숫자, 문자, 날짜 값 등을 비교 가능
-- 조건에서 문자나 날짜 값은 작은따옴표로 묶어서 표현
-- select from 
-- [where 조건];

select 제품명, 재고량, 단가
from 제품
where 제조업체 = '한빛제과';


select 주문제품, 수량, 주문일자
from 주문
where 주문고객 = 'apple' and 수량 >= 15;

-- like : 기호 % 나 _ 와 함께 사용
-- % : 0 개 이상의 문자
-- _ : 1 개의 문자
-- like '데이터%' : 데이터로 시작하는 문자열
-- like % 데이터 : 데이터로 끝나는 문자열
-- like %데이터% : 데이터가 포함된 문자열
-- like '데이터___' : 데이터로 시작하는 6자 길이의 문자열
-- like '__데이터' : 데이터로 끝나는 5자 길이의 문자열
-- like '__ 한%' : 세번째 글자가 '한'인 문자열

select 고객아이디, 고객이름 등급
from 고객
where 고객아이디 like '_____';


-- null 키워드
-- is null : 값이 null 인지 확인, is not null : null 값이 아닌지확인
-- 검색조건에서 null값은 다른 값과 크기를 비교하면 결과가 모두 거짓
select 고객이름
from 고객
where 나이 is null;


-- 정렬 검색 : order by
-- order by 속성1, 속성2, ...  asc|desc (기본값은 오름차순)
-- 여러 기준에 따라 정렬하면 정렬 기준이 되는 속성을 차례대로 제시
-- null : 오름차순에서는 처음, 내림차순에서는 마지막

-- select - 3번째 실행
-- from - 1번째 실행
-- where - 2번째 실행
-- order by - 4번째 실행
-- order by 구문은 가장 마지막에 위치해야 함

select 고객이름, 등급, 나이
from 고객
order by 나이 desc;

select 고객이름, 등급, 나이
from 고객
order by 나이 asc;


select 주문고객, 주문제품, 수량, 주문일자
from 주문
where 수량 >= 10
order by 주문제품 asc, 수량 desc;

-- 집계 함수
-- 특정 속성값을 통계적으로 계산한 결과를 검색한다.
-- 개수, 합계, 평균, 최댓값, 최솟값
-- null 은 제외하고 계산함
-- where 와 함께 사용할수 없다
-- select, having 에서 사용가능
select avg(단가) as 단가평균
from 제품;


select sum(재고량) as "재고량 합계"
from 제품
where 제조업체 = "한빛제과";


select count(고객아이디) as 고객수
from 고객;

select count(나이) as 고객수 -- null 값이 포함되어있으므로 부적절함
from 고객;

select count(*) as 고객수 -- 전체 행의 수
from 고객;

select count(distinct 제조업체) as '제조업체 수'
from 제품;
 
 
-- 그룹별 검색

-- select [all|distinct] 속성1, 집계함수(속성2)
-- from
-- [where 조건]
-- [group by 속성리스트 [having 그룹에 대한 조건]]
-- [order by [asc|desc]]

-- group by 키워드를 이용: 특정 속성의 값이 같은 튜플을 모아 그룹을 만들고 그룹별로 검색함
-- group by 기준 속성 having 조건
-- 그룹을 나누는 기준이 되는 속성은 select 에도 작성하는 것이 좋음

select * from 주문;

select 주문제품, sum(수량) as 총주문수량
from 주문
group by 주문제품; -- 

-- 그룹의 기준이 되는 필드 외에 다른 필드를 선택하면 안된다.
-- group by 연산시에는 기준 필드 외에 일반 필드는 집계함수를 사용하거나 표현하지 않는다.
select 주문제품, 주문고객, sum(수량) as 총주문수량
from 주문
group by 주문제품; -- 이렇게 쓰면 안된다


select 주문제품, count(주문고객) as 총주문고객수, sum(수량) as 총주문수량
from 주문
group by 주문제품;


-- where 는 select 보다 실행 순서가 빠르므로 having 을 사용하여 group 별로 적용해야하는 집계함수에 대한 조건을 적용한다
select 제조업체, count(*) as 제품수, max(단가) as 최고가
from 제품
group by 제조업체
having count(*) >= 3;

select 등급, count(*) as 고객수, avg(적립금) as 적립금평균
from 고객
group by 등급
having avg(적립금) >= 1000;

select 주문고객, 주문제품, sum(수량) as 총주문수량
from 주문
group by 주문고객, 주문제품;


-- join: 여러 테이블에 대한 검색
-- 조인 속성: 조인 검색을 위해 테이블을 연결해주는 속성
-- 보통 조인 속성은 한쪽의 테이블에서 외래키로 지정되어 있다.
-- 연결하려는 테이블간에 조인속성은 이름은 달라도 되지만 도메인(실제 갑의 범위)은 같아야 한다.

-- from 검색에 필요한 모든 테이블 나열
-- where 조인 속성의 값이 같아야 함을 의미하는 조건을 제시
-- 같은 이름의 속성이 서로 다른 테이블에 존재할 수 있다
-- 해당 속성이 소속된 테이블의 이름을 표시한다
-- 테이블이름.속성이름 = 테이블이름.속성이름

-- 판매 데이터 베이스에서 banana 고객이 주문한 제품의 이름을 확인
select 제품명
from 주문, 제품
where 주문.주문제품 = 제품.제품번호 and 주문.주문고객 = 'banana';

select 주문.`주문제품`, 주문.`주문일자`
from 고객, 주문
where 고객.`나이` >= 30 and 고객.고객아이디 = 주문.주문고객;

select o.`주문제품`, o.`주문일자`
from 고객 c, 주문 o
where c.`나이` >= 30 and c.고객아이디 = o.주문고객;

-- 테이블 세개 이상에 대하여 조인(병합)
-- 판매 데이터베이스에서 고명석 고객이 주문한 제품의 제품명 검색
select 제품.제품명
from 고객, 제품, 주문
where
    고객.`고객아이디` = 주문.`주문고객` and 고객.고객이름 = '고명석'
	 and 주문.주문제품 = 제품.제품번호;

-- 부속질의가 다중행이면 이와같은 비교연산자는 사용 불가능 하다
select 제품명, 단가
from 제품
where 제조업체 = 
(
    select 제조업체
    from 제품
    where 제품명 = '달콤비스킷'
);


-- 판매 데이터베이스에서 적립금이 가장 많은 고객의 고객 이름과 적립금을 검색
select 고객이름, 적립금
from 고객
where 적립금 =
(
    select max(적립금) from 고객
);


-- banana 고객이 주문한 제품의 제품명과 제조업체
select 제품명, 제조업체
from 제품
where 제품번호 in 
(
    select 주문제품
    from 주문
    where 주문고객 = 'banana'
);
    
    
-- 판매 데이터베이스에서 대한식품이 제조한 모든 제품의 단가보다 비싼 제품의 제품명, 단가, 제조업체를 검색
select 제품명, 단가, 제조업체
from 제품
where 단가 > all
(
    select 단가
    from 제품
    where 제조업체 = '대한식품'
);


-- 어떤한 대한식품의 제품 단가보다 비싼 제품의 제품명, 단가, 제조업체
select 제품명, 단가, 제조업체
from 제품
where 단가 > any
(
    select 단가
    from 제품
    where 제조업체 = '대한식품'
);


-- exists : 부속질의문의 결과값이 하나라도 존재하면
-- not exists : 부속 질의문의 결과갑싱 하나도 존재하지 않으면
-- 특정일에 주문한 고객 이름
select 고객이름 
from 고객
where exists
(
    select *
    from 주문
    where 주문일자 = '2019-03-15' and
	 주문.주문고객 = 고객.고객아이디
);


-- 특정일에 주문하지 않은 고객 이름
select 고객이름 
from 고객
where not exists
(
    select *
    from 주문
    where 주문일자 = '2019-03-15' and
	 주문.주문고객 = 고객.고객아이디
```



## 데이터 삽입, 수정, 삭제

```mysql
-- 데이터 삽입
insert
into 고객(고객아이디, 고객이름, 나이, 등급, 적립금)
values ('tomato', '정은심', 36, 'gold', 100)

-- 데이터 삽입
insert
into 고객
values ('tomato', '정은심', 36, 'gold', null, 100)


-- 데이터 수정
update 제품
set 재고량 = 3000
where 제품번호 = 'p03';

-- update 시 수식 적용 가능
update 제품
set 단가 = 단가 * 1.1;


update 주문
set 수량 = 5
where 주문고객 in
(
    select 고객아이디
    from 고객
    where 고객이름 = '정소화'
);

select * from 주문;


-- 데이터 삭제 : delete
delete
from 주문
where 주문일자 = '2019-05-22';


-- 정소화 고객이 주문한 주문내역 모두 삭제
delete
from 주문
where 주문고객 in
(
    select 고객아이디
    from 고객
    where 고객이름 = '정소화'
);
```



