require_relative '../utils/driver'

Before do |scenario|

  Driver.get_driver

  page.driver.browser.manage.window.maximize
end

After do |scenario|
  scenario_name = scenario.name.gsub(/[^A-Za-z0-9 ]/, "").gsub(/\s+/, "_")

  if scenario.failed?
    GeneralUtils.take_screenshot(scenario_name.downcase!)
  end

  Capybara.current_session.driver.quit
end

