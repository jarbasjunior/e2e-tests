require 'awesome_print'
require 'byebug'
require 'capybara'
require 'capybara/cucumber'
require 'dotenv/load'
require 'httparty'
require 'report_builder'
require 'selenium-webdriver'
require 'site_prism'

case ENV['BROWSER']
when 'chrome'
  @driver = :selenium_chrome
when 'firefox'
  @driver = :selenium
when 'chrome_headless'
  Capybara.register_driver :selenium_chrome_headless do |app|
    chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
      options.add_argument '--headless'
      options.add_argument '--disable-gpu'
      options.add_argument '--no-sandbox'
      options.add_argument '--disable-site-isolation-trials'
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
  @driver = :selenium_chrome_headless
when 'firefox_headless'
  @driver = :selenium_headless
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = ENV['URL']
  config.default_max_wait_time = 5
  ap "Application - #{ENV['URL']}"
  ap "Environment - #{ENV['ENV']}"
end

system("rm #{File.join(Dir.pwd + '/report/screenshots/*.png')}")
