CREATE TABLE  "BILL" 
   (	"ITEM_NAME" VARCHAR2(32), 
	"ITEM_PRICE" NUMBER(16,0), 
	"TIME_ADDED" TIMESTAMP (6)
   )
/
CREATE TABLE  "ITEMS" 
   (	"ITEM_ID" NUMBER(10,0), 
	"ITEM_NAME" VARCHAR2(32), 
	"ITEM_CATAGORY" VARCHAR2(16), 
	"ITEM_PRICE" NUMBER(16,0), 
	 CONSTRAINT "ITEMS_PK" PRIMARY KEY ("ITEM_ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "OLD_ORDERS" 
   (	"ORDER_ID" NUMBER(16,0), 
	"ITEM_NAME" VARCHAR2(16), 
	"QUANTITY" NUMBER(16,0), 
	"TOTAL" NUMBER(16,0)
   )
/
Rem No function found to generate DDL.
CREATE UNIQUE INDEX  "ITEMS_PK" ON  "ITEMS" ("ITEM_ID")
/
Rem No package found to generate DDL.
Rem No procedure found to generate DDL.
 CREATE SEQUENCE   "ITEMS_SEQ_ITEMID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
Rem No synonym found to generate DDL.
CREATE OR REPLACE EDITIONABLE TRIGGER  "BILL_TIME_ADDED_TRIGGER" 
BEFORE INSERT ON bill
FOR EACH ROW
BEGIN
    :NEW.time_added := systimestamp;
END;

/
ALTER TRIGGER  "BILL_TIME_ADDED_TRIGGER" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "BI_ITEMS" 
  before insert on "ITEMS"               
  for each row  
begin   
  if :NEW."ITEM_ID" is null then 
    select "ITEMS_SEQ_ITEMID".nextval into :NEW."ITEM_ID" from sys.dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_ITEMS" ENABLE
/
Rem No view found to generate DDL.
Rem No database link found to generate DDL.
Rem No type found to generate DDL.
Rem No materialized view found to generate DDL.
