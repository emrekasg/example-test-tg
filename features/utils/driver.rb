require_relative '../config/base_config'

class Driver
  def self.get_driver
    cli_type = ENV['browser']
    if cli_type.eql?(nil)
      type = BROWSER
    else
      type = cli_type
    end

    case  type
    when 'chrome'
      options = Selenium::WebDriver::Chrome::Options.new
      
      options.add_argument('--no-sandbox')
      options.add_argument('--headless')
      options.add_argument('--disable-dev-shm')
      options.add_argument('--disable-gpu')
      
      add_default_values(options)

      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app,
                                       browser: :chrome,
                                       options: options)
      end
    when 'chrome-headless'
      options = Selenium::WebDriver::Chrome::Options.new

      options.add_argument('--no-sandbox')
      options.add_argument('--headless')
      options.add_argument('--disable-dev-shm')
      options.add_argument('--disable-gpu')

      add_default_values(options)

      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app,
                                       browser: :chrome,
                                       options: options)
      end
    when 'firefox-headless'
      options = Selenium::WebDriver::Firefox::Options.new

      add_default_values(options)
      options.add_argument('--headless')

      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app,
                                       browser: :firefox,
                                       options: options)
      end
    when 'firefox'
      options = Selenium::WebDriver::Firefox::Options.new

      add_default_values(options)

      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app,
                                       browser: :firefox,
                                       options: options)
      end
    when 'remote-chrome'
      options = Selenium::WebDriver::Chrome::Options.new

      add_default_values(options)

      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app,
                                       browser: :remote,
                                       url: "http://host.docker.internal:4445/wd/hub",
                                       options: options)
      end
    when 'remote-firefox'
      options = Selenium::WebDriver::Firefox::Options.new

      add_default_values(options)

      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app,
                                       browser: :remote,
                                       url: "host.docker.internal:4444",
                                       options: options)
      end
    end
  end


  def self.add_default_values(options)
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--ignore-certificate-errors')

  end
end
