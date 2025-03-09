## Estrutura do Repositório

Abaixo está a descrição das pastas e arquivos principais deste repositório:

### :file_folder: `resources/`
Contém todos os **recursos** das páginas e dados utilizados durante os testes automatizados.

### :file_folder: `suites/`
Contém todos os **casos de testes**, organizados de acordo com as funcionalidades do sistema.

### :page_facing_up: `requirements.txt`
Arquivo utilizado para listar todas as **bibliotecas** e dependências necessárias para rodar o projeto. Basta instalar as dependências com o comando:

### :page_facing_up: `run_robot.bat`
Este script **.bat** é utilizado para configurar e executar os testes automatizados em ambientes de **CI/CD** (Integração Contínua/Entrega Contínua). Ele automatiza o processo de configuração do projeto e execução dos testes sempre que houver um novo Pull Request.
