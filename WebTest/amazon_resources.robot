*** Settings ***
Library        SeleniumLibrary
Library    FakerLibrary

*** Variables ***
${BROWSER}                            Chrome
${URL}                                https://www.amazon.com.br
${MENU_TODOS}                         //span[@class='hm-icon-label']
${CAMPO_PESQUISA}                     //input[contains(@aria-label,'Pesquisa')]
${TEXTO_ELETRONICOS}                  eletrônicos e tecnologia
${BUTTON_LUPA}                        //input[@value='Ir']   
${BUTTON_ELETRONICO}                  //img[contains(@alt,'Eletrônicos e TVs')]
${TEXTO_AMAZOMPRIME}                  Amazon Prime
${HEADER_ELETRONICOS}                 //h4[contains(.,'Amazon Prime')]
${HEADER_ELETRONICOS_E_TECNOLOGIA}    //span[contains(@class,'a-color-state a-text-bold')]
${TEXTO_XBOX}                         Xbox Series S
${BUTTON_XBOX}                        //div[contains(@data-asin,'B08G9J44ZN')]
${BUTTON_ADI_CARRINHO}                //input[contains(@name,'submit.add-to-cart')]
${BUTTON_IR_CARRINHO}                 //a[contains(.,'Ir para o carrinho')]
${BUTTON_EXCLUIR_CARRINHO}             //input[@value='Excluir']
${TEXTO_CARRINHO_VAZIO}               sc-item-C4c56f0a8-24fb-4b61-bc61-a56983b31ea6
*** Keywords ***
Abrir o navegador
    Open Browser                      browser=${BROWSER}
    Maximize Browser Window 
# Fechar o navegador
#     Capture Page Screenshot            
#     Close Browser
Acessar a home page do site Amazon.com.br
    Go To                            ${URL}
    Wait Until Element Is Visible    locator=${MENU_TODOS}
Entrar no menu "eletrônicos e tecnologia"
    Wait Until Location Is Not       location=${CAMPO_PESQUISA}
    Sleep                            2s
    Input Text                       locator=${CAMPO_PESQUISA}   text=${TEXTO_ELETRONICOS}
    Wait Until Page Contains         text=${TEXTO_ELETRONICOS}
    Click Image                      locator=${BUTTON_LUPA}
Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains         text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS_E_TECNOLOGIA}
Verificar se o título da página fica "${TITULO}"
    Title Should Be                  title=${TITULO}
Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//span[@class='a-size-base a-color-base'][contains(.,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Wait Until Location Is Not       location=${CAMPO_PESQUISA}
    Sleep                            2s
    Input Text                       locator=${CAMPO_PESQUISA}   text=${PRODUTO}
Clicar no botão de pesquisa
    Click Image                      locator=${BUTTON_LUPA}
Verificar o resultado da pequisa se está listando o produto "${CONSOLE}"
    Wait Until Location Is Not       location=(//span[contains(.,'${CONSOLE}')])[2]

# GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
Quando acessar o menu "Eletrônicos"
    Entrar no menu "eletrônicos e tecnologia"
Então o título da página deve ficar "Amazon.com.br : eletrônicos e tecnologia"
    Verificar se o título da página fica "Amazon.com.br : eletrônicos e tecnologia"
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"
E um produto da linha "Console Xbox Series S" deve ser mostrado na página
     Verificar o resultado da pequisa se está listando o produto "Console Xbox Series S"

# GHERKIN STEPS Pratique automatizando mais esses 03 cenários:
## Caso de Teste 03 - Adicionar Produto no Carrinho
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pequisa se está listando o produto "Console Xbox Series S"
    Wait Until Element Is Visible    locator=${BUTTON_XBOX}
    Capture Page Screenshot
    Click Element    locator=${BUTTON_XBOX}
    Wait Until Element Is Visible    locator=${BUTTON_ADI_CARRINHO}
    Click Element    locator=${BUTTON_ADI_CARRINHO}
    Wait Until Element Is Visible    locator=${BUTTON_IR_CARRINHO}
    Capture Page Screenshot
    Click Element    locator=${BUTTON_IR_CARRINHO}
Então o produto "${PRODUTO}" deve ser mostrado no carrinho
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]

## Caso de Teste 04 - Remover Produto do Carrinho
E existe o produto "${XBOX}" no carrinho
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Xbox Series S" deve ser mostrado no carrinho
Quando remover o produto "Console Xbox Series S" do carrinho
    Click Element    locator=${BUTTON_EXCLUIR_CARRINHO}
    Sleep    3s
Então o carrinho deve ficar vazio
    Wait Until Element Is Not Visible    locator=${BUTTON_EXCLUIR_CARRINHO}