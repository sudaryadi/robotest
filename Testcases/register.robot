*** settings ***
Library    SeleniumLibrary

*** variables ***
${URL}        https://parabank.parasoft.com/
${BROWSER}    chrome

*** test cases ***
TC#1_Register new account
    Open Browser    ${URL} ${BROWSER}