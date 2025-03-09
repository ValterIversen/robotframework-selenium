*** Settings ***

Documentation   Responsável por armazenar keyword e variáveis que podem ser usadas por todas suites

Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.amazon.com.br/
${BROWSER}      Chrome

*** Keywords ***

Acessar a pagina
    [Arguments]    ${url}
    Go To   ${url}
    
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Implicit Wait    10 seconds
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser
