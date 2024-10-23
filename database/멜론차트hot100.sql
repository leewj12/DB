-- 주석문
-- 커서가 위치한 한줄실행 : ctrl + enter
-- 여러줄 실행 : 여러줄 범위지정 후 ctrl + enter
-- 전체 소스 실행 : ctrl + shift + enter

alter table 멜론차트hot100 rename mcthot100;
alter table 멜론차트100 rename mct100;

use 멜론차트;
select * from mcthot100;
select 순위,가수,좋아요 from mcthot100;
-- DELETE FROM mcthot100;

SELECT 순위,가수,좋아요 
FROM mcthot100 
where 좋아요 >= 100000;

-- 좋아요 7000~10000 사이인 곡의 가수,노래제목,좋아요 출력 
select 가수
from mcthot100
where 좋아요 >= 7000 and 좋아요 <= 10000;

select distinct 가수
from mcthot100
where 좋아요 >= 7000 and 좋아요 <= 10000;

select distinct 가수, 좋아요
from mcthot100
where 좋아요 between 7000 and 10000;

-- 좋아요가 10만이상인 가수 중 이름에 'New'가 들어간
-- 가수, 제목, 좋아요를 출력하세요
select 가수,제목,좋아요
from mcthot100
where (좋아요 >= 100000) and (가수 like '%New%');

-- 가수명이 NewJeans, aespa, NMIXX 의 순위, 제목, 가수, 좋아요 출력
-- in을 사용, or를 사용하는 2개의 명령어 완성
select 순위,제목,가수,좋아요
from mcthot100
where 가수 in ('NewJeans', 'aespa', 'NMIXX');

select 순위,제목,가수,주간베스트주간베스트좋아요
from mcthot100
where (가수 = 'NewJeans') or (가수 = 'aespa') or (가수 = 'NMIXX');
