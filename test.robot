*** Settings ***
Library           Selenium2Library
 
*** Variables ***
${Username}       demouser
${Password}       Kai@demo1
${Browser}        chrome
${SiteUrl}        https://kai.eastus.cloudapp.azure.com/login
${DashboardTitle}      KAI | Product Classification
${LoggedInCheck}    Classification
${Delay}          5s
 
*** Test Cases ***
Login With Registered Mail Adress
    Open KaiPage
    Click security
    Check Title
    Enter User Name
    Enter Right Password
    Click Login
    sleep    ${Delay}
    Sucessfull Login

Model Test
    Click Model DropDown
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
 
Sucessfull Login
    Element Text Should Be    class=navbar-item.has-dropdown.is-hoverable   ${LoggedInCheck}

Click Model DropDown
    Click Link  link:Mass Predict
    Click Element    id=customSelect
    Select From List By Index   id=customSelect 1