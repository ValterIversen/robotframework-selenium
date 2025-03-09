@echo off

echo ----------------------------------------------------
echo -------------- Preparação do ambiente --------------
echo ----------------------------------------------------

:: Instalação das bibliotecas para garantir a execução corretamente
pip install -r requirements.txt

echo ----------------------------------------------------
echo ---- Execução do projeto de automação iniciado -----
echo ----------------------------------------------------

:: Configuração do ambiente, se necessário (exemplo de ativar um ambiente virtual)
:: call C:\path\to\your\virtualenv\Scripts\activate

:: Execução do projeto
robot -d results suites

echo ----------------------------------------------------
echo --- Execução do projeto de automação finalizado ----
echo ----------------------------------------------------
