*** Settings ***
Library    OperatingSystem
Library    SeleniumLibrary
Library    SSHLibrary
Library    Collections

#Suite Setup       Open My Browser    ${URL}   @{CREDIENTIALS}[2]       ${remoteMachineIp}
Suite Teardown    Close Browser
*** Variables ***
#SCALAR variables
${testsRootFolder}    ${EXECDIR}/test/drivers/
${URL}    https://opensource-demo.orangehrmlive.com    
#LIST variables
@{CREDIENTIALS}    Admin    admin123    chrome
#DICTIONARY variables
&{LOGINDATA}     username=Admin    password=admin123
#ENVIRONMENT variables %{username}
#BUILT_IN variables ${EXEDIR}

*** Keywords ***

LoginKW
     Input Text    id=txtUsername    @{CREDIENTIALS}[0]
     Input Text    id=txtPassword    &{LOGINDATA}[password]
     Click Button       id=btnLogin 
LogoutKW
     Click Element    id=welcome
     Click Element    link=Logout 
*** Test Cases ***
    
SampleLoginTest
    [Documentation]    Sample Login test
     Append To Environment Variable  PATH    ${testsRootFolder}
     Open Browser     ${URL}    @{CREDIENTIALS}[2]
     Set Browser Implicit Wait    5
     LoginKW    
     LogoutKW  
     Sleep    5
     CLose Browser
    
