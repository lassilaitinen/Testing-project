*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/variables.robot
Resource          ../resources/keywords.robot


*** Test Cases ***
User Can Register To The Application
    [Documentation]    Verify that a user can successfully register to the application.
    [Tags]    smoke
    Open Browser    ${BASE_URL}/register    headlessfirefox       
    Input Registration Details
    Submit Registration Form
    Wait Until Page Does Not Contain    Register    timeout=10s
    Close Browser

User Cannot Register With Short Username
    [Documentation]    Verify that a user cannot register with a username less than 2 characters.
    [Tags]    daily
    Open Browser    ${BASE_URL}/register    headlessfirefox
    Input Invalid Registration Details
    Submit Registration Form
    Wait Until Page Contains   username must be at least 2 characters    timeout=10s
    Close Browser

User Can Login To The Application
    [Documentation]    Verify that a user can successfully login to the application.
    [Tags]    smoke
    Open Browser    ${BASE_URL}/login    headlessfirefox
    Input Login Details
    Submit Login Form
    Wait Until Page Contains    Log out    timeout=30s
    Close Browser

User Can Logout From The Application
    [Documentation]    Verify that a user can successfully logout from the application.
    [Tags]    smoke
    Open Browser    ${BASE_URL}/login    headlessfirefox
    Input Login Details
    Submit Login Form
    Wait Until Page Contains    Log out    timeout=30s
    Press Logout Button
    Wait Until Page Contains    Log in    timeout=30s
    Close Browser

User Can Create Public Post 
    [Documentation]    Verify that a user can successfully create a public post.
    [Tags]    smoke
    Open Browser    ${BASE_URL}/login    headlessfirefox
    Input Login Details
    Submit Login Form
    Wait Until Page Contains    Log out    timeout=30s
    Type Text In Post And Choose Public
    Press Publish Button
    Wait Until Page Contains    This is a public post.    timeout=30s
    Close Browser

User Can Create Private Post
    [Documentation]    Verify that a user can successfully create a private post.
    [Tags]    smoke
    Open Browser    ${BASE_URL}/login    headlessfirefox 
    Input Login Details
    Submit Login Form
    Wait Until Page Contains    Log out    timeout=30s
    Type Text In Post And Choose Private
    Press Publish Button
    Element Should Be Visible    ${PRIVATE_ICON}    timeout=30s
    Close Browser

# kommentti    
User Gets Error When Login With Wrong Credentials
    [Documentation]    Verify that a user can successfully login to the application.
    [Tags]    smoke
    Open Browser    ${BASE_URL}/login    headlessfirefox
    Wrong Input Login Details
    Submit Login Form
    Wait Until Page Contains    Invalid email/password combination
    Close Browser

User Is Able To See Post Made By Another User
    [Documentation]    Verify that a user can see a post made by another user.
    [Tags]    daily
    Open Browser    ${BASE_URL}/login    headlessfirefox
    Input Login Details
    Submit Login Form
    Type Text In Post And Choose Public
    Press Publish Button
    Wait Until Page Contains    This is a public post.    timeout=30s
    Press Logout Button
    Go To    ${BASE_URL}/register
    Input Registration Details For Another User
    Submit Registration Form
    Wait Until Page Does Not Contain    Register    timeout=10s
    Input Login Details For Another User
    Submit Login Form
    Input Text    ${SEARCH_INPUT}    testuser
    Wait Until Element Is Visible    ${DROPDOWN_CONTENT}
    Scroll Element Into View    ${DROPDOWN_CONTENT}
    Click Element    ${DROPDOWN_CONTENT}
    Wait Until Page Contains    This is a public post.    timeout=30s
    Wait Until Page Contains    testuser    timeout=30s
    Close Browser

User Is Able To Comment On Post Made By Another User
    [Documentation]    Verify that a user can comment on a post made by another user.
    [Tags]    daily
    Open Browser    ${BASE_URL}/login    headlessfirefox
    Input Login Details For Another User
    Submit Login Form
    Sleep    3s
    Input Text    ${SEARCH_INPUT}    testuser
    Wait Until Element Is Visible    ${DROPDOWN_CONTENT}
    Scroll Element Into View    ${DROPDOWN_CONTENT}
    Click Element    ${DROPDOWN_CONTENT}
    Wait Until Page Contains    This is a public post.    timeout=30s
    Sleep    3s
    Input Text    ${COMMENT_TEXT}    This is a comment.
    Sleep    3s
    Press Keys    ${COMMENT_TEXT}    ENTER
    Sleep    3s
    Wait Until Page Contains    This is a comment.    timeout=30s
    Close Browser

User Is Able To Comment On Post Made By Themselves
    [Documentation]    Verify that a user can comment on a post made by themselves.
    [Tags]    daily
    Open Browser    ${BASE_URL}/login    headlessfirefox
    Input Login Details
    Submit Login Form
    Type Text In Post And Choose Public
    Press Publish Button
    Wait Until Page Contains    This is a public post.    timeout=30s
    Input Text    ${COMMENT_TEXT}    This is my own comment.
    Press Keys    ${COMMENT_TEXT}    ENTER
    Wait Until Page Contains    This is my own comment.    timeout=30s
    Close Browser

User Is Able To Delete Post Made By Themselves
    [Documentation]    Verify that a user can delete a post made by themselves.
    [Tags]    daily
    Open Browser    ${BASE_URL}/login    headlessfirefox
    Input Login Details
    Submit Login Form
    Type Text In Post And Choose Public
    Press Publish Button
    Wait Until Page Contains    This is a public post.    timeout=30s
    ${count_before}=    Get Element Count    xpath=//div[contains(@class, 'mt-5')]
    Sleep    3s
    Click Element    ${DELETE_BUTTON}
    Sleep    3s
    Handle Alert    ACCEPT
    Sleep    3s
    ${count_after}=    Get Element Count    xpath=//div[contains(@class, 'mt-5')]
    Should Be True    ${count_after} == ${count_before} - 1
    Close Browser