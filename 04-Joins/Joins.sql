use AdventureWorks2012
go

-------------------------- JOINS -------------------------------------
-- CREATE MYEMPLOYEES TABLE 
CREATE TABLE MYEMPLOYEES (EMPLOYEEID INT, FIRSTNAME VARCHAR(20), LASTNAME VARCHAR(20))

INSERT INTO MYEMPLOYEES VALUES (1, 'Michael', 'Scott')
INSERT INTO MYEMPLOYEES VALUES (2, 'Pam', 'Beasly')
INSERT INTO MYEMPLOYEES VALUES (3, 'Dwight', 'Shrute')

-- CREATE MYSALARIES TABLE
CREATE TABLE MYSALARIES (EMPLOYEEID INT, SALARY FLOAT)
INSERT INTO MYSALARIES VALUES (1, 10000)
INSERT INTO MYSALARIES VALUES (2, 8000)
INSERT INTO MYSALARIES VALUES (3, 6500)

SELECT * FROM MYEMPLOYEES
SELECT * FROM MYSALARIES

-- INNER JOIN w/EMPLOYEEID
SELECT A.FIRSTNAME, A.LASTNAME, B.SALARY 
FROM MYEMPLOYEES A INNER JOIN MYSALARIES B 
ON A.EMPLOYEEID = B.EMPLOYEEID

-- LEFT OUTER JOIN EXAMPLE
CREATE TABLE MYPHONE (EMPLOYEEID INT, PHONENUMBER NVARCHAR(25))

INSERT INTO MYPHONE VALUES (1, 5551234567)
INSERT INTO MYPHONE VALUES (2, 5559873452)

SELECT * FROM MYEMPLOYEES
SELECT * FROM MYPHONE

-- LEFT OUTER JOIN QUERY
SELECT A.FIRSTNAME, A.LASTNAME, B.PHONENUMBER 
FROM MYEMPLOYEES A LEFT JOIN MYPHONE B 
ON A.EMPLOYEEID = B.EMPLOYEEID

-- RIGHT OUTER JOIN EXAMPLE
CREATE TABLE MYPARKING(EMPLOYEEID INT, PARKINGSPOT VARCHAR(20))

INSERT INTO MYPARKING VALUES(1, 'A1')
INSERT INTO MYPARKING VALUES(2, 'A2')

SELECT * FROM MYPARKING
SELECT * FROM MYEMPLOYEES

-- RIGHT OUTER JOIN QUERY
SELECT A.PARKINGSPOT, B.FIRSTNAME, B.LASTNAME 
FROM MYPARKING A RIGHT JOIN MYEMPLOYEES B 
ON A.EMPLOYEEID = B.EMPLOYEEID


-- FULL OUTER JOIN EXAMPLE
CREATE TABLE MYCUSTOMER (CUSTOMERID INT, CUSTOMERNAME VARCHAR(20))

TRUNCATE TABLE MYCUSTOMER
INSERT INTO MYCUSTOMER VALUES (1, 'Randy')
INSERT INTO MYCUSTOMER VALUES (3, 'John')

CREATE TABLE MYORDER (ORDERNUMBER INT, ORDERNAME VARCHAR(20), CUSTOMERID INT)

INSERT INTO MYORDER VALUES (1, 'SOMEOERDER1', 1)
INSERT INTO MYORDER VALUES (2, 'SOMEOERDER2', 2)
INSERT INTO MYORDER VALUES (3, 'SOMEOERDER3', 7)
INSERT INTO MYORDER VALUES (4, 'SOMEOERDER4', 8)

SELECT * FROM MYCUSTOMER
SELECT * FROM MYORDER

-- FULL OUTER JOIN QUERY
SELECT A.CUSTOMERID, A.CUSTOMERNAME, B.ORDERNUMBER, B.ORDERNAME 
FROM MYCUSTOMER A FULL OUTER JOIN MYORDER B 
ON A.CUSTOMERID = B.CUSTOMERID


-- CROSS JOIN EXAMPLE/QUERY (BYPASSED MAKING ANOTHER SET OF TABLES AS IN PREVIOUS EXAMPLES AND USED EXISTING ONES)
SELECT * FROM MYCUSTOMER
SELECT * FROM MYSALARIES

--SELECT * FROM MYCUSTOMER CROSS JOIN MYSALARIES
-- ANOTHER WAY TO WRITE THE QUERY ABOVE
SELECT * FROM MYCUSTOMER, MYSALARIES