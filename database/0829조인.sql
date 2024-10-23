use kosmo;

-- 동등조인
select *
from customer,orders
where customer.cusid = orders.cusid
order by customer.cusid;

select name,saleprice
from customer,orders
where customer.cusid = orders.cusid;

select name,sum(saleprice)
from customer,orders
where customer.cusid = orders.cusid
group by customer.name
order by customer.name;

select customer.name,book.bookname
from customer,orders,book
where customer.cusid = orders.cusid and orders.bookid = book.bookid;

select customer.name,book.bookname
from customer,orders,book
where customer.cusid = orders.cusid and orders.bookid = book.bookid and book.price = 20000;

-- 외부조인
select customer.name, saleprice
from customer left outer join orders on customer.cusid = orders.cusid;

select bookname
from book
where price = (select max(price) from book);

select name
from customer
where cusid in(select cusid from orders);

select name
from customer
where cusid in(select cusid
from orders
where bookid in(select bookid
from book
where publisher = '대한미디어'
));

select b1.bookname
from book b1
where b1.price > (select avg(b2.price)
from book b2
where b2.publisher = b1.publisher);

select b1.bookname
from book b1
where b1.price > (
select avg(b2.price)
from book b2
where b1.publisher = b2.publisher
);

select name
from customer
except
select name
from customer
where cusid in (select cusid from orders);

select name, address
from customer cs
where exists (select *
from orders od
where cs.cusid = od.cusid);

-- 박지성이 구매한 도서의 출판사 수


-- ----------------------------------------------------------
SELECT * FROM 교보문고1.pulisher;

-- 나 로 시작하는 출판사에 대해 주소를 '서울시 서초구'
-- 다 로 시작하는 출판사의 주소를 '대전시 유성구'

use 교보문고1;

update publisher
set 주소 = '경기도 안양시';

-- 트랜젝션(임의의 작업을 수행하기 위한 명령어들의 집합)
commit;
rollback;

alter table pulisher rename publisher;

update publisher
set 주소 = '서울시 서초구'
where 출판사 like '나%' or 출판사 like '%스%';

update publisher
set 주소 = '대전시 유성구'
where 출판사 like '다%' or 출판사 like '%이%' or 출판사 like '%대%';

SELECT * FROM 교보문고1.kb_table;

alter table kb_table add 주소 varchar(45);

update kb_table
set 주소 = (
select 주소 
from publisher
where publisher.출판사 = kb_table.출판사
);

use kosmo;

select * from orders;

alter table orders add bookname varchar(20);

-- book 테이블의 bookname 값을 orders 테이블의 bookname 필드에 가져오기
-- 단 두개 테이블의 bookid가 일치하는 경우에 명령을 수행하도록 하세요

update orders
set bookname = (
select bookname 
from book
where book.bookid = orders.bookid
);


