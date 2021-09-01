Dado('que navego para home do site') do
  $stdin.call(HomePage).load
  $stdin.call(HomePage).clear_list
end

Quando('que adiciono itens à minha lista') do |table|
  @itens = table.column_names
  $stdin.call(HomePage).add_item(@itens)
end

Então('os itens devem ser adicionados na minha lista') do
  result = $stdin.call(HomePage).items
  expect(result.size).to eql         @itens.size
  expect(result).to      match_array @itens
end
