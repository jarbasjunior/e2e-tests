class HomePage < SitePrism::Page
  include Capybara::DSL

  element :field_item, '#new-todo'
  element :list_itens_added, '#todo-list'
  element :first_item, :xpath, "//ul[@id='todo-list']/li[1]"
  element :icon_destroy, '.destroy'

  def load
    visit '/'
  end

  def add_item(itens)
    itens.each do |item|
      field_item.send_keys item, :enter
      find(:xpath, "//label[text()='#{item}']").hover
    end
  end

  def items
    all(:css, 'li label').map(&:text)
  end

  def solve_itens(itens)
    itens.each do |item|
      find(:xpath, "//label[text()='#{item}']/../input").click
    end
  end

  def solved?(item)
    element = "//label[text()='#{item}']/../input"
    has_xpath?(element)
    find(:xpath, element).checked?
  end

  def clear_list
    until empty_list?
      first_item.hover
      icon_destroy.click
    end
  end

  def empty_list?
    all('li label').empty?
  end
end
