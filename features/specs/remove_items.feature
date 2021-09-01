# language: pt

Funcionalidade: Remover items da lista

  Cenário: Remover itens da lista com sucesso
    Dado que tenho itens adicionados na minha lista
    Quando removo todos os itens da minha lista
    Então minha lista deve estar vazia
