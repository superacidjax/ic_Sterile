Feature: Guest views security information
  In order to feel safe on iCouch
  As a guest on the landing page
  I want to read security information

  Scenario: success
    Given I am on the homepage
    And I follow "READ MORE ABOUT OUR SECURITY"
    Then I should be on the about_icouch_security page
