*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Preencher o formulario
    Open browser    https://testautomationpractice.blogspot.com/    browser=chrome    options=add_argument("--start-maximized")
    Wait Until Element Is Enabled        xpath://input[@id="name"]    20
    Input Text       xpath://input[@id="name"]    David Santos
    Input Text       xpath://input[@id="email"]   Davids@gmail.com
    Input Text       xpath://input[@id="phone"]    915732864
    Click Element    xpath://input[@id="male"]
    Click Element    xpath://input[@id="sunday"]
    Click Element    xpath://input[@id="tuesday"]
    Click Element    xpath://input[@id="saturday"]
    Select From List By Value    xpath://select[@id="country"]    brazil
    Select From List By Value    xpath://select[@id="colors"]    green    white
    Select From List By Value    xpath://select[@id="animals"]   dog    fox
    Input Text       xpath://input[@id="datepicker"]    01/17/2025
    Click Element    xpath://input[@id="txtDate"]
    Set Focus To Element         xpath://select[@class="ui-datepicker-year"]
    Select From List By Value    xpath://select[@class="ui-datepicker-year"]    2016   
    Set Focus To Element         xpath://select[@class="ui-datepicker-month"]
    Select From List By Value    xpath://select[@class="ui-datepicker-month"]    2  
    Click Element    xpath://a[@data-date="12"]
    Input Text       xpath://input[@id="start-date"]    01/01/2025
    Input Text       xpath://input[@id="end-date"]    05/01/2025
    Click Button     xpath://button[text()="Submit"]
    Element Should Be Visible    xpath://div[@id="result"]
    Choose File    xpath://input[@id="singleFileInput"]    C:\\Users\\david.d.santos\\Pictures\\XPATH.png
    Click Button    xpath://button[text()="Upload Single File"]
    Element Should Be Visible    xpath://p[@id="singleFileStatus"]
    Wait Until Element Is Visible    xpath://p[@id="singleFileStatus"]
    