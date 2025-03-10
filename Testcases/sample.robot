*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${URL}       https://parabank.parasoft.com/
${BROWSER}   chrome

*** Test Cases ***
Login to ParaBank
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --start-maximized
    Create WebDriver    Chrome    options=${options}

    Go To    ${URL}
    Input Text    name=username    testuser
    Input Text    name=password    testpass
    Click Button    xpath=//input[@value='Log In']
    Wait Until Element Is Visible    xpath=//h1[contains(text(),'Accounts Overview')]    10s
    Capture Page Screenshot
    Close Browser
