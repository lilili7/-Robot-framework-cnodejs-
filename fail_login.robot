*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page 
Test Template     Login With Invalid Credentials Should Fail
#导入源文件
Resource          resource1.robot

*** Test Cases ***               USER NAME        PASSWORD              
Invalid Username                 123              ${VALID PASSWORD}         
Invalid Password                 ${VALID USER}    123                   

Empty Username                   ${EMPTY}         ${VALID PASSWORD}     
Empty Password                   ${VALID USER}    ${EMPTY}                
Empty Information                ${EMPTY}         ${EMPTY}              

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}   
    Input Username    ${username}
    Input Password    ${password}   
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    CNode：Node.js专业中文社区