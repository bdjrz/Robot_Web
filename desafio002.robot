*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Login na app
    Open Browser    https://www.saucedemo.com/    chrome    options=add_argument("--start-maximized")
    Input Text      xpath://input[@id="user-name"]    ${login}
    Input Text      xpath://input[@id="password"]     ${password}
    Sleep    5
    Click Button    xpath://input[@id="login-button"]
    Element Should Be Visible    xpath://div[@id="shopping_cart_container"] 
    

*** Variables ***
${login}        standard_user
${password}     secret_sauce


*** Test Cases ***
Adicionar um produto ao carrinho
     [Tags]    login
     Login na app
     Wait Until Element Is Enabled       xpath://span[text()="Products"]     20
     Click Button    xpath://button[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
     Sleep    5
     Click Element   xpath://div[@id="shopping_cart_container"]
     Element Should Be Visible    xpath://div[text()="Sauce Labs Bolt T-Shirt"]
     Sleep    5
     # Escolher um produto e clicar no botao "Add to cart"
     # Entrar no carrinho (icone na parte superior direito)
     # validar se o produto escolhido esta no carrinho


Excluir um produto do carrinho
     Login na app
     Wait Until Element Is Enabled       xpath://span[text()="Products"]     20
     Click Button    xpath://button[@id="add-to-cart-sauce-labs-backpack"]
     Click Button    xpath://button[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]
     Click Button    xpath://button[@id="add-to-cart-sauce-labs-onesie"]
     Click Element   xpath://div[@id="shopping_cart_container"]
     Wait Until Element Is Enabled       xpath://span[text()="Your Cart"]     20
     Sleep    5
     Click Button    xpath://button[text()="Remove"]
     Click Button    xpath://button[text()="Remove"]
     Click Button    xpath://button[text()="Remove"]
     Element Should Not Be Visible    xpath://div[@class="cart_item_label"]
     Sleep    5
     # Logar na aplicação https://www.saucedemo.com/
     # Entrar na aplicação e no carrinho.
     # Excluir todos os produtos do carrinho
     # Obs: Senao houver produto, adicionar antes. 
