*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            https://parabank.parasoft.com/
${BROWSER}        chrome
${username}       name=username
${password}       name=password
${login_btn}      xpath=/html/body/div[1]/div[3]/div[1]/div/form/div[3]/input
${customer_txt}   xpath=/html/body/div[1]/div[3]/div[1]/h2
${acc_overview}   xpath=/html/body/div[1]/div[3]/div[2]/div/div[1]/h1
${open_account}   openaccount.htm
${acc_drop}       id=type
${deposit}        id=fromAccountId
${open_btn}       xpath=/html/body/div[1]/div[3]/div[2]/div/div[1]/form/div/input
${open_success}   xpath=/html/body/div[1]/div[3]/div[2]/div/div[2]/p[1]


*** Test Cases ***
TC#3_Open New Account
    # Run the browser to open URL #
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    # Verify if users are on the login page #
    Element Text Should Be    ${customer_txt}    Customer Login
    
    # Users input valid credential #
    Input Text    ${username}    siva.aurum
    Input Text    ${password}    Siva123_
    Click Button  ${login_btn}
    Sleep    3s

    # Verify if user in account overview #
    Element Text Should Be    ${acc_overview}    Accounts Overview

    # Open Account Overview menu #
    Click Link    ${open_account}
    Sleep    3s

    # Select account type #
    Select From List By Value    ${acc_drop}    1
    Select From List By Value    ${deposit}    14121
    Click Button    ${open_btn}
    Sleep    3s

    # Verify if open new account is success #
    Element Text Should Be    ${open_success}    Congratulations, your account is now open.

    Close Browser