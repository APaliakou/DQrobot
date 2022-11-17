*** Settings ***
Library   OperatingSystem
Library   DatabaseLibrary


*** Settings ***
Documentation   Common Setup and Teardown keywords

Resource  var.robot


*** Variables ***
${DBName}  TRN
${DBUser}  T1000
${DBPass}  admin
${DBHost}  localhost
${DBPort}  1433


*** Keywords ***
Connect to DB
    Connect To Database  pymssql  ${DBName}  ${DBUser}  ${DBPass}  ${DBHost}  ${DBPort}

Disconnect DB
    Disconnect From Database

Check filed hire_date of employees
${outputlog}=  Query    ${Counts_hr.employees}
    Log  ${outputlog}
    Should Be Equal As Strings    ${outputlog}    [(0,)]