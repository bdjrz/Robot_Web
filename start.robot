*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${login}             Admin
${password}          admin123
@{Dias_da_semana}    Domingo    Segunda    Terça    Quarta    Quinta    Sexta    Sábado
&{Dados}              nome=David  email=davids@gmail.com  mae=Parita

*** Keywords ***
Aceder ao site
    Open browser  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome
    Wait Until Element Is Enabled       xpath://input[@name="username"]     20     
    Input Text      xpath://input[@name="username"]          ${login}   
    Input Text      xpath://input[@placeholder="Password"]   ${password}
    Click Button    xpath://button[text()=" Login "]
    Sleep       5
    Page Should Contain Image       //img[@src="/web/images/orange.png?v=1721393199309"]
    Capture Page Screenshot


*** Test Cases ***
Teste de Login com Username e Password correctos
    [Tags]  login
    Aceder ao site
    Click Link      //a[@href="/web/index.php/admin/viewAdminModule"]
    Sleep       3
    Element Should Be Visible        //h6[text()="User Management"]



Analisar Variaveis
  [Tags]  var
  Log To Console    ${login}
  Log To Console    ${Dias_da_semana[6]}
  Log To Console    ${Dados.mae}