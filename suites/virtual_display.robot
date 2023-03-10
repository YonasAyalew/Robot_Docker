*** Settings ***
Library     SeleniumLibrary
Library     XvfbRobot

*** Variables ***
${TMP_PATH}                 /tmp


*** Test Cases ***
Open EdgeOne
    Start Virtual Display    1920    1080
    Open Chrome Browser
    GoTo    https://e1-dev.k8s.myapp.de/ 
    ${title}=       Get Title
    Should Be Equal    EdgeOne SSO : Germanedge : Unified Workplace    ${title}


*** Keywords ***
Open Chrome Browser
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --no-sandbox
    ${prefs}    Create Dictionary    download.default_directory=${TMP_PATH}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}


