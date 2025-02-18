*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/variables.robot

*** Keywords ***
Input Registration Details
    [Documentation]    Fill the registration form with valid user details.
    Input Text    ${REGISTRATION_USERNAME}    testuser
    Input Text    ${REGISTRATION_EMAIL}       testuser@example.com
    Input Text    ${REGISTRATION_PASSWORD}    TestPassword123!

Input Invalid Registration Details
    [Documentation]    Fill the registration form with invalid user details.
    Input Text    ${REGISTRATION_USERNAME}    t
    Input Text    ${REGISTRATION_EMAIL}       testuser@example.com
    Input Text    ${REGISTRATION_PASSWORD}    TestPassword123!

Input Registration Details For Another User
    [Documentation]    Fill the registration form with valid user details.
    Input Text    ${REGISTRATION_USERNAME}    aaa
    Input Text    ${REGISTRATION_EMAIL}       aaa@example.com
    Input Text    ${REGISTRATION_PASSWORD}    TestPassword123!

Input Login Details
    [Documentation]    Fill the login form with valid user details.
    Input Text    ${LOGIN_EMAIL}    testuser@example.com
    Input Text    ${LOGIN_PASSWORD}    TestPassword123!

Input Login Details For Another User
    [Documentation]    Fill the login form with valid user details.
    Input Text    ${LOGIN_EMAIL}    aaa@example.com
    Input Text    ${LOGIN_PASSWORD}    TestPassword123!

Wrong Input Login Details
    [Documentation]    Fill the login form with valid user details.
    Input Text    ${LOGIN_EMAIL}    testuser
    Input Text    ${LOGIN_PASSWORD}    TestPassword123!
Submit Registration Form
    [Documentation]    Submit the registration form.
    Click Button    ${REGISTER_BUTTON}

Submit Login Form
    [Documentation]    Submit the login form.
    Click Button    ${LOGIN_BUTTON}

Press Logout Button
    [Documentation]    Press the logout button.
    Click Button    ${LOGOUT_BUTTON}

Press Publish Button
    [Documentation]    Press the publish button.
    Click Button    ${PUBLISH_BUTTON}
Type Text In Post And Choose Public
    [Documentation]    Type text in the post.
    Wait Until Element Is Visible    ${POST_TEXT}    timeout=30s
    Input Text    ${POST_TEXT}    This is a public post.
    Select From List By Label    xpath=//select[@name='privacy']    public

Type Text In Post And Choose Private
    [Documentation]    Type text in the post.
    Wait Until Element Is Visible    ${POST_TEXT}    timeout=30s
    Input Text    ${POST_TEXT}    This is a private post.
    Select From List By Label    xpath=//select[@name='privacy']    friends