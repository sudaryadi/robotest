*** settings ***
Library    SeleniumLibrary

*** variables ***
${URL}            https://parabank.parasoft.com/
${BROWSER}        chrome
${REG}            register.htm
${TITLE}          xpath=/html/body/div[1]/div[3]/div[2]/h1
${1NAME}          id=customer.firstName
${2NAME}          id=customer.lastName
${ADDRESS}        id=customer.address.street
${CITY}           id=customer.address.city
${STATE}          id=customer.address.state
${ZIP}            id=customer.address.zipCode
${PHONE}          id=customer.phoneNumber
${SSN}            id=customer.ssn
${USERNAME}       id=customer.username
${PASSWORD}       id=customer.password
${CONFIRM}        id=repeatedPassword
${REGISTER}       xpath=/html/body/div[1]/div[3]/div[2]/form/table/tbody/tr[13]/td[2]/input
${WELCOME}        xpath=/html/body/div[1]/div[3]/div[2]/h1

*** test cases ***
TC#1_Register new account
    Open Browser    ${URL}    ${BROWSER}
    click link    ${REG}
    sleep    5s
    element text should be    ${TITLE}    Signing up is easy!
    # Mengisi form pendaftaran #
    input text    ${1NAME}        Siva
    input text    ${2NAME}        Aurum
    input text    ${ADDRESS}      Gasibu
    input text    ${CITY}         Bandung
    input text    ${STATE}        Indonesia
    input text    ${ZIP}          44103
    input text    ${PHONE}        (021) 14045
    input text    ${SSN}          666999
    input text    ${USERNAME}     siva.aurum
    input text    ${PASSWORD}     Siva123_
    input text    ${CONFIRM}      Siva123_
    click button  ${REGISTER}
    sleep    3s
    element text should be    ${WELCOME}    Welcome siva.aurum