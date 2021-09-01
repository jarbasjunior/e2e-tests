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
    all_itens = 'li label'
    page.has_css?(all_itens)
    all(all_itens).last.visible?
    page.all(:css, all_itens).map(&:text)
  end

  def clear_list
    while has_xpath?("//ul[@id='todo-list']/li[1]")
      first_item.hover
      icon_destroy.click
    end
  end
end
