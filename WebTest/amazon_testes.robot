*** Settings ***

Documentation        Essa suite teste o site da Amazon.com.br
Resource             amazon_resources.robot   
Test Setup           Abrir o navegador 
# Test Teardown        Fechar o navegador
           

*** Test Cases ***
Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu eletrônico do site da Amazon.com.br
    ...              e verifica a categoria Computadores Informática
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "eletrônicos e tecnologia"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Amazon.com.br : eletrônicos e tecnologia"
    Verificar se aparece a categoria "eletrônicos e tecnologia"
    Verificar se aparece a categoria "Livros de Ciências, Matemática e Tecnologia"
Caso de teste 02 - Pesquisa de um produto

    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca_produtos        lista_busca 
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pequisa se está listando o produto "Console Xbox Series S"