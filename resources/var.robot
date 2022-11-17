*** Settings ***
Documentation   Robot resources and variables for all tests

Library   String
Library   OperatingSystem
Library   DateTime
Library   Collections



Resource  ./Core.robot

*** Variables ***
${DQ}  count(*)
${Counts_hr.employees}  select count(*) from hr.employees where hire_date is null
${AVG_Salary}  SELECT avg(salary) FROM [TRN].[hr].[employees]
${Min_Min_Sal}  SELECT min(min_salary) FROM [TRN].[hr].[jobs]
${Max_Min_Sal}  SELECT max(min_salary) FROM [TRN].[hr].[jobs]
${Max_len_Loc}  SELECT max(len(street_address)) FROM TRN.hr.locations
${Correct_Region}  SELECT count(*) FROM TRN.hr.locations where country_id not in (select country_id from hr.regions)
${DBName}  TRN
${DBUser}  T1000
${DBPass}  admin
${DBHost}  localhost
${DBPort}  1433