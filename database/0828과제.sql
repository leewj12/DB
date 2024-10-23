create database kosmo;
use kosmo;

-- p8의 구조로 테이블 book, orders, customer 생성
create table book(
bookid int,
bookname varchar(30),
publisher varchar(20),
price int
);

create table orders(
orderid int,
cusid int,
bookid int,
saleprice int,
orderdate date
);

create table customer(
cusid int,
name varchar(5),
address varchar(30),
phone varchar(13)
);

-- primary key, foreign key, 스키마 구조 정의
alter table book add primary key(bookid);

alter table customer add primary key(cusid);

alter table orders add primary key(orderid);
ALTER TABLE orders add FOREIGN KEY (bookid) REFERENCES book(bookid);
ALTER TABLE orders add FOREIGN KEY (cusid) REFERENCES customer(cusid);

-- 값을 입력하기
insert into book values(1,'축구의 역사','굿스포츠',7000),
(2,'축구하는 여자','나무수',13000),
(3,'축구의 이해','대한미디어',22000),
(4,'골프 바이블','대한미디어',35000),
(5,'피겨 교본','굿스포츠',8000),
(6,'역도 단계별기술','굿스포츠',6000),
(7,'야구의 추억','이상미디어',20000),
(8,'야구를 부탁해','이상미디어',13000),
(9,'올림픽 이야기','삼성당',7500),
(10,'olympic champions','pearson',13000);

insert into customer values(1,'박지성','영국 맨체스터','000-5000-0001'),
(2,'김연아','영국 맨체스터','000-6000-0001'),
(3,'장미란','대한민국 서울','000-7000-0001'),
(4,'추신수','미국 클리블랜드','000-8000-0001');
insert into customer (cusid,name,address)
values(5,'박세리','대한민국 대전');

insert into orders values(1,1,1,6000,'2020-07-01'),
(2,1,3,21000,'2020-07-03'),
(3,2,5,8000,'2020-07-03'),
(4,3,6,6000,'2020-07-04'),
(5,4,7,20000,'2020-07-05'),
(6,1,2,12000,'2020-07-07'),
(7,4,8,13000,'2020-07-07'),
(8,3,10,12000,'2020-07-08'),
(9,2,10,7000,'2020-07-09'),
(10,3,8,13000,'2020-07-10');