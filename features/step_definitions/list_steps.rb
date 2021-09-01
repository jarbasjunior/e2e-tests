Dado('que navego para home do site') do
  $stdin.call(HomePage).load
  $stdin.call(HomePage).clear_list
end

Dado('que tenho itens adicionados na minha lista') do
  steps %(
    Dado que navego para home do site
    Quando adiciono itens à minha lista
    |item 1|item 2|item 3|item 4|
  )
end

Quando('adiciono itens à minha lista') do |table|
  @itens = table.column_names
  $stdin.call(HomePage).add_item(@itens)
end

Quando('resolvo os itens da minha lista') do
  $stdin.call(HomePage).solve_itens(@itens)
end

Então('os itens devem ser adicionados na minha lista') do
  result = $stdin.call(HomePage).items
  expect(result.size).to eql         @itens.size
  expect(result).to      match_array @itens
end

Então('os itens devem ser exibidos como resolvidos na minha lista') do
  @itens.each do |item|
    solved_item = $stdin.call(HomePage).solved?(item)
    raise "Item [#{item}] not solved" unless solved_item
  end
end
