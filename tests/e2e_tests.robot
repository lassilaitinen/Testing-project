*** Settings ***
Library    Browser
Resource    common.resource

*** Variables ***
${URL} =    http://localhost
${EMAIL} =    user@example.com
${PASSWORD} =    string123
${FRIENDS_BUTTON} =    xpath=/html/body/div/div[1]/div[2]/div/button[1]

*** Keywords ***
Open Registaration Page
    Open Browser To Login Page
    Click   //button[contains(text(), "Sign up")]
    Get Url    ==    ${URL}/register

Fill Registaration Form
    [Arguments]    ${email}    ${psw}    ${name}
    Fill Text    xpath=//input[@name="email"]    ${email}
    Fill Text    xpath=//input[@name="username"]    ${name}
    Fill Text    xpath=//input[@name="password"]    ${psw}
    Click   //button[contains(text(), "Register")]

Do Successful Login
    [Arguments]    ${email}    ${psw}
    Enter Email Address    ${email}
    Enter Password    ${psw}
    Submit Login Form
    Sleep    2s
    Get Url    ==    ${URL}/profile

Do Successful Logout
    Click    //button[contains(text(), "Log out")]

Write And Send A Comment To Post
    [Arguments]    ${comment}    ${comment_input}
    Fill Text    ${comment_input}    ${comment}
    Press Keys    ${comment_input}    Enter

Write And Publish A Post
    [Arguments]    ${visibility}    ${post_text}
    Fill Text    xpath=//textarea[@name="content"]    ${post_text}
    Select Options By     xpath=//select[@name="privacy"]    value    ${visibility}
    Click    //button[contains(text(), "Publish")]


*** Test Cases ***
Register Default User
    Open Registaration Page
    Fill Registaration Form    ${EMAIL}    ${PASSWORD}    user
    Open Browser To Login Page
    Do Successful Login    ${EMAIL}    ${PASSWORD}
    #Get Url    ==    ${URL}/profile

Profile Front Page Should Be Visible After Successful Login
    Open Browser To Login Page
    Do Successful Login    ${EMAIL}    ${PASSWORD}
    #The following checks that chat is availabel; a feature that doesn't exist in the login page or in any other page
    Get Text    body    contains    Chat
    Get Url    ==    ${URL}/profile

Error Message Should Be Visible After Login With Wrong Password
    Open Browser To Login Page
    Enter Email Address    ${EMAIL}
    Fill Text    xpath=//input[@name="loginPassword"]    stringi
    Submit Login Form
    Get Text    body    contains    Invalid email/password combination
    Get Url    ==    ${URL}/login

Error Message Should Be Visible After Login With Wrong Email
    Open Browser To Login Page
    Fill Text    xpath=//input[@name="loginEmail"]    user2@example.com
    Enter Password    ${PASSWORD}
    Submit Login Form
    Get Text    body    contains    Invalid email/password combination
    Get Url    ==    ${URL}/login

Do Successful Registaration And Successfully Log In
    Open Registaration Page
    Fill Registaration Form    robot@example.com    ${PASSWORD}   robot
    Open Browser To Login Page
    Enter Email Address    robot@example.com
    Enter Password    string123
    #Fill Text    xpath=//input[@name="loginPassword"]    string123
    Submit Login Form
    #The following checks that chat is availabel; a feature that doesn't exist in the login page or in any other page
    Get Text    body    contains    Chat
    Get Url    ==    ${URL}/profile

Login Page Should Be Visible After Successful Logout
    Open Browser To Login Page
    Do Successful Login    ${EMAIL}    ${PASSWORD}
    #The following checks that chat is availabel; a feature that doesn't exist in the login page or in any other page
    Get Text    body    contains    Chat
    Get Url    ==    ${URL}/profile
    Do Successful Logout
    Get Text    body    contains    Don't have an account?

Publish A Public Post
    Open Browser To Login Page
    Do Successful Login    ${EMAIL}    ${PASSWORD}
    Write And Publish A Post    PUBLIC    This is a public post.
    Get Text    xpath=//div[@class="column is-half"]    contains    This is a public post.
    Do Successful Logout
    Open Browser To Login Page
    Do Successful Login    robot@example.com    ${PASSWORD}
    Fill Text    xpath=//input[@type="search"]    user
    Click    xpath=/html/body/div/div[1]/div[1]/div/div[2]/div/a
    ${friend_user}    Get Text    xpath=/html/body/div/div[2]/div[2]/div[1]/div/div/p
    Click    xpath=/html/body/div/div[2]/div[2]/div[1]/div/div/p
    ${friend_latest_post}    Get Element    xpath=/html/body/div/div[2]/div[2]/div[3]/div
    Get Text    ${friend_latest_post}    contains    ${friend_user}
    Get Text    ${friend_latest_post}    contains    This is a public post.

Delete Your Own Public Post
    Open Browser To Login Page
    Do Successful Login    ${EMAIL}    ${PASSWORD}
    Write And Publish A Post    PUBLIC    This is a public post to be deleted.
    Get Text    xpath=//div[@class="column is-half"]    contains    This is a public post to be deleted.
    ${promise} =    Promise To    Wait For Alert    action=accept
    Sleep    2s
    Click    xpath=/html/body/div/div[2]/div[2]/div[2]/div/div[1]/div[1]/div[2]/div/button
    Wait For    ${promise}
    Sleep    2s
    ${page_text}=    Get Text    xpath=/html/body/div/div[2]/div[2]/div[2]
    Should Not Contain    ${page_text}    This is a public post to be deleted.

Publish A Post Only Friends To See
    Open Browser To Login Page
    Do Successful Login    ${EMAIL}    ${PASSWORD}
    Write And Publish A Post    FRIENDS    This is for friends only.
    ${latest_post}    Get Element    xpath=/html/body/div/div[2]/div[2]/div[3]/div
    Get Text    ${latest_post}    contains    This is for friends only.
    Do Successful Logout
    Open Browser To Login Page
    Do Successful Login    robotti@example.com    ${PASSWORD}
    Fill Text    xpath=//input[@type="search"]    user
    Click    xpath=/html/body/div/div[1]/div[1]/div/div[2]/div/a
    ${page_text}=    Get Text    xpath=//div[@class="column is-half"]
    Should Not Contain    ${page_text}    This is for friends only.

View Public Post Made By Another User
    Open Browser To Login Page
    Do Successful Login    robot@example.com    ${PASSWORD}
    Fill Text    xpath=//input[@type="search"]    user
    Click    xpath=/html/body/div/div[1]/div[1]/div/div[2]/div/a
    ${friend_latest_post}    Get Element    xpath=/html/body/div/div[2]/div[2]/div[3]/div
    Get Text    ${friend_latest_post}    contains    user
    Get Text    ${friend_latest_post}    contains    This is a public post.

Comment A Post Made By Other User
    Open Browser To Login Page
    Do Successful Login    robot@example.com    ${PASSWORD}
    Fill Text    xpath=//input[@type="search"]    user
    Click    xpath=/html/body/div/div[1]/div[1]/div/div[2]/div/a
    ${friend_latest_post}    Get Element     xpath=//div[@class="mt-5"] >> nth=0
    Get Text    ${friend_latest_post}    contains    user
    Get Text    ${friend_latest_post}    contains    This is a public post.
    ${friend_latest_post_comment_input}    Get Element    xpath=//input[@class="jsx-2270411553 input ml-2"] >> nth=0
    Write And Send A Comment To Post    This is a comment.    ${friend_latest_post_comment_input}
    Get Text    ${friend_latest_post}    contains    This is a comment.
    
Comment Your Own Post
    Open Browser To Login Page
    Do Successful Login    ${EMAIL}    ${PASSWORD}
    ${latest_post}    Get Element    xpath=//div[@class="mt-5"] >> nth=0
    ${latest_post_comment_input}    Get Element    xpath=//input[@class="jsx-2270411553 input ml-2"] >> nth=0
    Write And Send A Comment To Post    This is a comment to my own post.    ${latest_post_comment_input}
    Get Text    ${latest_post}    contains    This is a comment to my own post.