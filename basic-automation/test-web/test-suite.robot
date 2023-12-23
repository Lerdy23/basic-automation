* Settings *
Library           SeleniumLibrary

* variables *
${BROWSER}     chrome
${HOST}    http://localhost/Website-Simple-Data-Mahasiswa-Menggunakan-PHP-main/login.php

${EMAIL}    admin
${EMAIL-2}    wronguser   # wrong user
${PASS-1}    admin    # correct password
${PASS-2}    wrongpass    # wrong password

${COMPANY}    201011402139
${TITLE}    Lerdy
${LOCATION}     07TPLE007
${TAGS}    engineering manager software
${JOBEMAIL}    teknik informatika
${WEBSITE}    7
${DESCRIPTION}     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

* Test Cases *

# login
# positive test
testcase-1
    Login Success
    Close Browser    

# negative test
testcase-2
    Open Browser    ${HOST}    ${BROWSER}
    Page Should Contain Element    xpath://h4[@class='fw-bold' and contains(text(), 'Login | Admin')]
    input text        name:username       ${EMAIL-2}
    input text        name:password    ${PASS-2}
    Click Element     xpath://button[@type='submit']
    Close Browser 

# logout
testcase-3
    Login Success
    Click Element    xpath://a[@class='nav-link' and @href='logout.php']
    Page Should Contain Element    xpath://h4[@class='fw-bold' and contains(text(), 'Login | Admin')]
    Close Browser 

#post job
testcase-4
    Login Success
    Click Element    xpath://a[@href='addData.php' and contains(@class, 'btn btn-primary')]
    Page Should Contain Element    xpath://h3[@class='fw-bold text-uppercase' and contains(i/@class, 'bi bi-person-plus-fill')]
    input text        name:nim       ${COMPANY}
    input text        name:nama       ${TITLE}
    input text        name:kelas       ${LOCATION}
    input text        name:jurusan       ${JOBEMAIL}
    input text        name:semester       ${WEBSITE}
    Click Element     xpath://button[@type='submit']
    Close Browser 

    
testcase-5
    Login Success
    Click Element    xpath://a[@href='export.php' and @target='_blank' and contains(@class, 'btn btn-success ms-1') and contains(text(), 'Ekspor ke Excel')]
    Close Browser

* Keywords *

Scroll Down Until End
    ${previous_height}=    Execute Javascript    return document.body.scrollHeight;
    FOR  ${i}    IN RANGE    10
        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        Sleep    1s
        ${current_height}=    Execute Javascript    return document.body.scrollHeight;
        Exit For Loop If    '${current_height}' == '${previous_height}'
        ${previous_height}=    Set Variable    ${current_height}
        ${alert_message}=    Handle Alert    accept=True
        Sleep    2s
    END

Login Success
    Open Browser    ${HOST}    ${BROWSER}
    Page Should Contain Element    xpath://h4[@class='fw-bold' and contains(text(), 'Login | Admin')]
    input text        name:username       ${EMAIL}
    input text        name:password    ${PASS-1}
    Click Element     xpath://button[@type='submit']
    Page Should Contain Element    xpath://h3[contains(text(), 'Data Mahasiswa FTI')]