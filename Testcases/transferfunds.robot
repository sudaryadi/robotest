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
${transfer}       transfer.htm
${amount}         id=amount
${from_acc}       id=fromAccountId
${to_acc}         id=toAccountId
${transfer_btn}   xpath=/html/body/div[1]/div[3]/div[2]/div/div[1]/form/div[2]/input
${complete}       xpath=/html/body/div[1]/div[3]/div[2]/div/div[2]/h1

*** Test Cases ***
TC#4_Transfer funds between two accounts
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
    Sleep    2s

    # Transfer funds to another account #
    Click Link    ${transfer}
    Sleep    2s
    Input Text    ${amount}    1000
    Select From List By Value    ${from_acc}    14565
    Select From List By Value    ${to_acc}      14787
    Click Button    ${transfer_btn}
    # Verify success transfer #
    Element Text Should Be    ${complete}    Transfer Complete!