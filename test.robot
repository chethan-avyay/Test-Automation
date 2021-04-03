*** Settings ***
Library           Selenium2Library
 
*** Variables ***
${Username}       demouser
${Password}       kai@demo1w
${Browser}        chrome
${SiteUrl}        https://kai.eastus.cloudapp.azure.com/login
${DashboardTitle}      KAI | Product Classification
${ExpectedWarningMessage}    User doesn
${Delay}          5s
 
*** Test Cases ***
Login Should Failed With Registered Mail Adress
    Open KaiPage
    Click security
    Check Title
    Enter User Name
    Enter Right Password
    Click Login
    sleep    ${Delay}
    Assert Warning Message
    [Teardown]    Close Browser
 
*** Keywords ***
Click security
    Click Button    id=details-button
    Click Link  id=proceed-link
Open KaiPage
    open browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window
 
Enter User Name
    Input Text    name=k-username    ${Username}
 
Enter Right Password
    Input Text    name=k-password    ${Password}
 
Click Login
    Click Button   class:button.is-custom
 
Check Title
    Title Should be    ${DashboardTitle}
 
Assert Warning Message
    Element Text Should Be    class=_9ay7    ${ExpectedWarningMessage}