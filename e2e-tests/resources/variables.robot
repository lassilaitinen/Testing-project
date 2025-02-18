*** Variables ***
${BROWSER}       headless
${BASE_URL}       http://localhost
${REGISTRATION_USERNAME}    xpath=/html/body/div/div[2]/div/div/form/fieldset/div[2]/div/input
${REGISTRATION_EMAIL}       xpath=/html/body/div/div[2]/div/div/form/fieldset/div[1]/div/input
${REGISTRATION_PASSWORD}    xpath=/html/body/div/div[2]/div/div/form/fieldset/div[3]/div/input
${REGISTER_BUTTON}          xpath=/html/body/div/div[2]/div/div/form/button[1]
${LOGIN_EMAIL}              xpath=/html/body/div/div[2]/div/div/form/fieldset/div[1]/div/input
${LOGIN_PASSWORD}           xpath=/html/body/div/div[2]/div/div/form/fieldset/div[2]/div/input
${LOGIN_BUTTON}             xpath=/html/body/div/div[2]/div/div/form/button[1]
${LOGOUT_BUTTON}            xpath=/html/body/div/div[1]/div[2]/div/button[3]
${POST_TEXT}                xpath=//textarea[@class='jsx-1336507874 textarea']
${PUBLISH_BUTTON}           xpath=/html/body/div/div[2]/div[2]/div/div[2]/form/div/button
${PRIVATE_ICON}             xpath=//i[@class='jsx-2270411553 fas mr-1 fa-user-friends']
${SEARCH_INPUT}             xpath=//input[@class='input' and @type='search' and @placeholder='Search bunnies...']
${DROPDOWN_CONTENT}         xpath=//div[@class='dropdown-content pt-0 pb-0']
${COMMENT_TEXT}             xpath=//input[@class='jsx-2270411553 input ml-2']
${DELETE_BUTTON}            xpath=//button[@class='jsx-2270411553 delete']