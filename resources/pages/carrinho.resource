*** Settings ***

Documentation   Palavras chaves do carrinho de compra

Resource    ../base.resource

*** Keywords ***

Validar se o produto foi adicionado ao Carrinho
    [Arguments]    ${produto}
    Wait Until Element Is Visible   css=#sw-atc-confirmation h1   10
    ${mensagem}=    Get Text    css=#sw-atc-confirmation h1
    Should Be Equal As Strings   ${mensagem}     Adicionado ao carrinho     message=Mensagem de produto adicionado ao carrinho está incorreta
    Wait Until Element Is Visible   css=span.a-list-item div[data-asin="${produto.id}"]    10     message=Produto não encontrado no carrinho
    Page Should Contain Element    css=div[data-asin="${produto.id}"] img[src="${produto.imagem_principal}"]    message=A imagem do produto no carrinho está diferente do esperado

Validar a quantidade do produto no carrinho
    [Arguments]    ${produto}    ${quantidade_esperada}
    ${quantidade}=    Get Text    css=span.a-list-item div[data-asin="${produto.id}"] .a-dropdown-prompt
    Should Be Equal As Integers    ${quantidade_esperada}    ${quantidade}    message=A quantidade do produto ${produto.nome} no carrinho está diferente da quantidade esperada

Validar subtotal dos produtos no carrinho
    [Arguments]    ${valor_esperado}
    # Este subtotal está separado por elementos
    ${subtotal_parte1}=    Get Text    css=#sw-atc-buy-box > div > span:nth-child(1)
    ${subtotal_parte2}=    Get Text    css=#sw-subtotal .a-price-symbol
    ${subtotal_parte3}=    Get Text    css=#sw-subtotal .a-price-whole
    ${subtotal_parte4}=    Get Text    css=#sw-subtotal .a-price-fraction
    ${subtotal}=    Set Variable    ${subtotal_parte1} ${subtotal_parte2} ${subtotal_parte3},${subtotal_parte4}
    Should Be Equal As Strings    ${subtotal}    Subtotal do carrinho: R$ ${valor_esperado}    message=O subtotal do carrinho está diferente do esperado
    
    ${subtotal2}=    Get Text    css=div.ewc-subtotal
    Should Be Equal As Strings    ${subtotal2}    Subtotal\nR$ ${valor_esperado}    message=O subtotal do carrinho está diferente do esperado

Clicar no botão Adicionar ao Carrinho
    Click Button    id=add-to-cart-button

Validar se o botão Adicionar ao carrinho foi desabilitado
    Wait Until Element Is Not Visible    css=input#add-to-cart-button    10    message=O botão Adicionar ao carrinho não foi desabilitado