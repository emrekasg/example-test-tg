require 'capybara'
require 'capybara/dsl'
require 'httparty'
require 'rspec'
require 'selenium-webdriver'
require 'date'
require 'time'


Dir["#{Dir.pwd}/features/util/**/*.rb"].each { |file| require file }

include Capybara::DSL
include RSpec::Matchers
RSpec.configure { |config| config.include Capybara::DSL, type: :feature }

Capybara.configure do |config|
  config.default_selector = :css
  config.default_max_wait_time = 10
  config.default_driver = :selenium
  config.run_server = false
  config.javascript_driver = :selenium
  #config.default_normalize_ws = true
end

