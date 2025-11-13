CREATE TABLE booking_review
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    content    VARCHAR(255)          NOT NULL,
    rating     DOUBLE                NOT NULL,
    booking_id BIGINT                NOT NULL,
    CONSTRAINT pk_booking_review PRIMARY KEY (id)
);

CREATE TABLE bookings
(
    id             BIGINT AUTO_INCREMENT NOT NULL,
    created_at     datetime              NOT NULL,
    updated_at     datetime              NOT NULL,
    booking_status ENUM('SCHEDULE','PENDING')  NULL,
    start_time     datetime              NULL,
    end_time       datetime              NULL,
    total_distance BIGINT                NULL,
    driver_id      BIGINT                NULL,
    passenger_id   BIGINT                NULL,
    CONSTRAINT pk_bookings PRIMARY KEY (id)
);

CREATE TABLE car
(
    id           BIGINT AUTO_INCREMENT NOT NULL,
    created_at   datetime              NOT NULL,
    updated_at   datetime              NOT NULL,
    plate_number VARCHAR(255)          NOT NULL,
    brand        VARCHAR(255)          NULL,
    model        VARCHAR(255)          NULL,
    cartype      ENUM('XL','HATCHBACK','COMPACT_SUV') NULL,
    driver_id    BIGINT                NULL,
    color_id     BIGINT                NULL,
    CONSTRAINT pk_car PRIMARY KEY (id)
);

CREATE TABLE color
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    name       VARCHAR(255)          NOT NULL,
    CONSTRAINT pk_color PRIMARY KEY (id)
);

CREATE TABLE db_constants
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    name       VARCHAR(255)          NOT NULL,
    value      VARCHAR(255)          NULL,
    CONSTRAINT pk_dbconstants PRIMARY KEY (id)
);

CREATE TABLE driver
(
    id                     BIGINT AUTO_INCREMENT NOT NULL,
    created_at             datetime              NOT NULL,
    updated_at             datetime              NOT NULL,
    name                   VARCHAR(255)          NULL,
    licencenumber          VARCHAR(255)          NOT NULL,
    phone_number           VARCHAR(255)          NULL,
    aadhar_number          VARCHAR(255)          NULL,
    address                VARCHAR(255)          NULL,
    aadhar_card            VARCHAR(255)          NULL,
    driver_approval_status VARCHAR(255)          NULL,
    exact_locations_id     BIGINT                NULL,
    home_id                BIGINT                NULL,
    active_city            VARCHAR(255)          NULL,
    CONSTRAINT pk_driver PRIMARY KEY (id)
);

CREATE TABLE driver_review
(
    id                    BIGINT       NOT NULL,
    driver_review_content VARCHAR(255) NULL,
    CONSTRAINT pk_driverreview PRIMARY KEY (id)
);

CREATE TABLE exact_locations
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NOT NULL,
    updated_at datetime              NOT NULL,
    latitude   DOUBLE                NULL,
    longitude  DOUBLE                NULL,
    CONSTRAINT pk_exactlocations PRIMARY KEY (id)
);

CREATE TABLE named_locations
(
    id                 BIGINT AUTO_INCREMENT NOT NULL,
    created_at         datetime              NOT NULL,
    updated_at         datetime              NOT NULL,
    exact_locations_id BIGINT                NULL,
    name               VARCHAR(255)          NULL,
    zip_code           VARCHAR(255)          NULL,
    city               VARCHAR(255)          NULL,
    country            VARCHAR(255)          NULL,
    state              VARCHAR(255)          NULL,
    CONSTRAINT pk_namedlocations PRIMARY KEY (id)
);

CREATE TABLE otp
(
    id             BIGINT AUTO_INCREMENT NOT NULL,
    created_at     datetime              NOT NULL,
    updated_at     datetime              NOT NULL,
    code           VARCHAR(255)          NULL,
    sent_to_number VARCHAR(255)          NULL,
    CONSTRAINT pk_otp PRIMARY KEY (id)
);

CREATE TABLE passenger
(
    id           BIGINT AUTO_INCREMENT NOT NULL,
    created_at   datetime              NOT NULL,
    updated_at   datetime              NOT NULL,
    name         VARCHAR(255)          NOT NULL,
    phone_number VARCHAR(255)          NOT NULL,
    email        VARCHAR(255)          NOT NULL,
    password     VARCHAR(255)          NOT NULL,
    CONSTRAINT pk_passenger PRIMARY KEY (id)
);

CREATE TABLE passenger_review
(
    driver_review_id         BIGINT       NOT NULL,
    passenger_review_content VARCHAR(255) NOT NULL,
    passenger_rating         VARCHAR(255) NULL,
    CONSTRAINT pk_passengerreview PRIMARY KEY (driver_review_id)
);

ALTER TABLE booking_review
    ADD CONSTRAINT uc_booking_review_booking UNIQUE (booking_id);

ALTER TABLE car
    ADD CONSTRAINT uc_car_platenumber UNIQUE (plate_number);

ALTER TABLE color
    ADD CONSTRAINT uc_color_name UNIQUE (name);

ALTER TABLE db_constants
    ADD CONSTRAINT uc_dbconstants_name UNIQUE (name);

ALTER TABLE driver
    ADD CONSTRAINT uc_driver_licencenumber UNIQUE (licencenumber);

ALTER TABLE bookings
    ADD CONSTRAINT FK_BOOKINGS_ON_DRIVER FOREIGN KEY (driver_id) REFERENCES driver (id);

ALTER TABLE bookings
    ADD CONSTRAINT FK_BOOKINGS_ON_PASSENGER FOREIGN KEY (passenger_id) REFERENCES passenger (id);

ALTER TABLE booking_review
    ADD CONSTRAINT FK_BOOKING_REVIEW_ON_BOOKING FOREIGN KEY (booking_id) REFERENCES bookings (id);

ALTER TABLE car
    ADD CONSTRAINT FK_CAR_ON_COLOR FOREIGN KEY (color_id) REFERENCES color (id);

ALTER TABLE car
    ADD CONSTRAINT FK_CAR_ON_DRIVER FOREIGN KEY (driver_id) REFERENCES driver (id);

ALTER TABLE driver_review
    ADD CONSTRAINT FK_DRIVERREVIEW_ON_ID FOREIGN KEY (id) REFERENCES booking_review (id);

ALTER TABLE driver
    ADD CONSTRAINT FK_DRIVER_ON_EXACTLOCATIONS FOREIGN KEY (exact_locations_id) REFERENCES exact_locations (id);

ALTER TABLE driver
    ADD CONSTRAINT FK_DRIVER_ON_HOME FOREIGN KEY (home_id) REFERENCES exact_locations (id);

ALTER TABLE named_locations
    ADD CONSTRAINT FK_NAMEDLOCATIONS_ON_EXACTLOCATIONS FOREIGN KEY (exact_locations_id) REFERENCES exact_locations (id);

ALTER TABLE passenger_review
    ADD CONSTRAINT FK_PASSENGERREVIEW_ON_DRIVER_REVIEW FOREIGN KEY (driver_review_id) REFERENCES booking_review (id);