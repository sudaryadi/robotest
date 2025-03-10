*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${URL}       https://parabank.parasoft.com/
${BROWSER}   chrome

*** Test Cases ***
TC#2_Login to ParaBank
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --start-maximized
    Create WebDriver    Chrome    options=${options}

    Go To    ${URL}
    Input Text        name=username    siva.aurum
    Input Text        name=password    Siva123_
    Click Button      xpath=/html/body/div[1]/div[3]/div[1]/div/form/div[3]/input
    Wait Until Element Is Visible    xpath=//h1[contains(text(),'Accounts Overview')]    10s
    Capture Page Screenshot
    Close Browser
