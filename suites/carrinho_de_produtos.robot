*** Settings ***

Documentation   Casos de teste referentes ao fluxos relacionados ao carrinho de compra

Resource    ../resources/pages/carrinho.resource
Resource    ../resources/pages/produto.resource

Resource    ../resources/data/produto.resource

Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

*** Test Cases ***
Caso de teste 1 - Carrinho de produtos - adicionar
    [Documentation]    Validar fluxo de adição de um produto ao carrinho
    [Tags]    Medio    Carrinho de Produtos
    Acessar a pagina   ${produto.url}
    Aguardar carregamento do produto    ${produto.nome}
    Clicar no botão Adicionar ao carrinho
    Validar se o produto foi adicionado ao carrinho     ${produto}
    Validar a quantidade do produto no carrinho    ${produto}    1
    Validar subtotal dos produtos no carrinho    59,90

Caso de teste 3 - Carrinho de produtos - adicionar - produto fora do estoque
    [Documentation]    Validar o bloqueio de adição de um produto, quando o produto está esgotado
    [Tags]    Alto    Carrinho de Produtos    Estoque
    Acessar a pagina   ${produto_sem_estoque.url}
    Aguardar carregamento do produto    ${produto_sem_estoque.nome}
    Selecionar a cor do produto    ${produto_sem_estoque.id}
    Validar se o botão Adicionar ao carrinho foi desabilitado