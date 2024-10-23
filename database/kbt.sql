use 교보문고1;
SELECT 책이름, 출판사 FROM kb_table order by 책이름 desc;

-- kb_table 에서 책이름에 '인간'이라는 글자가 포함된 책이름, 출판사, 할인가를 검색하여 
-- 할인가격이 낮은 것부터 출력하되 가격이 같으면 책이름을 기준으로 내림차순 정렬
select 책이름, 출판사, 할인가
from kb_table
where 책이름 like '%인간%'
order by 할인가, 책이름 desc;

select *
from kb_table;

-- 할인가의 합계, 평균, 최소가, 최대가 가져오기
select 
출판사,
sum(할인가) as 가격합계,
avg(할인가) as 가격평균,
max(할인가) as 최고가,
min(할인가) as 최소가
from kb_table
-- where 출판사 = '미래엔아이세움';
group by 출판사 
order by 출판사;

-- 출판사 별로 도서의 수량과 할인가격의 합계 검색
-- 단 각 필드명을 도서수량, 할인가합계로 지정
-- 출판도서 수가 5개 이상인 것을 도서수량에 대해 내림차순으로 정렬
select 출판사, count(*) as 도서수량, sum(할인가) as 할인가합계
from kb_table
where 출판사 like '%스%'
group by 출판사
having 도서수량 >=5
order by 도서수량 desc;

alter table publisher rename pulisher;

select *
from kb_table,pulisher; 

select 순위, 책이름, 저자, kb_table.출판사, 할인가, 할인가, 주소, 전화번호
from kb_table,pulisher
where kb_table.출판사 = pulisher.출판사;
