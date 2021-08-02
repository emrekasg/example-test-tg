Feature: demoss

  Background:
    Given user on the homepage


  Scenario Outline: navigate category and homepage scenario
    And clicks on "<category_name>"
    When clicks on app logo
    Then homepage should be opened
    Examples:
      | category_name            |
      | Elektronik               |
      | Ev & Yaşam               |
      | Anne & Bebek             |
      | Kozmetik & Kişisel Bakım |
      | Mücevher & Saat          |
      | Spor & Outdoor           |
      | Kitap, Müzik, Film, Oyun |
      | Petshop                  |
      | Otomotiv & Motosiklet    |

  Scenario Outline: search scenario
    When search for "<search_key>"
    Then user should see number of search results
    And user should see result text "<search_key>"
    Examples:
    |search_key|
    |oyuncak   |
    |araba     |
    |telefon   |
    |süpürge   |
    |robot     |
    |saat      |
    
  Scenario: negative scenario
    When search for "ğüişçö123123123123"
    Then user should see number of search results 
    And user should see result text "ğüişçö123123123123" 

