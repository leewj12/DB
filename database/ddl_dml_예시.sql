use 교보문고1;
create table book(
bookid int not null,
bookname varchar(20) not null,
publisher varchar(20) unique,
price int default 10000 check(price > 1000),
primary key (bookid)
);
-- book 테이블에 데이터 삽입
insert into book values(1,'축구의 역사','굿스포츠',7000);
insert into book (price,bookid,bookname,publisher)
values(7000,2,'축구의 역사','스포츠');

delete from book;
delete from book where bookid = 2;

update book
set price = 10000
where bookname = '축구의 역사';

-- drop table book;

-- drop table customer;

create table customer(
cusid int not null primary key,
name varchar(40) not null,
address varchar(40),
phone varchar(30)
);

create table orders(
orderid int not null primary key,
cusid int not null,
bookid int not null,
saleprice int not null,
orderdate date,
foreign key(cusid) references customer(cusid)
on delete cascade
on update cascade, -- (문제 조심)
foreign key(bookid) references book(bookid)
on delete cascade
);



create table newbook(
bookid int ,
bookname varchar(20),
publisher varchar(20),
price int
);

alter table newbook add primary key(bookid);

-- isbn 칼럼 추가 varchar(13)
alter table newbook add isbn varchar(13);

-- isbn 칼럼 타입을 int로 수정
alter table newbook modify isbn int;

-- isbn 칼럼 삭제
alter table newbook drop column isbn;

-- newbook 테이블 삭제
drop table newbook;


