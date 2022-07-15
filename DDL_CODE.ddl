-- 生成者Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   时间:        2022-05-01 20:02:20 EDT
--   站点:      Oracle Database 21c
--   类型:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cky_corporate (
    c_id             NUMBER(4) NOT NULL,
    c_type           CHAR(1) NOT NULL,
    corporation_name VARCHAR2(30) NOT NULL,
    regis_num        VARCHAR2(30) NOT NULL,
    employee_id      NUMBER(7) NOT NULL
);

COMMENT ON COLUMN cky_corporate.c_id IS
    'ID of the customer.';

COMMENT ON COLUMN cky_corporate.c_type IS
    'Type of the customer.';

COMMENT ON COLUMN cky_corporate.corporation_name IS
    'Name of the corporation.';

COMMENT ON COLUMN cky_corporate.regis_num IS
    'Registration number';

COMMENT ON COLUMN cky_corporate.employee_id IS
    'Employee ID ';

ALTER TABLE cky_corporate ADD CONSTRAINT cky_corporate_pk PRIMARY KEY ( c_id,
                                                                        c_type );

CREATE TABLE cky_coup_cus (
    coupon_type CHAR(1) NOT NULL,
    c_id        NUMBER(4) NOT NULL,
    c_type      CHAR(1) NOT NULL,
    coupon_id   NUMBER(7) NOT NULL
);

COMMENT ON COLUMN cky_coup_cus.coupon_type IS
    'Type of the coupon.';

ALTER TABLE cky_coup_cus
    ADD CONSTRAINT cky_coup_cus_pk PRIMARY KEY ( c_id,
                                                 c_type,
                                                 coupon_id );

CREATE TABLE cky_coupons (
    coupon_id  NUMBER(7) NOT NULL,
    discount   NUMBER(4, 4) NOT NULL,
    valid_from DATE,
    valid_to   DATE
);

COMMENT ON COLUMN cky_coupons.coupon_id IS
    'ID of discount coupon.';

COMMENT ON COLUMN cky_coupons.discount IS
    'Percentage of discount.';

COMMENT ON COLUMN cky_coupons.valid_from IS
    'Start date of the discount coupon.';

COMMENT ON COLUMN cky_coupons.valid_to IS
    'End date of the discount coupon.';

ALTER TABLE cky_coupons ADD CONSTRAINT cky_coupons_pk PRIMARY KEY ( coupon_id );

CREATE TABLE cky_customer (
    c_id        NUMBER(4) NOT NULL,
    c_type      CHAR(1) NOT NULL,
    c_street    VARCHAR2(30) NOT NULL,
    c_city      VARCHAR2(30) NOT NULL,
    c_state     VARCHAR2(30) NOT NULL,
    c_zipcode   VARCHAR2(12) NOT NULL,
    c_email     VARCHAR2(30) NOT NULL,
    c_phone_num VARCHAR2(30) NOT NULL,
    c_password  VARCHAR2(50) NOT NULL
);

ALTER TABLE cky_customer
    ADD CONSTRAINT ch_inh_cky_customer CHECK ( c_type IN ( 'C', 'I' ) );

COMMENT ON COLUMN cky_customer.c_id IS
    'ID of the customer.';

COMMENT ON COLUMN cky_customer.c_type IS
    'Type of the customer.';

COMMENT ON COLUMN cky_customer.c_street IS
    'Street in customer''s address.';

COMMENT ON COLUMN cky_customer.c_city IS
    'City of customer''s address.';

COMMENT ON COLUMN cky_customer.c_state IS
    'State of customer''s address.';

COMMENT ON COLUMN cky_customer.c_zipcode IS
    'Zipcode of customer''s address.';

COMMENT ON COLUMN cky_customer.c_email IS
    'Email address of the customer.';

COMMENT ON COLUMN cky_customer.c_phone_num IS
    'Phone number of the customer.';

COMMENT ON COLUMN cky_customer.c_password IS
    'Customer Password.';

ALTER TABLE cky_customer ADD CONSTRAINT cky_customer_pk PRIMARY KEY ( c_id,
                                                                      c_type );

CREATE TABLE cky_individual (
    c_id            NUMBER(4) NOT NULL,
    c_type          CHAR(1) NOT NULL,
    f_name          VARCHAR2(30) NOT NULL,
    m_name          VARCHAR2(30),
    l_name          VARCHAR2(30) NOT NULL,
    dln             VARCHAR2(30) NOT NULL,
    insurance_cname VARCHAR2(30) NOT NULL,
    insurance_pnum  VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN cky_individual.c_id IS
    'ID of the customer.';

COMMENT ON COLUMN cky_individual.c_type IS
    'Type of the customer.';

COMMENT ON COLUMN cky_individual.f_name IS
    'First name of the customer.';

COMMENT ON COLUMN cky_individual.m_name IS
    'Middle name of the customer.';

COMMENT ON COLUMN cky_individual.l_name IS
    'Last name of the customer.';

COMMENT ON COLUMN cky_individual.dln IS
    'Driver License Number';

COMMENT ON COLUMN cky_individual.insurance_cname IS
    'Insurance Company Name ';

COMMENT ON COLUMN cky_individual.insurance_pnum IS
    'Insurance Policy Number';

ALTER TABLE cky_individual ADD CONSTRAINT cky_individual_pk PRIMARY KEY ( c_id,
                                                                          c_type );

CREATE TABLE cky_invoice (
    invoice_id     NUMBER(4) NOT NULL,
    invoice_date   DATE NOT NULL,
    invoice_amount NUMBER(7, 2) NOT NULL,
    r_id           NUMBER(4) NOT NULL
);

COMMENT ON COLUMN cky_invoice.invoice_id IS
    'unique number of invoice';

COMMENT ON COLUMN cky_invoice.invoice_date IS
    'Invoice Date';

COMMENT ON COLUMN cky_invoice.invoice_amount IS
    'Invoice Amount';

CREATE UNIQUE INDEX cky_invoice__idx ON
    cky_invoice (
        r_id
    ASC );

ALTER TABLE cky_invoice ADD CONSTRAINT cky_invoice_pk PRIMARY KEY ( invoice_id );

CREATE TABLE cky_office (
    office_id     NUMBER(10) NOT NULL,
    off_country   VARCHAR2(20) NOT NULL,
    off_state     VARCHAR2(20) NOT NULL,
    off_city      VARCHAR2(20) NOT NULL,
    off_street    VARCHAR2(30) NOT NULL,
    off_zipcode   VARCHAR2(5) NOT NULL,
    off_phone_num VARCHAR2(15) NOT NULL
);

COMMENT ON COLUMN cky_office.office_id IS
    'ID of office in different location';

COMMENT ON COLUMN cky_office.off_country IS
    'country of the office';

COMMENT ON COLUMN cky_office.off_state IS
    'STATE OF OFFICE';

COMMENT ON COLUMN cky_office.off_city IS
    'City of office';

COMMENT ON COLUMN cky_office.off_street IS
    'street address of office';

COMMENT ON COLUMN cky_office.off_zipcode IS
    'ZIP CODE OF THE OFFICE';

COMMENT ON COLUMN cky_office.off_phone_num IS
    'phone number of office';

ALTER TABLE cky_office ADD CONSTRAINT cky_office_pk PRIMARY KEY ( office_id );

CREATE TABLE cky_payment (
    payment_id NUMBER(4) NOT NULL,
    pay_date   DATE NOT NULL,
    pay_mathod VARCHAR2(30) NOT NULL,
    card_num   NUMBER(16) NOT NULL,
    invoice_id NUMBER(4) NOT NULL,
    pay_amount NUMBER(7, 2) NOT NULL
);

COMMENT ON COLUMN cky_payment.payment_id IS
    'unique number of payment';

COMMENT ON COLUMN cky_payment.pay_date IS
    'payment date';

COMMENT ON COLUMN cky_payment.pay_mathod IS
    'payment method';

COMMENT ON COLUMN cky_payment.card_num IS
    'card number of payment';

COMMENT ON COLUMN cky_payment.pay_amount IS
    'PAYMENT AMOUNT';

ALTER TABLE cky_payment ADD CONSTRAINT cky_payment_pk PRIMARY KEY ( payment_id );

CREATE TABLE cky_rental (
    r_id          NUMBER(4) NOT NULL,
    pick_date     DATE NOT NULL,
    drop_date     DATE,
    start_odo     NUMBER(7, 2) NOT NULL,
    end_odo       NUMBER(7, 2),
    odo_limit     NUMBER(4),
    pick_location NUMBER(10) NOT NULL,
    drop_location NUMBER(10) NOT NULL,
    vehicle_id    NUMBER(7) NOT NULL,
    c_id          NUMBER(4) NOT NULL,
    c_type        CHAR(12) NOT NULL,
    coupon_id     NUMBER(7) NOT NULL
);

COMMENT ON COLUMN cky_rental.r_id IS
    'Unique number of each rental service';

COMMENT ON COLUMN cky_rental.pick_date IS
    'Pick up Date of rental service';

COMMENT ON COLUMN cky_rental.drop_date IS
    'Drop off date of rental service';

COMMENT ON COLUMN cky_rental.start_odo IS
    'Start odometer of the car';

COMMENT ON COLUMN cky_rental.end_odo IS
    'End odometer of the car';

COMMENT ON COLUMN cky_rental.odo_limit IS
    'Daily odometer limit of the car';

CREATE UNIQUE INDEX cky_rental__idxv1 ON
    cky_rental (
        coupon_id
    ASC );

ALTER TABLE cky_rental ADD CONSTRAINT cky_rental_pk PRIMARY KEY ( r_id );

CREATE TABLE cky_vehicle (
    vehicle_id NUMBER(7) NOT NULL,
    lpn        VARCHAR2(20) NOT NULL,
    make       VARCHAR2(20) NOT NULL,
    v_model    VARCHAR2(20) NOT NULL,
    v_year     NUMBER(4) NOT NULL,
    vin        VARCHAR2(17) NOT NULL,
    status     SMALLINT NOT NULL,
    office_id  NUMBER(10) NOT NULL,
    class_id   NUMBER(10) NOT NULL
);

COMMENT ON COLUMN cky_vehicle.vehicle_id IS
    'Vehicle ID';

COMMENT ON COLUMN cky_vehicle.lpn IS
    'License plate number to identify vehicle';

COMMENT ON COLUMN cky_vehicle.make IS
    'MAKE of a vehicle';

COMMENT ON COLUMN cky_vehicle.v_model IS
    'MODEL of a vehicle';

COMMENT ON COLUMN cky_vehicle.v_year IS
    'Year that produce the vehicle';

COMMENT ON COLUMN cky_vehicle.vin IS
    'Vehicle Identification Number';

COMMENT ON COLUMN cky_vehicle.status IS
    'If the vehicle is rented, status is 1, or status is 0.';

ALTER TABLE cky_vehicle ADD CONSTRAINT cky_vehicle_pk PRIMARY KEY ( vehicle_id );

CREATE TABLE cky_vehicle_class (
    class_id    NUMBER(10) NOT NULL,
    class_name  VARCHAR2(20) NOT NULL,
    rental_rate NUMBER(5) NOT NULL,
    fee_om      NUMBER(5) NOT NULL
);

COMMENT ON COLUMN cky_vehicle_class.class_id IS
    'Class of vehicle';

COMMENT ON COLUMN cky_vehicle_class.class_name IS
    'CLASS NAME OF VEHICLE';

COMMENT ON COLUMN cky_vehicle_class.rental_rate IS
    'Rental rate of different class($/day)';

COMMENT ON COLUMN cky_vehicle_class.fee_om IS
    'FEE of over over mileage';

ALTER TABLE cky_vehicle_class ADD CONSTRAINT cky_vehicle_class_pk PRIMARY KEY ( class_id );

ALTER TABLE cky_corporate
    ADD CONSTRAINT cky_corporate_cky_customer_fk FOREIGN KEY ( c_id,
                                                               c_type )
        REFERENCES cky_customer ( c_id,
                                  c_type );

ALTER TABLE cky_coup_cus
    ADD CONSTRAINT cky_coup_cus_cky_coupons_fk FOREIGN KEY ( coupon_id )
        REFERENCES cky_coupons ( coupon_id );

ALTER TABLE cky_coup_cus
    ADD CONSTRAINT cky_coup_cus_cky_customer_fk FOREIGN KEY ( c_id,
                                                              c_type )
        REFERENCES cky_customer ( c_id,
                                  c_type );

ALTER TABLE cky_individual
    ADD CONSTRAINT cky_individual_cky_customer_fk FOREIGN KEY ( c_id,
                                                                c_type )
        REFERENCES cky_customer ( c_id,
                                  c_type );

ALTER TABLE cky_invoice
    ADD CONSTRAINT cky_invoice_cky_rental_fk FOREIGN KEY ( r_id )
        REFERENCES cky_rental ( r_id );

ALTER TABLE cky_payment
    ADD CONSTRAINT cky_payment_cky_invoice_fk FOREIGN KEY ( invoice_id )
        REFERENCES cky_invoice ( invoice_id );

ALTER TABLE cky_rental
    ADD CONSTRAINT cky_rental_cky_coupons_fk FOREIGN KEY ( coupon_id )
        REFERENCES cky_coupons ( coupon_id );

ALTER TABLE cky_rental
    ADD CONSTRAINT cky_rental_cky_customer_fk FOREIGN KEY ( c_id,
                                                            c_type )
        REFERENCES cky_customer ( c_id,
                                  c_type );

ALTER TABLE cky_rental
    ADD CONSTRAINT cky_rental_cky_office_fk FOREIGN KEY ( pick_location )
        REFERENCES cky_office ( office_id );

ALTER TABLE cky_rental
    ADD CONSTRAINT cky_rental_cky_office_fkv1 FOREIGN KEY ( drop_location )
        REFERENCES cky_office ( office_id );

ALTER TABLE cky_rental
    ADD CONSTRAINT cky_rental_cky_vehicle_fk FOREIGN KEY ( vehicle_id )
        REFERENCES cky_vehicle ( vehicle_id );

ALTER TABLE cky_vehicle
    ADD CONSTRAINT cky_vehicle_cky_office_fk FOREIGN KEY ( office_id )
        REFERENCES cky_office ( office_id );

ALTER TABLE cky_vehicle
    ADD CONSTRAINT cky_vehicle_cky_vclass_fk FOREIGN KEY ( class_id )
        REFERENCES cky_vehicle_class ( class_id );

CREATE OR REPLACE TRIGGER arc_fkarc_8_cky_individual BEFORE
    INSERT OR UPDATE OF c_id, c_type ON cky_individual
    FOR EACH ROW
DECLARE
    d CHAR(1);
BEGIN
    SELECT
        a.c_type
    INTO d
    FROM
        cky_customer a
    WHERE
        a.c_id = :new.c_id
        AND a.c_type = :new.c_type;

    IF ( d IS NULL OR d <> 'I' ) THEN
        raise_application_error(
                               -20223,
                               'FK CKY_INDIVIDUAL_CKY_CUSTOMER_FK in Table CKY_INDIVIDUAL violates Arc constraint on Table CKY_CUSTOMER - discriminator column C_TYPE doesn''t have value ''I'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_fkarc_8_cky_corporate BEFORE
    INSERT OR UPDATE OF c_id, c_type ON cky_corporate
    FOR EACH ROW
DECLARE
    d CHAR(1);
BEGIN
    SELECT
        a.c_type
    INTO d
    FROM
        cky_customer a
    WHERE
        a.c_id = :new.c_id
        AND a.c_type = :new.c_type;

    IF ( d IS NULL OR d <> 'C' ) THEN
        raise_application_error(
                               -20223,
                               'FK CKY_CORPORATE_CKY_CUSTOMER_FK in Table CKY_CORPORATE violates Arc constraint on Table CKY_CUSTOMER - discriminator column C_TYPE doesn''t have value ''C'''
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/



-- Oracle SQL Developer Data Modeler 概要报告: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             2
-- ALTER TABLE                             25
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
