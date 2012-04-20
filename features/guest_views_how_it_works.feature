Feature: Guest views how iCouch works
  In order to understand the iCouch process
  As a guest on the landing page
  I want to read how it works information

  Scenario: success
    Given I am on the homepage
    And I follow "READ MORE ABOUT HOW IT WORKS"
    Then I should be on the how_icouch_works page
