# language: pt

Funcionalidade: Adicionar items na lista

  Cenário: Adicionar itens a lista com sucesso
    Quando adiciono itens à minha lista
    |item 1|item 2|item 3|item 4|
    Então os itens devem estar adicionados na minha lista
