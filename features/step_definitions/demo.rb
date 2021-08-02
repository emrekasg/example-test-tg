demo = DemoPage.new

Given(/^user on the homepage$/) do
  visit BASE_URL
  demo.close_pop_up_window
  demo.close_notification
end

And(/^clicks on "([^"]*)"$/) do |category_name|
  demo.click_category(category_name)
end

When(/^clicks on app logo$/) do
  demo.click_homepage_logo
end

Then(/^homepage should be opened$/) do
  demo.verify_homepage_is_opened
end

When(/^search for "([^"]*)"$/) do |search_key|
  demo.search_for_key(search_key)
end




Then(/^user should see number of search results$/) do
  demo.verify_search_result
end

And(/^user should see result text "([^"]*)"$/) do |search_key|
  demo.verify_search_key search_key
end