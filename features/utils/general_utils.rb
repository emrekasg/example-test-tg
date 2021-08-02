
class GeneralUtils

    def self.take_screenshot(file_name)
      file_path = 'output/screenshots'
      screenshot = "#{file_path}/#{file_name}.png"
      page.save_screenshot(screenshot)
      embed(screenshot, "image/png", "Click here to view screenshots")
    end



    def self.refresh_page
      page.evaluate_script('window.location.reload()')
    end

    def self.scroll_to(element)
      script = <<-JS
      arguments[0].scrollIntoView(true);
      JS
      Capybara.current_session.driver.browser.execute_script(script, element.native)
    end
end
