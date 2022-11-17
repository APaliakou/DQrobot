*** Settings ***
Library   OperatingSystem
Library   DatabaseLibrary
Suite Teardown  Disconnect From Database

Resource   ../resources/variables.robot

Resource   ../resources/Core.robot


*** Test Cases ***
Verify that hire_date of employees is filled
    [Tags]  Task_1_Employee_hire_date
    [Documentation]
    ...  | *Setup:*
    ...  | 0. Establish connection to db
    ...  | 1. Execute necessary DQ check
    ...  |
    ...  | *Teste Steps:*
    ...  | 2.Query DQ check for table
    Connect to DB
    ${outputlog}=  Query    ${Counts_hr.employees}
    Log  ${outputlog}
    Should Be Equal As Strings    ${outputlog}    [(0,)]

Check AVG salary from for all Emplyees
    [Tags]  Task_1_Employee_AVG_salary
    [Documentation]
    ...  | *Setup:*
    ...  | 0. Establish connection to db
    ...  | 1. Execute necessary DQ check
    ...  |
    ...  | *Teste Steps:*
    ...  | 2.Query DQ check for table
    ${outputlog}=  Query    ${AVG_Salary}
    Log  ${outputlog}
    Should Be Equal As Strings    ${outputlog}    [(Decimal('8060.000000'),)]

Check Min Min_salary for all jobs
    [Tags]  Task_1_Min_Min_salary
    [Documentation]
    ...  | *Setup:*
    ...  | 0. Establish connection to db
    ...  | 1. Execute necessary DQ check
    ...  |
    ...  | *Teste Steps:*
    ...  | 2.Query DQ check for table
    ${outputlog}=  Query    ${Min_Min_Sal}
    Log  ${outputlog}
    Should Be Equal As Strings    ${outputlog}    [(Decimal('2000.00'),)]

Check Max Min_salary for all jobs
    [Tags]  Task_1_Min_Min_salary
    [Documentation]
    ...  | *Setup:*
    ...  | 0. Establish connection to db
    ...  | 1. Execute necessary DQ check
    ...  |
    ...  | *Teste Steps:*
    ...  | 2.Query DQ check for table
    ${outputlog}=  Query    ${Max_Min_Sal}
    Log  ${outputlog}
    Should Be Equal As Strings    ${outputlog}    [(Decimal('20000.00'),)]

Check Max len of street adress
    [Tags]  Task_1_Max_len_locations
    [Documentation]
    ...  | *Setup:*
    ...  | 0. Establish connection to db
    ...  | 1. Execute necessary DQ check
    ...  |
    ...  | *Teste Steps:*
    ...  | 2.Query DQ check for table
    ${outputlog}=  Query    ${Max_len_Loc}
    Log  ${outputlog}
    Should Be Equal As Strings    ${outputlog}    [(40,)]

Check Check that all regions exists
    [Tags]  Task_1_Max_len_locations
    [Documentation]
    ...  | *Setup:*
    ...  | 0. Establish connection to db
    ...  | 1. Execute necessary DQ check
    ...  |
    ...  | *Teste Steps:*
    ...  | 2.Query DQ check for table
    ${outputlog}=  Query    ${Correct_Region}
    Log  ${outputlog}
    Should Be Equal As Strings    ${outputlog}    [(0,)]





*** Keywords ***
Connect to DB
    Connect To Database  pymssql  ${DBName}  ${DBUser}  ${DBPass}  ${DBHost}  ${DBPort}

Disconnect DB
    Disconnect From Database