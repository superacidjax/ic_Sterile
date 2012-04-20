Feature: Guest views therapist information
  In order to feel confident about therapist quality
  As a guest on the landing page
  I want to read therapist information

  Scenario: success
    Given I am on the homepage
    And I follow "READ MORE ABOUT OUR THERAPISTS"
    Then I should be on the about_icouch_therapists page
