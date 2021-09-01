# language: pt

Funcionalidade: Resolver items da lista

  Cenário: Resolver itens da lista com sucesso
    Dado que tenho itens adicionados na minha lista
    Quando resolvo os itens da minha lista
    Então os itens devem ser exibidos como resolvidos na minha lista
