
DROP SEQUENCE cart_seq;



CREATE SEQUENCE cart_seq;



DROP SEQUENCE craftInf_seq;



CREATE SEQUENCE craftInf_seq;



DROP SEQUENCE flightInf_seq;



CREATE SEQUENCE flightInf_seq;



DROP SEQUENCE info_service_seq;



CREATE SEQUENCE info_service_seq;



DROP SEQUENCE m_save_seq;



CREATE SEQUENCE m_save_seq;



DROP SEQUENCE m_use_seq;



CREATE SEQUENCE m_use_seq;



DROP SEQUENCE meal_seq;



CREATE SEQUENCE meal_seq;



DROP SEQUENCE order_detail_seq;



CREATE SEQUENCE order_detail_seq;



DROP SEQUENCE order_seq;



CREATE SEQUENCE order_seq;



DROP SEQUENCE product_seq;



CREATE SEQUENCE product_seq;



DROP SEQUENCE reservation_seq;



CREATE SEQUENCE reservation_seq;



DROP SEQUENCE seat_seq;



CREATE SEQUENCE seat_seq;



DROP TABLE m_useDetail CASCADE CONSTRAINTS PURGE;



DROP TABLE m_save CASCADE CONSTRAINTS PURGE;



DROP TABLE m_use CASCADE CONSTRAINTS PURGE;



DROP TABLE info_service CASCADE CONSTRAINTS PURGE;



DROP TABLE cart CASCADE CONSTRAINTS PURGE;



DROP TABLE order_detail CASCADE CONSTRAINTS PURGE;



DROP TABLE orderTable CASCADE CONSTRAINTS PURGE;



DROP TABLE product CASCADE CONSTRAINTS PURGE;



DROP TABLE rMeal CASCADE CONSTRAINTS PURGE;



DROP TABLE meal CASCADE CONSTRAINTS PURGE;



DROP TABLE seat CASCADE CONSTRAINTS PURGE;



DROP TABLE reservation CASCADE CONSTRAINTS PURGE;



DROP TABLE member CASCADE CONSTRAINTS PURGE;



DROP TABLE grade CASCADE CONSTRAINTS PURGE;



DROP TABLE flightInf CASCADE CONSTRAINTS PURGE;



DROP TABLE startcon CASCADE CONSTRAINTS PURGE;



DROP TABLE endcon CASCADE CONSTRAINTS PURGE;



DROP TABLE craftInf CASCADE CONSTRAINTS PURGE;



CREATE TABLE cart
(
	cartNo                NUMBER  NOT NULL ,
	productNo             NUMBER  NULL ,
	quantity              NUMBER   DEFAULT  1 NOT NULL ,
	id                    VARCHAR2(20)  NULL 
);



CREATE UNIQUE INDEX XPK장바구니 ON cart
(cartNo  ASC);



ALTER TABLE cart
	ADD CONSTRAINT  XPK장바구니 PRIMARY KEY (cartNo);



CREATE TABLE craftInf
(
	cno                   number  NOT NULL ,
	cname                 VARCHAR2(20)  NOT NULL ,
	cimg                  VARCHAR2(50)  NOT NULL ,
	cchairimg             VARCHAR2(50)  NOT NULL ,
	cdistance             NUMBER(10)  NOT NULL ,
	cspeed                NUMBER(10)  NOT NULL ,
	cchairrown            NUMBER(10)  NOT NULL ,
	cdiv                  NUMBER  NOT NULL ,
	cchairn               NUMBER(10)  NOT NULL ,
	cchairlinen           VARCHAR2(20)  NULL 
);



CREATE UNIQUE INDEX XPK항공기정보 ON craftInf
(cno  ASC);



ALTER TABLE craftInf
	ADD CONSTRAINT  XPK항공기정보 PRIMARY KEY (cno);



CREATE TABLE endcon
(
	endstation            VARCHAR2(30)  NOT NULL ,
	endcon                VARCHAR2(30)  NOT NULL ,
	endstationNo          NUMBER  NOT NULL 
);



CREATE UNIQUE INDEX XPK도착국가 ON endcon
(endstation  ASC);



ALTER TABLE endcon
	ADD CONSTRAINT  XPK도착국가 PRIMARY KEY (endstation);



CREATE TABLE flightInf
(
	flightno              NUMBER  NOT NULL ,
	startdate             VARCHAR2(30)  NOT NULL ,
	enddate               VARCHAR2(30)  NOT NULL ,
	price                 NUMBER(30)  NOT NULL ,
	cno                   NUMBER  NULL ,
	endstation            VARCHAR2(30)  NULL ,
	startstation          VARCHAR2(30)  NULL 
);



CREATE UNIQUE INDEX XPK항공편정보 ON flightInf
(flightno  ASC);



ALTER TABLE flightInf
	ADD CONSTRAINT  XPK항공편정보 PRIMARY KEY (flightno);



CREATE TABLE grade
(
	gradeNo               NUMBER(2)  NOT NULL ,
	gradeName             VARCHAR2(30)  NOT NULL 
);



CREATE UNIQUE INDEX XPK등급 ON grade
(gradeNo  ASC);



ALTER TABLE grade
	ADD CONSTRAINT  XPK등급 PRIMARY KEY (gradeNo);



CREATE TABLE info_service
(
	no                    NUMBER(30)  NOT NULL ,
	title                 VARCHAR2(300)  NOT NULL ,
	content               VARCHAR2(2000)  NOT NULL ,
	updateDate            DATE   DEFAULT  sysdate NULL ,
	id                    VARCHAR2(20)  NULL ,
	fileName              VARCHAR2(100)  NULL 
);



CREATE UNIQUE INDEX XPK서비스정보 ON info_service
(no  ASC);



ALTER TABLE info_service
	ADD CONSTRAINT  XPK서비스정보 PRIMARY KEY (no);



CREATE TABLE m_save
(
	save                  NUMBER  NOT NULL ,
	id                    VARCHAR2(20)  NOT NULL ,
	emoney                NUMBER(8)  NOT NULL ,
	balance               NUMBER(8)  NOT NULL ,
	memo                  VARCHAR2(20)  NOT NULL ,
	regdt                 DATE   DEFAULT  sysdate
 NULL ,
	orderNo               NUMBER  NULL ,
	revNo                 NUMBER  NULL 
);



CREATE UNIQUE INDEX XPK마일리지_적립 ON m_save
(save  ASC);



ALTER TABLE m_save
	ADD CONSTRAINT  XPK마일리지_적립 PRIMARY KEY (save);



CREATE TABLE m_use
(
	use                   NUMBER  NOT NULL ,
	orderNo               NUMBER  NULL ,
	revNo                 NUMBER  NULL ,
	memo                  VARCHAR2(30)  NULL ,
	id                    VARCHAR2(20)  NOT NULL ,
	umoney                NUMBER  NOT NULL ,
	regdt                 DATE   DEFAULT  sysdate
 NULL 
);



CREATE UNIQUE INDEX XPK마일리지_차감 ON m_use
(use  ASC);



ALTER TABLE m_use
	ADD CONSTRAINT  XPK마일리지_차감 PRIMARY KEY (use);



CREATE TABLE m_useDetail
(
	emoney                NUMBER(8)  NOT NULL ,
	use                   NUMBER  NOT NULL ,
	save                  NUMBER  NOT NULL 
);



CREATE UNIQUE INDEX XPK마일리지_차감상세 ON m_useDetail
(use  ASC,save  ASC);



ALTER TABLE m_useDetail
	ADD CONSTRAINT  XPK마일리지_차감상세 PRIMARY KEY (use,save);



CREATE TABLE meal
(
	mealNo                NUMBER(38)  NOT NULL ,
	mealName              VARCHAR2(200)  NOT NULL ,
	mealImg               VARCHAR2(30)  NULL 
);



CREATE UNIQUE INDEX XPK기내식 ON meal
(mealNo  ASC);



ALTER TABLE meal
	ADD CONSTRAINT  XPK기내식 PRIMARY KEY (mealNo);



CREATE TABLE member
(
	id                    VARCHAR2(20)  NOT NULL ,
	pw                    VARCHAR2(20)  NOT NULL ,
	name                  VARCHAR2(15)  NOT NULL ,
	e_name                VARCHAR2(30)  NOT NULL ,
	gender                VARCHAR2(6)  NOT NULL  CONSTRAINT  gender CHECK (gender in('남자','여자')),
	birth                 DATE  NOT NULL ,
	tel                   VARCHAR2(13)  NOT NULL ,
	email                 VARCHAR2(50)  NOT NULL ,
	country               VARCHAR2(20)  NOT NULL ,
	p_nationality         VARCHAR2(20)  NOT NULL ,
	p_country             VARCHAR2(20)  NOT NULL ,
	p_no                  VARCHAR2(10)  NOT NULL ,
	p_date                DATE  NOT NULL ,
	regDate               DATE   DEFAULT  sysdate
 NULL ,
	conDate               DATE   DEFAULT  sysdate
 NULL ,
	status                VARCHAR2(6)   DEFAULT  '정상' NULL  CONSTRAINT  status CHECK (status in('정상','강퇴','탈퇴','휴면')),
	gradeNo               NUMBER(2)   DEFAULT  1 NULL ,
	mileage               NUMBER   DEFAULT  0 NULL 
);



CREATE UNIQUE INDEX XPK회원관리 ON member
(id  ASC);



ALTER TABLE member
	ADD CONSTRAINT  XPK회원관리 PRIMARY KEY (id);



CREATE TABLE order_detail
(
	order_detailNo        NUMBER  NOT NULL ,
	productNo             NUMBER  NULL ,
	quantity              NUMBER  NOT NULL ,
	orderStatus           VARCHAR2(50)  NOT NULL  CONSTRAINT  status2 CHECK (orderStatus in ('픽업준비중','픽업완료','취소','환불')),
	orderNo               NUMBER  NULL 
);



CREATE UNIQUE INDEX XPK주문관리상세 ON order_detail
(order_detailNo  ASC);



ALTER TABLE order_detail
	ADD CONSTRAINT  XPK주문관리상세 PRIMARY KEY (order_detailNo);



CREATE TABLE orderTable
(
	orderNo               NUMBER  NOT NULL ,
	orderName             VARCHAR2(300)  NOT NULL ,
	revNo                 NUMBER  NOT NULL ,
	orderDate             DATE   DEFAULT  sysdate NOT NULL ,
	id                    VARCHAR2(20)  NOT NULL ,
	pay                   VARCHAR2(300)  NULL  CONSTRAINT  pay CHECK (pay in('카드결제','무통장입금','마일리지')),
	totalPrice            NUMBER  NULL ,
	use                   NUMBER  NULL 
);



CREATE UNIQUE INDEX XPK주문관리 ON orderTable
(orderNo  ASC);



ALTER TABLE orderTable
	ADD CONSTRAINT  XPK주문관리 PRIMARY KEY (orderNo);



CREATE TABLE product
(
	productNo             NUMBER  NOT NULL ,
	name                  VARCHAR2(300)  NOT NULL ,
	description           VARCHAR2(2000)  NOT NULL ,
	price                 NUMBER  NOT NULL ,
	writeDate             DATE   DEFAULT  sysdate NULL ,
	stock                 NUMBER  NULL ,
	img                   VARCHAR2(300)  NOT NULL 
);



CREATE UNIQUE INDEX XPK상품 ON product
(productNo  ASC);



ALTER TABLE product
	ADD CONSTRAINT  XPK상품 PRIMARY KEY (productNo);



CREATE TABLE reservation
(
	id                    VARCHAR2(20)  NOT NULL ,
	peopleNo              NUMBER(38)   DEFAULT  1 NOT NULL ,
	flightno              NUMBER  NULL ,
	total                 NUMBER  NULL ,
	revNo                 NUMBER  NOT NULL ,
	use                   NUMBER  NULL 
);



CREATE UNIQUE INDEX XPK예약시스템 ON reservation
(revNo  ASC);



ALTER TABLE reservation
	ADD CONSTRAINT  XPK예약시스템 PRIMARY KEY (revNo);



CREATE TABLE rMeal
(
	revMealNo             VARCHAR2(100)  NOT NULL ,
	mealNo                NUMBER(38)  NOT NULL ,
	revNo                 NUMBER  NULL 
);



CREATE UNIQUE INDEX XPK기내식예약 ON rMeal
(revMealNo  ASC);



ALTER TABLE rMeal
	ADD CONSTRAINT  XPK기내식예약 PRIMARY KEY (revMealNo);



CREATE TABLE seat
(
	seatno                NUMBER  NOT NULL ,
	flightno              NUMBER  NOT NULL ,
	seatInf               VARCHAR2(100)  NOT NULL ,
	revNo                 NUMBER  NOT NULL 
);



CREATE UNIQUE INDEX XPK좌석예약 ON seat
(seatInf  ASC,revNo  ASC);



ALTER TABLE seat
	ADD CONSTRAINT  XPK좌석예약 PRIMARY KEY (seatInf,revNo);



CREATE TABLE startcon
(
	startstation          VARCHAR2(30)  NOT NULL ,
	startcon              VARCHAR2(30)  NOT NULL ,
	startstationNo        NUMBER  NOT NULL 
);



CREATE UNIQUE INDEX XPK출발국가 ON startcon
(startstation  ASC);



ALTER TABLE startcon
	ADD CONSTRAINT  XPK출발국가 PRIMARY KEY (startstation);



ALTER TABLE cart
	ADD (CONSTRAINT  R_2 FOREIGN KEY (productNo) REFERENCES product(productNo) ON DELETE SET NULL);



ALTER TABLE cart
	ADD (CONSTRAINT  R_28 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE flightInf
	ADD (CONSTRAINT  R_24 FOREIGN KEY (cno) REFERENCES craftInf(cno) ON DELETE SET NULL);



ALTER TABLE flightInf
	ADD (CONSTRAINT  R_26 FOREIGN KEY (endstation) REFERENCES endcon(endstation) ON DELETE SET NULL);



ALTER TABLE flightInf
	ADD (CONSTRAINT  R_27 FOREIGN KEY (startstation) REFERENCES startcon(startstation) ON DELETE SET NULL);



ALTER TABLE info_service
	ADD (CONSTRAINT  R_23 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE m_save
	ADD (CONSTRAINT  R_3 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE m_save
	ADD (CONSTRAINT  R_35 FOREIGN KEY (orderNo) REFERENCES orderTable(orderNo) ON DELETE SET NULL);



ALTER TABLE m_save
	ADD (CONSTRAINT  R_36 FOREIGN KEY (revNo) REFERENCES reservation(revNo) ON DELETE SET NULL);



ALTER TABLE m_use
	ADD (CONSTRAINT  R_29 FOREIGN KEY (orderNo) REFERENCES orderTable(orderNo) ON DELETE SET NULL);



ALTER TABLE m_use
	ADD (CONSTRAINT  R_31 FOREIGN KEY (revNo) REFERENCES reservation(revNo) ON DELETE SET NULL);



ALTER TABLE m_use
	ADD (CONSTRAINT  R_37 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE m_useDetail
	ADD (CONSTRAINT  R_50 FOREIGN KEY (use) REFERENCES m_use(use));



ALTER TABLE m_useDetail
	ADD (CONSTRAINT  R_1 FOREIGN KEY (save) REFERENCES m_save(save));



ALTER TABLE member
	ADD (CONSTRAINT  R_51 FOREIGN KEY (gradeNo) REFERENCES grade(gradeNo) ON DELETE SET NULL);



ALTER TABLE order_detail
	ADD (CONSTRAINT  R_11 FOREIGN KEY (productNo) REFERENCES product(productNo) ON DELETE SET NULL);



ALTER TABLE order_detail
	ADD (CONSTRAINT  R_12 FOREIGN KEY (orderNo) REFERENCES orderTable(orderNo) ON DELETE SET NULL);



ALTER TABLE orderTable
	ADD (CONSTRAINT  R_17 FOREIGN KEY (id) REFERENCES member(id) ON DELETE SET NULL);



ALTER TABLE orderTable
	ADD (CONSTRAINT  R_39 FOREIGN KEY (revNo) REFERENCES reservation(revNo) ON DELETE SET NULL);



ALTER TABLE reservation
	ADD (CONSTRAINT  R_19 FOREIGN KEY (id) REFERENCES member(id) ON DELETE CASCADE);



ALTER TABLE reservation
	ADD (CONSTRAINT  R_22 FOREIGN KEY (flightno) REFERENCES flightInf(flightno) ON DELETE CASCADE);



ALTER TABLE rMeal
	ADD (CONSTRAINT  R_32 FOREIGN KEY (mealNo) REFERENCES meal(mealNo) ON DELETE SET NULL);



ALTER TABLE rMeal
	ADD (CONSTRAINT  R_33 FOREIGN KEY (revNo) REFERENCES reservation(revNo) ON DELETE CASCADE);



ALTER TABLE seat
	ADD (CONSTRAINT  R_30 FOREIGN KEY (flightno) REFERENCES flightInf(flightno));



ALTER TABLE seat
	ADD (CONSTRAINT  R_38 FOREIGN KEY (revNo) REFERENCES reservation(revNo));



CREATE  TRIGGER tI_cart BEFORE INSERT ON cart for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- INSERT trigger on cart 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* product  cart on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0001c826", PARENT_OWNER="", PARENT_TABLE="product"
    CHILD_OWNER="", CHILD_TABLE="cart"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="productNo" */
    UPDATE cart
      SET
        /* %SetFK(cart,NULL) */
        cart.productNo = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM product
            WHERE
              /* %JoinFKPK(:%New,product," = "," AND") */
              :new.productNo = product.productNo
        ) 
        /* %JoinPKPK(cart,:%New," = "," AND") */
         and cart.cartNo = :new.cartNo;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* member  cart on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="cart"
    P2C_VERB_PHRASE="R/28", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="id" */
    UPDATE cart
      SET
        /* %SetFK(cart,NULL) */
        cart.id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM member
            WHERE
              /* %JoinFKPK(:%New,member," = "," AND") */
              :new.id = member.id
        ) 
        /* %JoinPKPK(cart,:%New," = "," AND") */
         and cart.cartNo = :new.cartNo;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_cart AFTER UPDATE ON cart for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on cart 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* product  cart on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00020cf1", PARENT_OWNER="", PARENT_TABLE="product"
    CHILD_OWNER="", CHILD_TABLE="cart"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="productNo" */
  SELECT count(*) INTO NUMROWS
    FROM product
    WHERE
      /* %JoinFKPK(:%New,product," = "," AND") */
      :new.productNo = product.productNo;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.productNo IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update cart because product does not exist.'
    );
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* member  cart on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="cart"
    P2C_VERB_PHRASE="R/28", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="id" */
  SELECT count(*) INTO NUMROWS
    FROM member
    WHERE
      /* %JoinFKPK(:%New,member," = "," AND") */
      :new.id = member.id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.id IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update cart because member does not exist.'
    );
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tD_craftInf AFTER DELETE ON craftInf for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- DELETE trigger on craftInf 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* craftInf  flightInf on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000b40c", PARENT_OWNER="", PARENT_TABLE="craftInf"
    CHILD_OWNER="", CHILD_TABLE="flightInf"
    P2C_VERB_PHRASE="R/24", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="cno" */
    UPDATE flightInf
      SET
        /* %SetFK(flightInf,NULL) */
        flightInf.cno = NULL
      WHERE
        /* %JoinFKPK(flightInf,:%Old," = "," AND") */
        flightInf.cno = :old.cno;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_craftInf AFTER UPDATE ON craftInf for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on craftInf 
DECLARE NUMROWS INTEGER;
BEGIN
  /* craftInf  flightInf on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0000dc30", PARENT_OWNER="", PARENT_TABLE="craftInf"
    CHILD_OWNER="", CHILD_TABLE="flightInf"
    P2C_VERB_PHRASE="R/24", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="cno" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.cno <> :new.cno
  THEN
    UPDATE flightInf
      SET
        /* %SetFK(flightInf,NULL) */
        flightInf.cno = NULL
      WHERE
        /* %JoinFKPK(flightInf,:%Old," = ",",") */
        flightInf.cno = :old.cno;
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tD_endcon AFTER DELETE ON endcon for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- DELETE trigger on endcon 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* endcon  flightInf on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000c515", PARENT_OWNER="", PARENT_TABLE="endcon"
    CHILD_OWNER="", CHILD_TABLE="flightInf"
    P2C_VERB_PHRASE="R/26", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="endstation" */
    UPDATE flightInf
      SET
        /* %SetFK(flightInf,NULL) */
        flightInf.endstation = NULL
      WHERE
        /* %JoinFKPK(flightInf,:%Old," = "," AND") */
        flightInf.endstation = :old.endstation;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_endcon AFTER UPDATE ON endcon for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on endcon 
DECLARE NUMROWS INTEGER;
BEGIN
  /* endcon  flightInf on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0000e68b", PARENT_OWNER="", PARENT_TABLE="endcon"
    CHILD_OWNER="", CHILD_TABLE="flightInf"
    P2C_VERB_PHRASE="R/26", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="endstation" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.endstation <> :new.endstation
  THEN
    UPDATE flightInf
      SET
        /* %SetFK(flightInf,NULL) */
        flightInf.endstation = NULL
      WHERE
        /* %JoinFKPK(flightInf,:%Old," = ",",") */
        flightInf.endstation = :old.endstation;
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tI_flightInf BEFORE INSERT ON flightInf for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- INSERT trigger on flightInf 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* craftInf  flightInf on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00030d12", PARENT_OWNER="", PARENT_TABLE="craftInf"
    CHILD_OWNER="", CHILD_TABLE="flightInf"
    P2C_VERB_PHRASE="R/24", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="cno" */
    UPDATE flightInf
      SET
        /* %SetFK(flightInf,NULL) */
        flightInf.cno = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM craftInf
            WHERE
              /* %JoinFKPK(:%New,craftInf," = "," AND") */
              :new.cno = craftInf.cno
        ) 
        /* %JoinPKPK(flightInf,:%New," = "," AND") */
         and flightInf.flightno = :new.flightno;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* endcon  flightInf on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="endcon"
    CHILD_OWNER="", CHILD_TABLE="flightInf"
    P2C_VERB_PHRASE="R/26", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="endstation" */
    UPDATE flightInf
      SET
        /* %SetFK(flightInf,NULL) */
        flightInf.endstation = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM endcon
            WHERE
              /* %JoinFKPK(:%New,endcon," = "," AND") */
              :new.endstation = endcon.endstation
        ) 
        /* %JoinPKPK(flightInf,:%New," = "," AND") */
         and flightInf.flightno = :new.flightno;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* startcon  flightInf on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="startcon"
    CHILD_OWNER="", CHILD_TABLE="flightInf"
    P2C_VERB_PHRASE="R/27", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="startstation" */
    UPDATE flightInf
      SET
        /* %SetFK(flightInf,NULL) */
        flightInf.startstation = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM startcon
            WHERE
              /* %JoinFKPK(:%New,startcon," = "," AND") */
              :new.startstation = startcon.startstation
        ) 
        /* %JoinPKPK(flightInf,:%New," = "," AND") */
         and flightInf.flightno = :new.flightno;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tD_flightInf AFTER DELETE ON flightInf for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- DELETE trigger on flightInf 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* flightInf  reservation on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0001ad83", PARENT_OWNER="", PARENT_TABLE="flightInf"
    CHILD_OWNER="", CHILD_TABLE="reservation"
    P2C_VERB_PHRASE="R/22", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="flightno" */
    DELETE FROM reservation
      WHERE
        /*  %JoinFKPK(reservation,:%Old," = "," AND") */
        reservation.flightno = :old.flightno;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* flightInf  seat on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="flightInf"
    CHILD_OWNER="", CHILD_TABLE="seat"
    P2C_VERB_PHRASE="R/30", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="flightno" */
    SELECT count(*) INTO NUMROWS
      FROM seat
      WHERE
        /*  %JoinFKPK(seat,:%Old," = "," AND") */
        seat.flightno = :old.flightno;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete flightInf because seat exists.'
      );
    END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_flightInf AFTER UPDATE ON flightInf for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on flightInf 
DECLARE NUMROWS INTEGER;
BEGIN
  /* flightInf  reservation on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0005564a", PARENT_OWNER="", PARENT_TABLE="flightInf"
    CHILD_OWNER="", CHILD_TABLE="reservation"
    P2C_VERB_PHRASE="R/22", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="flightno" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.flightno <> :new.flightno
  THEN
    UPDATE reservation
      SET
        /* %SetFK(reservation,NULL) */
        reservation.flightno = NULL
      WHERE
        /* %JoinFKPK(reservation,:%Old," = ",",") */
        reservation.flightno = :old.flightno;
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* flightInf  seat on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="flightInf"
    CHILD_OWNER="", CHILD_TABLE="seat"
    P2C_VERB_PHRASE="R/30", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="flightno" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.flightno <> :new.flightno
  THEN
    SELECT count(*) INTO NUMROWS
      FROM seat
      WHERE
        /*  %JoinFKPK(seat,:%Old," = "," AND") */
        seat.flightno = :old.flightno;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update flightInf because seat exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* craftInf  flightInf on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="craftInf"
    CHILD_OWNER="", CHILD_TABLE="flightInf"
    P2C_VERB_PHRASE="R/24", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="cno" */
  SELECT count(*) INTO NUMROWS
    FROM craftInf
    WHERE
      /* %JoinFKPK(:%New,craftInf," = "," AND") */
      :new.cno = craftInf.cno;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.cno IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update flightInf because craftInf does not exist.'
    );
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* endcon  flightInf on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="endcon"
    CHILD_OWNER="", CHILD_TABLE="flightInf"
    P2C_VERB_PHRASE="R/26", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="endstation" */
  SELECT count(*) INTO NUMROWS
    FROM endcon
    WHERE
      /* %JoinFKPK(:%New,endcon," = "," AND") */
      :new.endstation = endcon.endstation;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.endstation IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update flightInf because endcon does not exist.'
    );
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* startcon  flightInf on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="startcon"
    CHILD_OWNER="", CHILD_TABLE="flightInf"
    P2C_VERB_PHRASE="R/27", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="startstation" */
  SELECT count(*) INTO NUMROWS
    FROM startcon
    WHERE
      /* %JoinFKPK(:%New,startcon," = "," AND") */
      :new.startstation = startcon.startstation;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.startstation IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update flightInf because startcon does not exist.'
    );
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tD_grade AFTER DELETE ON grade for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- DELETE trigger on grade 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* grade  member on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000b41f", PARENT_OWNER="", PARENT_TABLE="grade"
    CHILD_OWNER="", CHILD_TABLE="member"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="gradeNo" */
    UPDATE member
      SET
        /* %SetFK(member,NULL) */
        member.gradeNo = NULL
      WHERE
        /* %JoinFKPK(member,:%Old," = "," AND") */
        member.gradeNo = :old.gradeNo;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_grade AFTER UPDATE ON grade for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on grade 
DECLARE NUMROWS INTEGER;
BEGIN
  /* grade  member on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0000d80e", PARENT_OWNER="", PARENT_TABLE="grade"
    CHILD_OWNER="", CHILD_TABLE="member"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="gradeNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.gradeNo <> :new.gradeNo
  THEN
    UPDATE member
      SET
        /* %SetFK(member,NULL) */
        member.gradeNo = NULL
      WHERE
        /* %JoinFKPK(member,:%Old," = ",",") */
        member.gradeNo = :old.gradeNo;
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tI_info_service BEFORE INSERT ON info_service for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- INSERT trigger on info_service 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* member  info_service on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000e87d", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="info_service"
    P2C_VERB_PHRASE="R/23", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="id" */
    UPDATE info_service
      SET
        /* %SetFK(info_service,NULL) */
        info_service.id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM member
            WHERE
              /* %JoinFKPK(:%New,member," = "," AND") */
              :new.id = member.id
        ) 
        /* %JoinPKPK(info_service,:%New," = "," AND") */
         and info_service.no = :new.no;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_info_service AFTER UPDATE ON info_service for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on info_service 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* member  info_service on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0000f907", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="info_service"
    P2C_VERB_PHRASE="R/23", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="id" */
  SELECT count(*) INTO NUMROWS
    FROM member
    WHERE
      /* %JoinFKPK(:%New,member," = "," AND") */
      :new.id = member.id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.id IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update info_service because member does not exist.'
    );
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tI_m_save BEFORE INSERT ON m_save for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- INSERT trigger on m_save 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* member  m_save on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0002d772", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="m_save"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="id" */
    UPDATE m_save
      SET
        /* %SetFK(m_save,NULL) */
        m_save.id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM member
            WHERE
              /* %JoinFKPK(:%New,member," = "," AND") */
              :new.id = member.id
        ) 
        /* %JoinPKPK(m_save,:%New," = "," AND") */
         and m_save.save = :new.save;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* orderTable  m_save on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="orderTable"
    CHILD_OWNER="", CHILD_TABLE="m_save"
    P2C_VERB_PHRASE="R/35", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_35", FK_COLUMNS="orderNo" */
    UPDATE m_save
      SET
        /* %SetFK(m_save,NULL) */
        m_save.orderNo = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM orderTable
            WHERE
              /* %JoinFKPK(:%New,orderTable," = "," AND") */
              :new.orderNo = orderTable.orderNo
        ) 
        /* %JoinPKPK(m_save,:%New," = "," AND") */
         and m_save.save = :new.save;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* reservation  m_save on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="m_save"
    P2C_VERB_PHRASE="R/36", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="revNo" */
    UPDATE m_save
      SET
        /* %SetFK(m_save,NULL) */
        m_save.revNo = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM reservation
            WHERE
              /* %JoinFKPK(:%New,reservation," = "," AND") */
              :new.revNo = reservation.revNo
        ) 
        /* %JoinPKPK(m_save,:%New," = "," AND") */
         and m_save.save = :new.save;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tD_m_save AFTER DELETE ON m_save for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- DELETE trigger on m_save 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* m_save  m_useDetail on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e50c", PARENT_OWNER="", PARENT_TABLE="m_save"
    CHILD_OWNER="", CHILD_TABLE="m_useDetail"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="save" */
    SELECT count(*) INTO NUMROWS
      FROM m_useDetail
      WHERE
        /*  %JoinFKPK(m_useDetail,:%Old," = "," AND") */
        m_useDetail.save = :old.save;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete m_save because m_useDetail exists.'
      );
    END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_m_save AFTER UPDATE ON m_save for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on m_save 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* m_save  m_useDetail on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00044ae1", PARENT_OWNER="", PARENT_TABLE="m_save"
    CHILD_OWNER="", CHILD_TABLE="m_useDetail"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="save" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.save <> :new.save
  THEN
    SELECT count(*) INTO NUMROWS
      FROM m_useDetail
      WHERE
        /*  %JoinFKPK(m_useDetail,:%Old," = "," AND") */
        m_useDetail.save = :old.save;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update m_save because m_useDetail exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* member  m_save on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="m_save"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="id" */
  SELECT count(*) INTO NUMROWS
    FROM member
    WHERE
      /* %JoinFKPK(:%New,member," = "," AND") */
      :new.id = member.id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.id IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update m_save because member does not exist.'
    );
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* orderTable  m_save on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="orderTable"
    CHILD_OWNER="", CHILD_TABLE="m_save"
    P2C_VERB_PHRASE="R/35", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_35", FK_COLUMNS="orderNo" */
  SELECT count(*) INTO NUMROWS
    FROM orderTable
    WHERE
      /* %JoinFKPK(:%New,orderTable," = "," AND") */
      :new.orderNo = orderTable.orderNo;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.orderNo IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update m_save because orderTable does not exist.'
    );
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* reservation  m_save on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="m_save"
    P2C_VERB_PHRASE="R/36", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="revNo" */
  SELECT count(*) INTO NUMROWS
    FROM reservation
    WHERE
      /* %JoinFKPK(:%New,reservation," = "," AND") */
      :new.revNo = reservation.revNo;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.revNo IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update m_save because reservation does not exist.'
    );
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tI_m_use BEFORE INSERT ON m_use for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- INSERT trigger on m_use 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* orderTable  m_use on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0002c119", PARENT_OWNER="", PARENT_TABLE="orderTable"
    CHILD_OWNER="", CHILD_TABLE="m_use"
    P2C_VERB_PHRASE="R/29", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="orderNo" */
    UPDATE m_use
      SET
        /* %SetFK(m_use,NULL) */
        m_use.orderNo = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM orderTable
            WHERE
              /* %JoinFKPK(:%New,orderTable," = "," AND") */
              :new.orderNo = orderTable.orderNo
        ) 
        /* %JoinPKPK(m_use,:%New," = "," AND") */
         and m_use.use = :new.use;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* reservation  m_use on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="m_use"
    P2C_VERB_PHRASE="R/31", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="revNo" */
    UPDATE m_use
      SET
        /* %SetFK(m_use,NULL) */
        m_use.revNo = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM reservation
            WHERE
              /* %JoinFKPK(:%New,reservation," = "," AND") */
              :new.revNo = reservation.revNo
        ) 
        /* %JoinPKPK(m_use,:%New," = "," AND") */
         and m_use.use = :new.use;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* member  m_use on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="m_use"
    P2C_VERB_PHRASE="R/37", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="id" */
    UPDATE m_use
      SET
        /* %SetFK(m_use,NULL) */
        m_use.id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM member
            WHERE
              /* %JoinFKPK(:%New,member," = "," AND") */
              :new.id = member.id
        ) 
        /* %JoinPKPK(m_use,:%New," = "," AND") */
         and m_use.use = :new.use;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tD_m_use AFTER DELETE ON m_use for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- DELETE trigger on m_use 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* m_use  m_useDetail on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000dd19", PARENT_OWNER="", PARENT_TABLE="m_use"
    CHILD_OWNER="", CHILD_TABLE="m_useDetail"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="use" */
    SELECT count(*) INTO NUMROWS
      FROM m_useDetail
      WHERE
        /*  %JoinFKPK(m_useDetail,:%Old," = "," AND") */
        m_useDetail.use = :old.use;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete m_use because m_useDetail exists.'
      );
    END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_m_use AFTER UPDATE ON m_use for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on m_use 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* m_use  m_useDetail on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00042ba3", PARENT_OWNER="", PARENT_TABLE="m_use"
    CHILD_OWNER="", CHILD_TABLE="m_useDetail"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="use" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.use <> :new.use
  THEN
    SELECT count(*) INTO NUMROWS
      FROM m_useDetail
      WHERE
        /*  %JoinFKPK(m_useDetail,:%Old," = "," AND") */
        m_useDetail.use = :old.use;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update m_use because m_useDetail exists.'
      );
    END IF;
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* orderTable  m_use on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="orderTable"
    CHILD_OWNER="", CHILD_TABLE="m_use"
    P2C_VERB_PHRASE="R/29", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="orderNo" */
  SELECT count(*) INTO NUMROWS
    FROM orderTable
    WHERE
      /* %JoinFKPK(:%New,orderTable," = "," AND") */
      :new.orderNo = orderTable.orderNo;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.orderNo IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update m_use because orderTable does not exist.'
    );
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* reservation  m_use on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="m_use"
    P2C_VERB_PHRASE="R/31", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="revNo" */
  SELECT count(*) INTO NUMROWS
    FROM reservation
    WHERE
      /* %JoinFKPK(:%New,reservation," = "," AND") */
      :new.revNo = reservation.revNo;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.revNo IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update m_use because reservation does not exist.'
    );
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* member  m_use on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="m_use"
    P2C_VERB_PHRASE="R/37", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="id" */
  SELECT count(*) INTO NUMROWS
    FROM member
    WHERE
      /* %JoinFKPK(:%New,member," = "," AND") */
      :new.id = member.id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.id IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update m_use because member does not exist.'
    );
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tI_m_useDetail BEFORE INSERT ON m_useDetail for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- INSERT trigger on m_useDetail 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* m_use  m_useDetail on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001ee0b", PARENT_OWNER="", PARENT_TABLE="m_use"
    CHILD_OWNER="", CHILD_TABLE="m_useDetail"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="use" */
    SELECT count(*) INTO NUMROWS
      FROM m_use
      WHERE
        /* %JoinFKPK(:%New,m_use," = "," AND") */
        :new.use = m_use.use;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert m_useDetail because m_use does not exist.'
      );
    END IF;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* m_save  m_useDetail on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="m_save"
    CHILD_OWNER="", CHILD_TABLE="m_useDetail"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="save" */
    SELECT count(*) INTO NUMROWS
      FROM m_save
      WHERE
        /* %JoinFKPK(:%New,m_save," = "," AND") */
        :new.save = m_save.save;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert m_useDetail because m_save does not exist.'
      );
    END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_m_useDetail AFTER UPDATE ON m_useDetail for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on m_useDetail 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* m_use  m_useDetail on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001f3f3", PARENT_OWNER="", PARENT_TABLE="m_use"
    CHILD_OWNER="", CHILD_TABLE="m_useDetail"
    P2C_VERB_PHRASE="R/6", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_50", FK_COLUMNS="use" */
  SELECT count(*) INTO NUMROWS
    FROM m_use
    WHERE
      /* %JoinFKPK(:%New,m_use," = "," AND") */
      :new.use = m_use.use;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update m_useDetail because m_use does not exist.'
    );
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* m_save  m_useDetail on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="m_save"
    CHILD_OWNER="", CHILD_TABLE="m_useDetail"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="save" */
  SELECT count(*) INTO NUMROWS
    FROM m_save
    WHERE
      /* %JoinFKPK(:%New,m_save," = "," AND") */
      :new.save = m_save.save;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update m_useDetail because m_save does not exist.'
    );
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tD_meal AFTER DELETE ON meal for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- DELETE trigger on meal 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* meal  rMeal on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000b093", PARENT_OWNER="", PARENT_TABLE="meal"
    CHILD_OWNER="", CHILD_TABLE="rMeal"
    P2C_VERB_PHRASE="R/32", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="mealNo" */
    UPDATE rMeal
      SET
        /* %SetFK(rMeal,NULL) */
        rMeal.mealNo = NULL
      WHERE
        /* %JoinFKPK(rMeal,:%Old," = "," AND") */
        rMeal.mealNo = :old.mealNo;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_meal AFTER UPDATE ON meal for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on meal 
DECLARE NUMROWS INTEGER;
BEGIN
  /* meal  rMeal on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0000d9bc", PARENT_OWNER="", PARENT_TABLE="meal"
    CHILD_OWNER="", CHILD_TABLE="rMeal"
    P2C_VERB_PHRASE="R/32", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="mealNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.mealNo <> :new.mealNo
  THEN
    UPDATE rMeal
      SET
        /* %SetFK(rMeal,NULL) */
        rMeal.mealNo = NULL
      WHERE
        /* %JoinFKPK(rMeal,:%Old," = ",",") */
        rMeal.mealNo = :old.mealNo;
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tI_member BEFORE INSERT ON member for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- INSERT trigger on member 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* grade  member on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0000dfd0", PARENT_OWNER="", PARENT_TABLE="grade"
    CHILD_OWNER="", CHILD_TABLE="member"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="gradeNo" */
    UPDATE member
      SET
        /* %SetFK(member,NULL) */
        member.gradeNo = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM grade
            WHERE
              /* %JoinFKPK(:%New,grade," = "," AND") */
              :new.gradeNo = grade.gradeNo
        ) 
        /* %JoinPKPK(member,:%New," = "," AND") */
         and member.id = :new.id;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tD_member AFTER DELETE ON member for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- DELETE trigger on member 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* member  m_save on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00047858", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="m_save"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="id" */
    UPDATE m_save
      SET
        /* %SetFK(m_save,NULL) */
        m_save.id = NULL
      WHERE
        /* %JoinFKPK(m_save,:%Old," = "," AND") */
        m_save.id = :old.id;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* member  orderTable on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="orderTable"
    P2C_VERB_PHRASE="R/17", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="id" */
    UPDATE orderTable
      SET
        /* %SetFK(orderTable,NULL) */
        orderTable.id = NULL
      WHERE
        /* %JoinFKPK(orderTable,:%Old," = "," AND") */
        orderTable.id = :old.id;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* member  reservation on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="reservation"
    P2C_VERB_PHRASE="R/19", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="id" */
    DELETE FROM reservation
      WHERE
        /*  %JoinFKPK(reservation,:%Old," = "," AND") */
        reservation.id = :old.id;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* member  info_service on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="info_service"
    P2C_VERB_PHRASE="R/23", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="id" */
    UPDATE info_service
      SET
        /* %SetFK(info_service,NULL) */
        info_service.id = NULL
      WHERE
        /* %JoinFKPK(info_service,:%Old," = "," AND") */
        info_service.id = :old.id;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* member  cart on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="cart"
    P2C_VERB_PHRASE="R/28", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="id" */
    UPDATE cart
      SET
        /* %SetFK(cart,NULL) */
        cart.id = NULL
      WHERE
        /* %JoinFKPK(cart,:%Old," = "," AND") */
        cart.id = :old.id;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* member  m_use on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="m_use"
    P2C_VERB_PHRASE="R/37", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="id" */
    UPDATE m_use
      SET
        /* %SetFK(m_use,NULL) */
        m_use.id = NULL
      WHERE
        /* %JoinFKPK(m_use,:%Old," = "," AND") */
        m_use.id = :old.id;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_member AFTER UPDATE ON member for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on member 
DECLARE NUMROWS INTEGER;
BEGIN
  /* member  m_save on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0005e96a", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="m_save"
    P2C_VERB_PHRASE="R/3", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id <> :new.id
  THEN
    UPDATE m_save
      SET
        /* %SetFK(m_save,NULL) */
        m_save.id = NULL
      WHERE
        /* %JoinFKPK(m_save,:%Old," = ",",") */
        m_save.id = :old.id;
  END IF;

  /* member  orderTable on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="orderTable"
    P2C_VERB_PHRASE="R/17", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id <> :new.id
  THEN
    UPDATE orderTable
      SET
        /* %SetFK(orderTable,NULL) */
        orderTable.id = NULL
      WHERE
        /* %JoinFKPK(orderTable,:%Old," = ",",") */
        orderTable.id = :old.id;
  END IF;

  /* member  reservation on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="reservation"
    P2C_VERB_PHRASE="R/19", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id <> :new.id
  THEN
    UPDATE reservation
      SET
        /* %SetFK(reservation,NULL) */
        reservation.id = NULL
      WHERE
        /* %JoinFKPK(reservation,:%Old," = ",",") */
        reservation.id = :old.id;
  END IF;

  /* member  info_service on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="info_service"
    P2C_VERB_PHRASE="R/23", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id <> :new.id
  THEN
    UPDATE info_service
      SET
        /* %SetFK(info_service,NULL) */
        info_service.id = NULL
      WHERE
        /* %JoinFKPK(info_service,:%Old," = ",",") */
        info_service.id = :old.id;
  END IF;

  /* member  cart on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="cart"
    P2C_VERB_PHRASE="R/28", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id <> :new.id
  THEN
    UPDATE cart
      SET
        /* %SetFK(cart,NULL) */
        cart.id = NULL
      WHERE
        /* %JoinFKPK(cart,:%Old," = ",",") */
        cart.id = :old.id;
  END IF;

  /* member  m_use on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="m_use"
    P2C_VERB_PHRASE="R/37", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_37", FK_COLUMNS="id" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.id <> :new.id
  THEN
    UPDATE m_use
      SET
        /* %SetFK(m_use,NULL) */
        m_use.id = NULL
      WHERE
        /* %JoinFKPK(m_use,:%Old," = ",",") */
        m_use.id = :old.id;
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* grade  member on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="grade"
    CHILD_OWNER="", CHILD_TABLE="member"
    P2C_VERB_PHRASE="R/2", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_51", FK_COLUMNS="gradeNo" */
  SELECT count(*) INTO NUMROWS
    FROM grade
    WHERE
      /* %JoinFKPK(:%New,grade," = "," AND") */
      :new.gradeNo = grade.gradeNo;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.gradeNo IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update member because grade does not exist.'
    );
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tI_order_detail BEFORE INSERT ON order_detail for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- INSERT trigger on order_detail 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* product  order_detail on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="000234bf", PARENT_OWNER="", PARENT_TABLE="product"
    CHILD_OWNER="", CHILD_TABLE="order_detail"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="productNo" */
    UPDATE order_detail
      SET
        /* %SetFK(order_detail,NULL) */
        order_detail.productNo = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM product
            WHERE
              /* %JoinFKPK(:%New,product," = "," AND") */
              :new.productNo = product.productNo
        ) 
        /* %JoinPKPK(order_detail,:%New," = "," AND") */
         and order_detail.order_detailNo = :new.order_detailNo;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* orderTable  order_detail on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="orderTable"
    CHILD_OWNER="", CHILD_TABLE="order_detail"
    P2C_VERB_PHRASE="R/12", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="orderNo" */
    UPDATE order_detail
      SET
        /* %SetFK(order_detail,NULL) */
        order_detail.orderNo = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM orderTable
            WHERE
              /* %JoinFKPK(:%New,orderTable," = "," AND") */
              :new.orderNo = orderTable.orderNo
        ) 
        /* %JoinPKPK(order_detail,:%New," = "," AND") */
         and order_detail.order_detailNo = :new.order_detailNo;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_order_detail AFTER UPDATE ON order_detail for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on order_detail 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* product  order_detail on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00023d75", PARENT_OWNER="", PARENT_TABLE="product"
    CHILD_OWNER="", CHILD_TABLE="order_detail"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="productNo" */
  SELECT count(*) INTO NUMROWS
    FROM product
    WHERE
      /* %JoinFKPK(:%New,product," = "," AND") */
      :new.productNo = product.productNo;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.productNo IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update order_detail because product does not exist.'
    );
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* orderTable  order_detail on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="orderTable"
    CHILD_OWNER="", CHILD_TABLE="order_detail"
    P2C_VERB_PHRASE="R/12", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="orderNo" */
  SELECT count(*) INTO NUMROWS
    FROM orderTable
    WHERE
      /* %JoinFKPK(:%New,orderTable," = "," AND") */
      :new.orderNo = orderTable.orderNo;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.orderNo IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update order_detail because orderTable does not exist.'
    );
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tI_orderTable BEFORE INSERT ON orderTable for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- INSERT trigger on orderTable 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* member  orderTable on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0001e78e", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="orderTable"
    P2C_VERB_PHRASE="R/17", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="id" */
    UPDATE orderTable
      SET
        /* %SetFK(orderTable,NULL) */
        orderTable.id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM member
            WHERE
              /* %JoinFKPK(:%New,member," = "," AND") */
              :new.id = member.id
        ) 
        /* %JoinPKPK(orderTable,:%New," = "," AND") */
         and orderTable.orderNo = :new.orderNo;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* reservation  orderTable on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="orderTable"
    P2C_VERB_PHRASE="R/39", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="revNo" */
    UPDATE orderTable
      SET
        /* %SetFK(orderTable,NULL) */
        orderTable.revNo = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM reservation
            WHERE
              /* %JoinFKPK(:%New,reservation," = "," AND") */
              :new.revNo = reservation.revNo
        ) 
        /* %JoinPKPK(orderTable,:%New," = "," AND") */
         and orderTable.orderNo = :new.orderNo;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tD_orderTable AFTER DELETE ON orderTable for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- DELETE trigger on orderTable 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* orderTable  order_detail on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0002716b", PARENT_OWNER="", PARENT_TABLE="orderTable"
    CHILD_OWNER="", CHILD_TABLE="order_detail"
    P2C_VERB_PHRASE="R/12", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="orderNo" */
    UPDATE order_detail
      SET
        /* %SetFK(order_detail,NULL) */
        order_detail.orderNo = NULL
      WHERE
        /* %JoinFKPK(order_detail,:%Old," = "," AND") */
        order_detail.orderNo = :old.orderNo;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* orderTable  m_use on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="orderTable"
    CHILD_OWNER="", CHILD_TABLE="m_use"
    P2C_VERB_PHRASE="R/29", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="orderNo" */
    UPDATE m_use
      SET
        /* %SetFK(m_use,NULL) */
        m_use.orderNo = NULL
      WHERE
        /* %JoinFKPK(m_use,:%Old," = "," AND") */
        m_use.orderNo = :old.orderNo;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* orderTable  m_save on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="orderTable"
    CHILD_OWNER="", CHILD_TABLE="m_save"
    P2C_VERB_PHRASE="R/35", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_35", FK_COLUMNS="orderNo" */
    UPDATE m_save
      SET
        /* %SetFK(m_save,NULL) */
        m_save.orderNo = NULL
      WHERE
        /* %JoinFKPK(m_save,:%Old," = "," AND") */
        m_save.orderNo = :old.orderNo;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_orderTable AFTER UPDATE ON orderTable for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on orderTable 
DECLARE NUMROWS INTEGER;
BEGIN
  /* orderTable  order_detail on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0004bbb7", PARENT_OWNER="", PARENT_TABLE="orderTable"
    CHILD_OWNER="", CHILD_TABLE="order_detail"
    P2C_VERB_PHRASE="R/12", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="orderNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.orderNo <> :new.orderNo
  THEN
    UPDATE order_detail
      SET
        /* %SetFK(order_detail,NULL) */
        order_detail.orderNo = NULL
      WHERE
        /* %JoinFKPK(order_detail,:%Old," = ",",") */
        order_detail.orderNo = :old.orderNo;
  END IF;

  /* orderTable  m_use on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="orderTable"
    CHILD_OWNER="", CHILD_TABLE="m_use"
    P2C_VERB_PHRASE="R/29", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="orderNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.orderNo <> :new.orderNo
  THEN
    UPDATE m_use
      SET
        /* %SetFK(m_use,NULL) */
        m_use.orderNo = NULL
      WHERE
        /* %JoinFKPK(m_use,:%Old," = ",",") */
        m_use.orderNo = :old.orderNo;
  END IF;

  /* orderTable  m_save on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="orderTable"
    CHILD_OWNER="", CHILD_TABLE="m_save"
    P2C_VERB_PHRASE="R/35", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_35", FK_COLUMNS="orderNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.orderNo <> :new.orderNo
  THEN
    UPDATE m_save
      SET
        /* %SetFK(m_save,NULL) */
        m_save.orderNo = NULL
      WHERE
        /* %JoinFKPK(m_save,:%Old," = ",",") */
        m_save.orderNo = :old.orderNo;
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* member  orderTable on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="orderTable"
    P2C_VERB_PHRASE="R/17", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_17", FK_COLUMNS="id" */
  SELECT count(*) INTO NUMROWS
    FROM member
    WHERE
      /* %JoinFKPK(:%New,member," = "," AND") */
      :new.id = member.id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.id IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update orderTable because member does not exist.'
    );
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* reservation  orderTable on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="orderTable"
    P2C_VERB_PHRASE="R/39", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="revNo" */
  SELECT count(*) INTO NUMROWS
    FROM reservation
    WHERE
      /* %JoinFKPK(:%New,reservation," = "," AND") */
      :new.revNo = reservation.revNo;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.revNo IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update orderTable because reservation does not exist.'
    );
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tD_product AFTER DELETE ON product for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- DELETE trigger on product 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* product  cart on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0001a07e", PARENT_OWNER="", PARENT_TABLE="product"
    CHILD_OWNER="", CHILD_TABLE="cart"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="productNo" */
    UPDATE cart
      SET
        /* %SetFK(cart,NULL) */
        cart.productNo = NULL
      WHERE
        /* %JoinFKPK(cart,:%Old," = "," AND") */
        cart.productNo = :old.productNo;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* product  order_detail on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="product"
    CHILD_OWNER="", CHILD_TABLE="order_detail"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="productNo" */
    UPDATE order_detail
      SET
        /* %SetFK(order_detail,NULL) */
        order_detail.productNo = NULL
      WHERE
        /* %JoinFKPK(order_detail,:%Old," = "," AND") */
        order_detail.productNo = :old.productNo;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_product AFTER UPDATE ON product for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on product 
DECLARE NUMROWS INTEGER;
BEGIN
  /* product  cart on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0001d2c9", PARENT_OWNER="", PARENT_TABLE="product"
    CHILD_OWNER="", CHILD_TABLE="cart"
    P2C_VERB_PHRASE="R/7", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="productNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.productNo <> :new.productNo
  THEN
    UPDATE cart
      SET
        /* %SetFK(cart,NULL) */
        cart.productNo = NULL
      WHERE
        /* %JoinFKPK(cart,:%Old," = ",",") */
        cart.productNo = :old.productNo;
  END IF;

  /* product  order_detail on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="product"
    CHILD_OWNER="", CHILD_TABLE="order_detail"
    P2C_VERB_PHRASE="R/11", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="productNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.productNo <> :new.productNo
  THEN
    UPDATE order_detail
      SET
        /* %SetFK(order_detail,NULL) */
        order_detail.productNo = NULL
      WHERE
        /* %JoinFKPK(order_detail,:%Old," = ",",") */
        order_detail.productNo = :old.productNo;
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tI_reservation BEFORE INSERT ON reservation for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- INSERT trigger on reservation 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* member  reservation on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0002072c", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="reservation"
    P2C_VERB_PHRASE="R/19", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="id" */
    UPDATE reservation
      SET
        /* %SetFK(reservation,NULL) */
        reservation.id = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM member
            WHERE
              /* %JoinFKPK(:%New,member," = "," AND") */
              :new.id = member.id
        ) 
        /* %JoinPKPK(reservation,:%New," = "," AND") */
         and reservation.revNo = :new.revNo;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* flightInf  reservation on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="flightInf"
    CHILD_OWNER="", CHILD_TABLE="reservation"
    P2C_VERB_PHRASE="R/22", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="flightno" */
    UPDATE reservation
      SET
        /* %SetFK(reservation,NULL) */
        reservation.flightno = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM flightInf
            WHERE
              /* %JoinFKPK(:%New,flightInf," = "," AND") */
              :new.flightno = flightInf.flightno
        ) 
        /* %JoinPKPK(reservation,:%New," = "," AND") */
         and reservation.revNo = :new.revNo;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tD_reservation AFTER DELETE ON reservation for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- DELETE trigger on reservation 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* reservation  m_use on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0003ece1", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="m_use"
    P2C_VERB_PHRASE="R/31", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="revNo" */
    UPDATE m_use
      SET
        /* %SetFK(m_use,NULL) */
        m_use.revNo = NULL
      WHERE
        /* %JoinFKPK(m_use,:%Old," = "," AND") */
        m_use.revNo = :old.revNo;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* reservation  rMeal on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="rMeal"
    P2C_VERB_PHRASE="R/33", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="revNo" */
    DELETE FROM rMeal
      WHERE
        /*  %JoinFKPK(rMeal,:%Old," = "," AND") */
        rMeal.revNo = :old.revNo;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* reservation  m_save on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="m_save"
    P2C_VERB_PHRASE="R/36", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="revNo" */
    UPDATE m_save
      SET
        /* %SetFK(m_save,NULL) */
        m_save.revNo = NULL
      WHERE
        /* %JoinFKPK(m_save,:%Old," = "," AND") */
        m_save.revNo = :old.revNo;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* reservation  seat on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="seat"
    P2C_VERB_PHRASE="R/38", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="revNo" */
    SELECT count(*) INTO NUMROWS
      FROM seat
      WHERE
        /*  %JoinFKPK(seat,:%Old," = "," AND") */
        seat.revNo = :old.revNo;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete reservation because seat exists.'
      );
    END IF;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* reservation  orderTable on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="orderTable"
    P2C_VERB_PHRASE="R/39", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="revNo" */
    UPDATE orderTable
      SET
        /* %SetFK(orderTable,NULL) */
        orderTable.revNo = NULL
      WHERE
        /* %JoinFKPK(orderTable,:%Old," = "," AND") */
        orderTable.revNo = :old.revNo;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_reservation AFTER UPDATE ON reservation for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on reservation 
DECLARE NUMROWS INTEGER;
BEGIN
  /* reservation  m_use on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0006adb5", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="m_use"
    P2C_VERB_PHRASE="R/31", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_31", FK_COLUMNS="revNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.revNo <> :new.revNo
  THEN
    UPDATE m_use
      SET
        /* %SetFK(m_use,NULL) */
        m_use.revNo = NULL
      WHERE
        /* %JoinFKPK(m_use,:%Old," = ",",") */
        m_use.revNo = :old.revNo;
  END IF;

  /* reservation  rMeal on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="rMeal"
    P2C_VERB_PHRASE="R/33", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="revNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.revNo <> :new.revNo
  THEN
    UPDATE rMeal
      SET
        /* %SetFK(rMeal,NULL) */
        rMeal.revNo = NULL
      WHERE
        /* %JoinFKPK(rMeal,:%Old," = ",",") */
        rMeal.revNo = :old.revNo;
  END IF;

  /* reservation  m_save on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="m_save"
    P2C_VERB_PHRASE="R/36", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_36", FK_COLUMNS="revNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.revNo <> :new.revNo
  THEN
    UPDATE m_save
      SET
        /* %SetFK(m_save,NULL) */
        m_save.revNo = NULL
      WHERE
        /* %JoinFKPK(m_save,:%Old," = ",",") */
        m_save.revNo = :old.revNo;
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* reservation  seat on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="seat"
    P2C_VERB_PHRASE="R/38", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="revNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.revNo <> :new.revNo
  THEN
    SELECT count(*) INTO NUMROWS
      FROM seat
      WHERE
        /*  %JoinFKPK(seat,:%Old," = "," AND") */
        seat.revNo = :old.revNo;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update reservation because seat exists.'
      );
    END IF;
  END IF;

  /* reservation  orderTable on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="orderTable"
    P2C_VERB_PHRASE="R/39", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_39", FK_COLUMNS="revNo" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.revNo <> :new.revNo
  THEN
    UPDATE orderTable
      SET
        /* %SetFK(orderTable,NULL) */
        orderTable.revNo = NULL
      WHERE
        /* %JoinFKPK(orderTable,:%Old," = ",",") */
        orderTable.revNo = :old.revNo;
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* member  reservation on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="member"
    CHILD_OWNER="", CHILD_TABLE="reservation"
    P2C_VERB_PHRASE="R/19", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="id" */
  SELECT count(*) INTO NUMROWS
    FROM member
    WHERE
      /* %JoinFKPK(:%New,member," = "," AND") */
      :new.id = member.id;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.id IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update reservation because member does not exist.'
    );
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* flightInf  reservation on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="flightInf"
    CHILD_OWNER="", CHILD_TABLE="reservation"
    P2C_VERB_PHRASE="R/22", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="flightno" */
  SELECT count(*) INTO NUMROWS
    FROM flightInf
    WHERE
      /* %JoinFKPK(:%New,flightInf," = "," AND") */
      :new.flightno = flightInf.flightno;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.flightno IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update reservation because flightInf does not exist.'
    );
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tI_rMeal BEFORE INSERT ON rMeal for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- INSERT trigger on rMeal 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* meal  rMeal on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0001ecdc", PARENT_OWNER="", PARENT_TABLE="meal"
    CHILD_OWNER="", CHILD_TABLE="rMeal"
    P2C_VERB_PHRASE="R/32", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="mealNo" */
    UPDATE rMeal
      SET
        /* %SetFK(rMeal,NULL) */
        rMeal.mealNo = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM meal
            WHERE
              /* %JoinFKPK(:%New,meal," = "," AND") */
              :new.mealNo = meal.mealNo
        ) 
        /* %JoinPKPK(rMeal,:%New," = "," AND") */
         and rMeal.revMealNo = :new.revMealNo;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* reservation  rMeal on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="rMeal"
    P2C_VERB_PHRASE="R/33", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="revNo" */
    UPDATE rMeal
      SET
        /* %SetFK(rMeal,NULL) */
        rMeal.revNo = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM reservation
            WHERE
              /* %JoinFKPK(:%New,reservation," = "," AND") */
              :new.revNo = reservation.revNo
        ) 
        /* %JoinPKPK(rMeal,:%New," = "," AND") */
         and rMeal.revMealNo = :new.revMealNo;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_rMeal AFTER UPDATE ON rMeal for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on rMeal 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* meal  rMeal on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000218b4", PARENT_OWNER="", PARENT_TABLE="meal"
    CHILD_OWNER="", CHILD_TABLE="rMeal"
    P2C_VERB_PHRASE="R/32", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_32", FK_COLUMNS="mealNo" */
  SELECT count(*) INTO NUMROWS
    FROM meal
    WHERE
      /* %JoinFKPK(:%New,meal," = "," AND") */
      :new.mealNo = meal.mealNo;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.mealNo IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update rMeal because meal does not exist.'
    );
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* reservation  rMeal on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="rMeal"
    P2C_VERB_PHRASE="R/33", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="revNo" */
  SELECT count(*) INTO NUMROWS
    FROM reservation
    WHERE
      /* %JoinFKPK(:%New,reservation," = "," AND") */
      :new.revNo = reservation.revNo;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.revNo IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update rMeal because reservation does not exist.'
    );
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tI_seat BEFORE INSERT ON seat for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- INSERT trigger on seat 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* flightInf  seat on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="000200a9", PARENT_OWNER="", PARENT_TABLE="flightInf"
    CHILD_OWNER="", CHILD_TABLE="seat"
    P2C_VERB_PHRASE="R/30", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="flightno" */
    SELECT count(*) INTO NUMROWS
      FROM flightInf
      WHERE
        /* %JoinFKPK(:%New,flightInf," = "," AND") */
        :new.flightno = flightInf.flightno;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert seat because flightInf does not exist.'
      );
    END IF;

    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* reservation  seat on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="seat"
    P2C_VERB_PHRASE="R/38", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="revNo" */
    SELECT count(*) INTO NUMROWS
      FROM reservation
      WHERE
        /* %JoinFKPK(:%New,reservation," = "," AND") */
        :new.revNo = reservation.revNo;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert seat because reservation does not exist.'
      );
    END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_seat AFTER UPDATE ON seat for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on seat 
DECLARE NUMROWS INTEGER;
BEGIN
  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* flightInf  seat on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00020517", PARENT_OWNER="", PARENT_TABLE="flightInf"
    CHILD_OWNER="", CHILD_TABLE="seat"
    P2C_VERB_PHRASE="R/30", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="flightno" */
  SELECT count(*) INTO NUMROWS
    FROM flightInf
    WHERE
      /* %JoinFKPK(:%New,flightInf," = "," AND") */
      :new.flightno = flightInf.flightno;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update seat because flightInf does not exist.'
    );
  END IF;

  /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
  /* reservation  seat on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="reservation"
    CHILD_OWNER="", CHILD_TABLE="seat"
    P2C_VERB_PHRASE="R/38", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_38", FK_COLUMNS="revNo" */
  SELECT count(*) INTO NUMROWS
    FROM reservation
    WHERE
      /* %JoinFKPK(:%New,reservation," = "," AND") */
      :new.revNo = reservation.revNo;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update seat because reservation does not exist.'
    );
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/


CREATE  TRIGGER tD_startcon AFTER DELETE ON startcon for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- DELETE trigger on startcon 
DECLARE NUMROWS INTEGER;
BEGIN
    /* ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02 */
    /* startcon  flightInf on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000d8ce", PARENT_OWNER="", PARENT_TABLE="startcon"
    CHILD_OWNER="", CHILD_TABLE="flightInf"
    P2C_VERB_PHRASE="R/27", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="startstation" */
    UPDATE flightInf
      SET
        /* %SetFK(flightInf,NULL) */
        flightInf.startstation = NULL
      WHERE
        /* %JoinFKPK(flightInf,:%Old," = "," AND") */
        flightInf.startstation = :old.startstation;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

CREATE  TRIGGER tU_startcon AFTER UPDATE ON startcon for each row
-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
-- UPDATE trigger on startcon 
DECLARE NUMROWS INTEGER;
BEGIN
  /* startcon  flightInf on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="0000fd09", PARENT_OWNER="", PARENT_TABLE="startcon"
    CHILD_OWNER="", CHILD_TABLE="flightInf"
    P2C_VERB_PHRASE="R/27", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="startstation" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.startstation <> :new.startstation
  THEN
    UPDATE flightInf
      SET
        /* %SetFK(flightInf,NULL) */
        flightInf.startstation = NULL
      WHERE
        /* %JoinFKPK(flightInf,:%Old," = ",",") */
        flightInf.startstation = :old.startstation;
  END IF;


-- ERwin Builtin 2023년 3월 3일 금요일 오후 1:40:02
END;
/

