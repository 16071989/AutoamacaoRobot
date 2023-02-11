*** Settings ***

Documentation   Exemplo de tipos de variáveis: SIMPLES, LISTAS e DICIONÁRIOS

*** Variables ***
@{meses_ano}      Janeiro    Fevereiro    Março    Abril    Maio    Junho    Julho    Agosto    Setembro    Outubro    Novembro    Dezembro1
    
*** Test Cases ***   
 Caso de teste de exemplo 01
     Uma keyword qualquer 01

*** Keywords ***

 Uma keyword qualquer 01

    Log To Console     Em Janeiro há ${meses_ano[0]} dias!
    Log To Console     Em Fevereiro há ${meses_ano[1]} dias!
    Log To Console     Em Março há ${meses_ano[2]} dias!
    Log To Console     Em Abril há ${meses_ano[3]} dias!
    Log To Console     Em Maio há ${meses_ano[4]} dias!
    Log To Console     Em Junho há ${meses_ano[5]} dias!
    Log To Console     Em Julho há ${meses_ano[6]} dias!
    Log To Console     Em Agosto há ${meses_ano[7]} dias!
    Log To Console     Em Setembro há ${meses_ano[8]} dias!
    Log To Console     Em Outubro há ${meses_ano[9]} dias!
    Log To Console     Em Novembro há ${meses_ano[10]} dias!
    Log To Console     Em Dezembro há ${meses_ano[11]} dias!
