use AdventureWorks2012
GO
--------------------------------------- WRITING SQL CODE SECTION ---------------------------------------------------

--------- SELECTING ----------
SELECT * FROM HumanResources.Department

-- SHOW ME ALL THE DEPARTMENT NAMES
SELECT Name FROM HumanResources.Department

-- SHOW ME ALL THE GROUPS
SELECT GroupName FROM HumanResources.Department

-- SHOW ME ALL THE DISTINCT GROUPNAME
SELECT DISTINCT GroupName FROM HumanResources.Department

--------- FILTERING -----------
-- SHOW ME ALL THE DEPARTMENT NAMES WHO ARE A PART OF MANUFACTURING
SELECT Name, GroupName FROM HumanResources.Department
WHERE GroupName LIKE 'Manufacturing'

-- GIVE ME ALL THE EMPLOYEES FROM THE EMPLOYEE TABLE
SELECT * FROM HumanResources.Employee

-- GIVE ME A LIST OF ALL EMPLOYEES WHO HAVE ORGLEVEL = 2
SELECT * FROM HumanResources.Employee 
WHERE OrganizationLevel = 2

-- GIVE ME A LIST OF ALL EMPLOYEES WHO HAVE ORGLEVEL = 2 or 3
SELECT * FROM HumanResources.Employee
WHERE OrganizationLevel IN (2,3)

-- GIVE ME A LIST OF EMPLOYEES WHO HAVEA TITLE AS FACILITIES MANAGER
SELECT * FROM HumanResources.Employee
WHERE JobTitle LIKE 'Facilities Manager'

-- GIVE ME ALL EMPLOYEES WHO HAVE A TITLE THAT CONTAINS THE WORD "MANAGER"
-- use % wildcard: allows text to be found in the query when using pattern matching depending on where you place the symbol
SELECT * FROM HumanResources.Employee
WHERE JobTitle LIKE '%Manager' -- returns job titles such as "Engineering Manager"; other words are only allowed to preceed Manager

SELECT * FROM HumanResources.Employee
WHERE JobTitle LIKE '%Control%'  -- returns job titles such as "Production Control Manager" and "Document Control Manager"; other words are allowed to preceed and follow Control

-- GIVE ME ALL EMPLOYEES BORN AFTER JAN. 1, 1980
SELECT * FROM HumanResources.Employee
WHERE BirthDate > '1/1/1980'

-- GIVE ME ALL EMPLOYEES BORN BETWEEN JAN 1, 1970 AND JAN 1, 1980
SELECT * FROM HumanResources.Employee
WHERE BirthDate > '1/1/1970' AND BirthDate < '1/1/1980'
		---	 or ---
SELECT * FROM HumanResources.Employee
WHERE BirthDate BETWEEN '1/1/1970' AND '1/1/1980'

--------------------------------------- DEEP DIVE QUERYING SECTION ---------------------------------------------------
-- CALCULATED COLUMNS
SELECT NAME, ListPrice FROM Production.Product

SELECT NAME, ListPrice, ListPrice + 10 AS ADJUSTED_LIST_PRICE FROM Production.Product  -- Create an alias for our user-defined column

-- CREATE ANOTHER TABLE
-- INTO CLAUSE (inserts an executed query such as the one directly above into a table)
SELECT NAME, ListPrice, ListPrice + 10 AS ADJUSTED_LIST_PRICE INTO Production.Product_2 FROM Production.Product
SELECT * FROM Production.Product_2

-- CREATE A TEMPORARY TABLE
-- TEMP TABLE NAME IS ONLY AVAILABLE IN THE SESSION WINDOW IT WAS CREATED IN FOR AS LONG AS THE WINDOW IS OPEN
SELECT NAME, LISTPRICE, LISTPRICE + 10 AS ADJUSTED_LIST_PRICE INTO #tempname FROM Production.Product
SELECT * FROM #tempname


-- DELETE DATA FROM TABLE
DELETE FROM Production.Product_2
WHERE NAME LIKE 'Bearing Ball'

SELECT * FROM Production.Product_2

-- UPDATE DATA IN TABLE
UPDATE Production.Product_2
SET NAME= 'BLADE_NEW'
WHERE NAME LIKE 'BLADE'

SELECT * FROM Production.Product_2
