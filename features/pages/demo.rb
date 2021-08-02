class DemoPage
  def initialize
    @homepage_logo_css = "[alt='hayat sana gelir']"
    @pop_up_close_xpath = "(//span[@class='seg-popup-close'])[1]"
    @search_box_id = "searchData"
    @search_button_css = ".iconSearch"
    @search_result_key_css = ".resultText h1"
    @search_result_count_css = ".resultText strong"
    @close_notification_text = "Daha Sonra"
  end

  def close_pop_up_window
    find(:xpath, @pop_up_close_xpath).click
  end
  def click_category(category_name)
    first(:link, category_name).click
  end

  def click_homepage_logo

    find(@homepage_logo_css).click
  end

  def verify_homepage_is_opened

    expect(URI.parse(current_url)).should eql?("https://www.n11.com/")
  end

  def search_for_key(search_key)
    find(:id, @search_box_id).set search_key
    find(@search_button_css).click

  end

  def verify_search_key(search_key)
    result_text = find(@search_result_key_css).text
    expect(result_text.downcase).to include(search_key)
  end

  def verify_search_result
    result_count = find(@search_result_count_css).text.to_f
    expect(result_count).to be > 0
  end

  def close_notification

    click_button @close_notification_text
  end

end