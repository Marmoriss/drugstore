-- (관리자 계정) drugstore 일반계정 생성
alter session set "_oracle_script" = true;

create user drugstore
identified by drugstore
default tablespace users;

alter user drugstore quota unlimited on users;

grant connect, resource to drugstore;

-- drugstore 계정
create table 어쩌고();
-- 멤버 테이블
create table member(
    member_id varchar2(50),
    name varchar2(10) not null,
    password varchar2(300) not null,
    phone char(11) not null,
    created_at date default sysdate,
    updated_at date,
    enabled number default 1,
    recipient varchar2(10),
    post_code varchar2(10),
    address  varchar2(512),
    detail_address  varchar2(512),
    memo varchar2(100),
    constraint pk_member_id primary key(member_id)
);

-- 카테고리
create table category(
    category_id number, -- 카테고리 코드
    category_lev number, -- 카테고리 레벨
    category_nm varchar2(10), -- 카테고리 이름("대분류", "소분류")
    category_detail_name varchar2(255), -- 카테고리 이름("성분별", "비타민", "부위별", "눈")
    category_parent_lev number,
    constraint pk_category_id primary key(category_id)
);

-- 상품
create table product(
    pcode number,
    big_code varchar2(50),
    small_code number,
    sttenmt_no varchar2(3000),
    pname varchar2(3000),
    manu varchar2(3000) not null,
    price number not null,
    amount  number not null,
    ingre_name varchar2(50),
    main_fnctn varchar2(3000),
    intake_hint1 varchar2(3000),
    srv_use varchar2(3000),
    distb_pd varchar2(3000),
    sub_yn char(1) default 'N',
    base_standard varchar2(3000),
    sale_status char(1) default 'Y',
    constraint pk_product_pcode primary key(pcode),
    constraint fk_product_category_code foreign key(big_code, small_code) references category(big_code, small_code) on delete cascade,
    constraint uq_product_pname unique(pname),
    constraint ck_product_sub_yn check(sub_yn in ('Y', 'N')),
    constraint ck_product_sale_status check(sale_status in ('Y', 'N'))
);

-- 입출고
create table product_io(
    io_no number,
    pcode number,
    io_status char(1) not null,
    io_amount number default 0,
    stock number not null,
    constraint pk_product_io_no_pcode primary key(io_no, pcode),
    constraint fk_product_io_pcode foreign key(pcode) references product(pcode) on delete cascade
);

-- 상품 첨부
create table product_attachment(
    attach_no varchar2(50),
    pcode number,
    original_filename varchar2(256) not null,
    renamed_filename varchar2(256) not null,
    created_at date default sysdate,
    constraint pk_product_attachment_attach_no primary key(attach_no),
    constraint fk_product_attachment_pcode foreign key(pcode) references product(pcode) on delete cascade
);

-- 1:1 채팅
create table chat_member(
    chatroom_id varchar2(50),
    member_id varchar2(50),
    last_check number default 0,
    created_at date default sysdate,
    deleted_at date,
    constraint pk_chat_member primary key(chatroom_id, member_id), -- 복합 PK
    constraint fk_chat_member_id foreign key(member_id) references member(member_id) on delete cascade
);

-- 채팅 로그
create table chat_log(
    no number,
    chatroom_id varchar2(50),
    member_id varchar2(50),
    msg varchar2(4000),
    time number,
    constraint pk_chat_log primary key(no),
    constraint fk_chat_log foreign key(chatroom_id, member_id) references chat_member(chatroom_id, member_id)
);

-- 건강설문
create table servey(
    no number,
    member_id varchar2(50),
    gender char(1) not null,
    height varchar2(10) not null,
    weight varchar2(10) not null,
    body varchar2(10) not null,
    symptom varchar2(10) not null,
    constraint pk_servey_no primary key(no),
    constraint fk_servey_member_id foreign key(member_id) references member(member_id) on delete cascade,
    constraint ck_servey_gender check(gender in ('M', 'F'))
);

-- 권한
create table authority(
    auth varchar2(50),
    member_id varchar2(50),
    constraint pk_authority_auth_member_id primary key(auth, member_id),
    constraint fk_authority_member_id foreign key(member_id) references member(member_id)
);

-- 1:1 문의
create table question(
    no number,
    comment_ref number,
    writer varchar2(50) not null,
    answered char(1) default 'N',
    reg_date date default sysdate,
    content varchar2(3000) not null,
    title varchar2(1000) not null,
    comment_level number default 1,
    category varchar2(50),
    constraint pk_question_no primary key(no),
    constraint fk_question_comment_ref foreign key(comment_ref) references question(no) on delete cascade,
    constraint fk_question_writer foreign key(writer) references member(member_id) on delete cascade
);

-- 섭취 체크
create table intake_check(
    no number,
    member_id varchar2(50),
    pcode number,
    intake_day varchar2(10), -- 섭취 요일 월요일 - 일요일
    alarm_time number, -- 알림 시간 20, 16
    intake_yn char(1) default 'N',
    created_at date default sysdate,
    deleted_at date,
    constraint pk_intake_check_no primary key(no),
    constraint fk_intake_check_member_id foreign key(member_id) references member(member_id) on delete cascade,
    constraint fk_intake_check_pcode foreign key(pcode) references product(pcode) on delete cascade,
    constraint ck_intake_check_intake_yn check(intake_yn in ('Y', 'N'))
);

-- 리뷰
create table review (
    no number,
    member_id varchar2(50),
    pcode number,
    content varchar2(4000) not null,
    star varchar2(10) not null,
    reg_date date default sysdate,
    constraint pk_review_no primary key(no),
    constraint fk_review_member_id foreign key(member_id) references member(member_id) on delete cascade,
    constraint fk_review_pcode foreign key(pcode) references product(pcode) on delete cascade,
    constraint uq_review_member_id_pcode unique(member_id, pcode)
);

-- 리뷰 첨부
create table review_attachment(
    attach_no number,
    review_no number,
    original_filename varchar2(256) not null,
    renamed_filename varchar2(256) not null,
    created_at date default sysdate,
    constraint pk_review_attachment_no primary key (attach_no),
    constraint fk_review_attachment_review_no foreign key(review_no) references review(no) on delete cascade
);

-- 찜
create table picked(
    member_id varchar2(50),
    pcode number,
    constraint pk_picked_member_id_pcode primary key(member_id, pcode),
    constraint fk_picked_member_id foreign key(member_id) references member(member_id) on delete cascade,
    constraint fk_picked_pcode foreign key(pcode) references product(pcode) on delete cascade
);

-- 장바구니
create table cart(
    cart_no number,
    member_id varchar2(50),
    pcode number,
    amount number not null,
    constraint pk_cart_no primary key(cart_no),
    constraint fk_cart_member_id foreign key(member_id) references member(member_id) on delete cascade,
    constraint fk_cart_pcode foreign key(pcode) references product(pcode) on delete cascade
);

-- 정기구독
create table subscription(
    sub_no number,
    member_id varchar2(50),
    start_date date default sysdate,
    end_date date,
    send_date date,
    pay varchar2(10) not null,
    total_price number not null,
    product_price number not null,
    delivery_price number,
    discount number,
    constraint pk_subscription_sub_no primary key(sub_no),
    constraint fk_subscription_member_id foreign key(member_id) references member(member_id) on delete cascade
);

-- 구독-상품
create table subscription_product(
    sub_no number,
    pcode number,
    amount number,
    constraint pk_sub_no_pcode primary key(sub_no, pcode),
    constraint fk_subscription_product_pcode foreign key(pcode) references product(pcode) on delete cascade
);

-- FAQ
create table faq(
    no number,
    question varchar2(500) not null,
    answer varchar2(1000) not null,
    constraint pk_faq_no primary key(no)
);

-- 공지사항
create table notice(
    no number,
    writer varchar2(50),
    title varchar2(50),
    content varchar2(3000),
    reg_date date default sysdate,
    constraint pk_notice_no primary key(no)
);

-- 날짜별 가입자 수
create table user_by_date(
    no number,
    by_date date default sysdate,
    by_user number default 0,
    constraint pk_user_by_date_no primary key(no)
);

-- 날짜별 방문자 수
create table visit(
    v_date date
);

-- 날짜별 판매량
create table sales_by_date(
    no number,
    by_date date default sysdate,
    by_sales number default 0,
    constraint pk_sales_by_date_no primary key(no)
);

-- 주문 / 결제
create table orders(
    merchant_uid number,
    member_id varchar2(50),
    imp_uid varchar2(50) not null,
    receiptId varchar2(100) not null,
    method varchar2(10) not null,
    name varchar2(50),
    status varchar2(10),
    created_at date default sysdate,
    paid_at date,
    failed_at date,
    cancelled_amount number,
    cancelled_at date,
    product_price number not null,
    total_price number not null,
    delivery_price number,
    return_status varchar2(10),
    return_reason varchar2(50),
    return_request_date date,
    return_complete_date date,
    cancel_status varchar2(10),
    cancel_reason varchar2(50),
    cancel_request_date date,
    cancel_complete_date date,
    refund_status varchar2(10),
    refund_method varchar2(50),
    total_refund_price number,
    refund_request_date date,
    refund_complete_date date,
    recipient varchar2(10),
    post_code varchar2(10),
    address  varchar2(512),
    detail_address  varchar2(512),
    memo varchar2(100),
    constraint pk_orders_merchant_uid primary key(merchant_uid),
    constraint fk_orders_member_id foreign key(member_id) references member(member_id)
);

--상품 - 주문
create table product_orders(
    pcode number,
    merchant_uid number,
    constraint pk_product_orders_pcode_merchant_uid primary key(pcode, merchant_uid),
    constraint fk_product_orders_pcode foreign key(pcode) references product(pcode) on delete cascade,
    constraint fk_product_orders_merchant_uid foreign key(merchant_uid) references orders(merchant_uid) on delete cascade
);

-- 선물함
create table gift(
    no number,
    merchant_uid number,
    sender varchar2(50),
    receiver varchar2(50),
    send_date date default sysdate,
    message varchar2(200),
    constraint pk_gift_no primary key(no),
    constraint fk_gift_sender foreign key(sender) references member(member_id) on delete cascade,
    constraint fk_gift_receiver foreign key(receiver) references member(member_id) on delete cascade,
    constraint fk_gift_merchant_uid foreign key(merchant_uid) references orders(merchant_uid) on delete cascade
);

-- QNA
create table qna(
    qna_id number,
    comment_ref number,
    pcode number,
    writer varchar2(50),
    answered char(1) default 'N',
    reg_date date default sysdate,
    content varchar2(1000) not null,
    secret_password number,
    comment_level number default 1,
    constraint pk_qna_id primary key(qna_id),
    constraint fk_qna_comment_ref foreign key(comment_ref) references qna(qna_id) on delete cascade,
    constraint fk_qna_pcode foreign key(pcode) references product(pcode) on delete cascade,
    constraint fk_qna_writer foreign key(writer) references member(member_id) on delete cascade
    
);

-- 시퀀스들
create sequence seq_faq_no;
create sequence seq_notice_no;
create sequence seq_chat_log_no;
create sequence seq_servey_no;
create sequence seq_question_no;
create sequence seq_intake_check_no;
create sequence seq_gift_no;
create sequence seq_sub_no;
create sequence seq_review_attach_no;
create sequence seq_review_no;
create sequence seq_qna_id;
create sequence seq_cart_no;
create sequence seq_user_by_date_no;
create sequence seq_visitor_by_date_no;
create sequence seq_sales_by_date_no;
create sequence seq_io_no;
create sequence seq_product_attach_no;
create sequence seq_product_no;

-- 상품 샘플 데이터
insert into
    product(pcode, pname, manu, price, amount)
values(seq_product_no.nextval, '상큼 비타민', '어디제약', '1000', '10');

insert into
    product(pcode, pname, manu, price, amount)
values(seq_product_no.nextval, '잘보여 루테인', '여기제약', '2000', '15');

insert into
    product(pcode, pname, manu, price, amount)
values(seq_product_no.nextval, '든든 철분', 'KH제약', '1500', '10');

select * from product;

--태연 코드--
-- 공지사항 샘플 데이터
insert into notice(no, writer, title, content, reg_date) values(seq_notice_no.nextval, 'admin', '공지사항 입니다', '배송관련입니다', default); 
insert into notice(no, writer, title, content, reg_date) values(seq_notice_no.nextval, 'admin', '공지사항 입니다2', '배송관련입니다2', default); 
insert into notice(no, writer, title, content, reg_date) values(seq_notice_no.nextval, 'admin', '공지사항 입니다3', '배송관련입니다3', default); 
insert into notice(no, writer, title, content, reg_date) values(seq_notice_no.nextval, 'admin', '공지사항 입니다4', '배송관련입니다4', default); 

--태연 코드 끝--

-- 주희 코드 --
-- 카테고리 샘플 데이터
select * from product;
select * from category;

--insert into category
-- values(350001, 1, '대분류', '성분', 0);
-- values(350002, 1, '대분류', '성별', 0);
-- values(350003, 1, '대분류', '신체', 0);
-- values(350004, 1, '대분류', '정기구독', 0);
-- values(350005, 2, '소분류', '비타민', 350001);
-- values(350006, 2, '소분류', '철분', 350001);
-- values(350007, 2, '소분류', '오메가3', 350001);
-- values(350008, 2, '소분류', '칼슘', 350001);
-- values(350009, 2, '소분류', '콜라겐', 350001);
-- values(350010, 2, '소분류', '여성', 350002);
-- values(350011, 2, '소분류', '남성', 350002);
-- values(350012, 2, '소분류', '눈', 350003);
-- values(350013, 2, '소분류', '소화기관', 350003);
-- values(350014, 2, '소분류', '피로감', 350003);
-- values(350015, 2, '소분류', '면역', 350003);
-- values(350016, 2, '소분류', '심혈관계', 350003);
-- values(350017, 2, '소분류', '정기구독', 350004);

select * from member;
select * from authority;
select * from product where pcode = 45 order by pcode;
select * from product p
    left join product_attachment a
        on p.pcode = a.pcode;
select * from product_attachment;
select
			p.*,
			a.*
		from
			product p
				left join product_attachment a
					on p.pcode = a.pcode
		where
			p.pcode = 45;

-- product 테이블에 상품 등록일, 최종 수정일 컬럼 추가
alter table product add (
    discount number default 0
);

--  product 테이블 sale_status 컬럼 제약조건 변경
alter table product add constraint ck_product_sale_status check(sale_status in ('Y', 'N', 'S'));

alter table product modify(sale_status varchar2(7));
select to_date('2022/09/08', 'yyyy/mm/dd') from dual;
select * from product where created_at between to_date('2022/09/01', 'yyyy/mm/dd') and to_date('2022/09/08', 'yyyy/mm/dd');
select * from product where pname like '%' || '비타' || '%' ;