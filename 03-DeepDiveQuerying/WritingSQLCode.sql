use AdventureWorks2012
GO

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