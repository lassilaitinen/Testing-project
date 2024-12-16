*** Settings ***
Library    Browser

*** Variables ***
${URL} =    http://localhost

*** Keywords ***
Open Browser To Login Page
    New Browser    #headless=${FALSE}
    New Page    ${URL}/login

Enter Email Address
    [Arguments]    ${EMAIL}
    Fill Text    xpath=//input[@name="loginEmail"]    ${EMAIL}

Enter Password
    [Arguments]    ${PASSWORD}
    Fill Text    xpath=//input[@name="loginPassword"]    ${PASSWORD}

Submit Login Form
    Sleep    2s
    Click    //button[contains(text(), "Login")]