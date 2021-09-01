Before do
  $stdin = ->(klass) { klass.new }

  page.current_window.resize_to(1440, 900)
  $stdin.call(HomePage).load
  $stdin.call(HomePage).clear_list
end

After do |scenario|
  file_name = scenario.name.gsub(%r{([_@#!%()\-=;><,{}\~\[\]\./\?\"\*\^\$\+\-]+)}, '')
  file_name = scenario.status.to_s.gsub(/[:]/, '') + '_' + file_name.downcase.gsub(/[ ]/, '_')
  screenshot_file = page.save_screenshot("report/screenshots/#{file_name}.png")
  embed(screenshot_file, 'image/png', file_name)
  exception_message(scenario)
end

def exception_message(scenario)
  scene = scenario.failed?
  return unless scene == true

  puts "\n--------------------------------------------------------------------------------------------"
  puts 'Reason:'
  puts scenario.exception.message.to_s
  puts "--------------------------------------------------------------------------------------------\n"
end

AfterConfiguration do |config|
  config.on_event(:test_case_finished) do |event|
    puts "\nResults:"
    puts '--------------------------------------------------------------------------------------------------'
    puts "Scenario......: #{event.test_case.name}"
    puts "The results is: #{event.result}"
    puts "--------------------------------------------------------------------------------------------------\n"
  end
end

at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'report/report.json'
    config.report_path = 'report/report'
    config.report_types = [:html]
    config.report_title = 'TODOS Report'
    config.color = 'navy blue'
    config.additional_info = { Environment: ENV['ENV'] }
  end
  ReportBuilder.build_report
  Capybara.current_session.driver.quit
end
