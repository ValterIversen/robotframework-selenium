*** Settings ***

Documentation   Palavras chaves da tela de Produto

Resource    ../base.resource

*** Keywords ***

Aguardar carregamento do produto
    [Arguments]    ${nome_esperado}
    Wait Until Element Is Visible    css=h1#title   10
    ${nome}=    Get Text    css=h1#title
    Should Contain    ${nome}    ${nome_esperado}    message=O produto carregado é diferente do produto esperado
    
Selecionar a cor do produto
    [Arguments]    ${cor}
    Click Element    css=li[data-asin="B0CKD6LZ16"]