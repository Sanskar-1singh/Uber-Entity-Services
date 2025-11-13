
ALTER TABLE driver
     DROP COLUMN driver_approval_status;

ALTER TABLE driver
    ADD driver_approval_status ENUM('APPROVED','DENIED','PENDING') NULL;

ALTER TABLE  driver
    ADD rating DOUBLE;

ALTER TABLE driver
   ADD CONSTRAINT CK_DRIVER_RATING CHECK ( driver.rating>=0 && driver.rating<=5.0);