## Automação Testes Web

  Projeto para validar o site [todos](https://todomvc-socketstream.herokuapp.com/#/all) de forma automatizada, o qual utiliza as seguintes ferramentas:

  - **[Ruby](https://www.ruby-lang.org/en/)**;
  - **[Cucumber](https://cucumber.io)**;
  - **[Caybara](https://github.com/teamcapybara/capybara)**;
  - **[Page Objects](https://github.com/SeleniumHQ/selenium/wiki/PageObjects)**
  - **[RSpec](https://github.com/rspec/rspec)**.

## Pré-requisito: 

  **[Ruby](https://gorails.com/setup/ubuntu/18.04)** instalado.


## <a name="installing-drivers"></a>Instalando Webdrivers no Debian/Ubuntu

  ### Geckodriver (Firefox)

  1 - Vá até a página de releases do Geckodriver. Procure pela última versão do driver e baixe o arquivo e altere na url abaixo caso necessário:

  ```
  wget https://github.com/mozilla/geckodriver/releases/download/v0.29.1/geckodriver-v0.29.1-linux64.tar.gz
  ```

  2 - Descompacte o arquivo:

  ```
  tar -xvzf geckodriver-v0.26.0-linux64.tar.gz
  ```

  3 - Torne-o executável:

  ```
  chmod +x geckodriver
  ```

  4 - Mova o arquivo executável `geckodrive` para `/usr/local/bin/`:

  ```
  sudo mv geckodriver /usr/local/bin/
  ```

  ### ChromeDriver (Google Chrome - 93º versão)

  1 - Vá até a página de releases do Chromedriver. Procure pela última versão do driver e baixe o arquivo e altere na url abaixo caso necessário:

  ```
  wget https://chromedriver.storage.googleapis.com/93.0.4577.15/chromedriver_linux64.zip
  ```

  2 - Descompacte o arquivo:

  ```
  unzip chromedriver_linux64.zip
  ```

  3 - Torne-o executável:

  ```
  sudo mv chromedriver /usr/bin/chromedriver
  sudo chown root:root /usr/bin/chromedriver
  sudo chmod +x /usr/bin/chromedriver
  ```

### Instalando as gemas Ruby

Dentro da pasta raiz do projeto, execute: `bundle install`

### Configuração do ambiente

  **OBS.** Para este projeto não é necessário seguir os próximos passos desta etapa de configuração, pois o arquivo `.env` já está preenchido. Contudo, caso esse projeto estivesse validando dados reais de uma organização, os valores de variáveis de ambiente e demais conteúdos que exigem privacidade da equipe responsável, a recomendação seria seguir as próximas etapas desta secção de modo a manter seguros os dados sensíveis do projeto, além de adicionar o valor `.env` dentro do arquivo `.gitignore`.
  - Duplique o arquivo `.env.sample` e o renomeie para `.env`;
  - Consulte o(s) QA(s) do time, o(s) qual(is) mantém este projeto para obter os valores das chaves para preencher o arquivo `.env` criado no passo anterior.

### Instalando [Ruby Solargraph](https://marketplace.visualstudio.com/items?itemName=castwide.solargraph) extensão (opcional)

Solargraph é uma extensão compatível com o [VSCode](https://code.visualstudio.com/) para auxiliar na escrita do código em linguagem Ruby.

1 - Na pasta raiz do seu projeto, execute: `solargraph config .`;

2 - Verifique se o arquivo `.solargraph.yml` foi criado na pasta raiz do projeto;

3 - Maneiras de ir para um método ou definições de variáveis:

- Selecione o método ou variável que deseja inspecionar, clique com o **Botão direito** e selecione "Go to Definition" nas opções do menu; ou
- Mova o cursor para o método ou variável que deseja inspecionar e pressione F12; ou
- Mova o cursor para o método ou variável que deseja inspecionar, pressione **Ctrl** e clique com o botão esquerdo para visualizar o contexto.

### Execução

  - Considerando que os navegadores: Google Chrome e Firefox estão instalados junto com seus respectivos *drivers* (secção [Instalando Webdrivers no Debian/Ubuntu](#installing-drivers)), os testes poderão ser executados com ou sem a visualização dos navegadores (modo *headless*).

    Na pasta raiz do projeto execute um dos comandos abaixo de acordo com o modo de execução desejado.
  
  Modo de execução                                 | Comando
  ---------                                        | ------
  Navegador Google Chrome                          | cucumber
  Navegador Google Chrome oculto (modo *headless*) | cucumber -p chrome_headless
  Navegador Firefox                                | cucumber -p firefox
  Navegador Firefox oculto (modo *headless*)       | cucumber -p firefox_headless

  - Reports disponíveis dentro da pasta **report** do projeto, para visualizá-lo abra o arquivo `report.html` em um navegador de sua preferência.

