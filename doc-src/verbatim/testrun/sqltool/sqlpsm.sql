/*
 * $Id: sqlpsm.sql 826 2009-01-17 05:04:52Z unsaved $
 *
 * Tests SQL/JRT
 */

create table customers(
    id INTEGER default 0, firstname VARCHAR(50), lastname VARCHAR(50),
    entrytime TIMESTAMP);

create procedure new_customer(firstname varchar(50), lastname varchar(50))
    modifies sql data
    insert into customers values (
        default, firstname, lastname, current_timestamp)
.;

SELECT count(*) FROM customers;
*if (*? != 0)
    \q SQL/PSM preparation failed
*end if

CALL new_customer('blaine', 'simpson');

SELECT count(*) FROM customers;
*if (*? != 1)
    \q SQL/PSM procedure failed
*end if
