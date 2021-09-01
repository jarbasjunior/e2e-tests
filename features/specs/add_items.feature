# language: pt

Funcionalidade: Adicionar items na lista

  Cenário: Adicionar itens a lista com sucesso
    Dado que navego para home do site
    Quando que adiciono itens à minha lista
    |item 1|item 2|item 3|item 4|
    Então os itens devem ser adicionados na minha lista
