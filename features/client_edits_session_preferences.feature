@http://www.pivotaltracker.com/story/show/12164115 @clients
Feature: Client edits session preferences
  In order to keep my information current
  As a client
  I want to edit my session preferences

  Background:
    Given I am signed in as the following client:
      | first_name | Oscar                     |
      | last_name  | Bluth                     |
    When I follow "My account"
    And I follow "Session Preferences"

  Scenario:
    When I fill in "Emergency contact name" with "Maeby Funke"
    And I fill in "Emergency contact phone number" with "212 664 7665"
    And I fill in "Emergency contact relationship" with "Grandniece"
    And I check "I give permission"
    And I check "Catholicism" in the "You would prefer a counselor familiar with the following" section
    And I check "English" in the "Your counselor should speak" section
    And I press "Save and Continue"
    Then I should see "Successfully updated your information."
    And I should be on the client_dashboard page
    When I follow "My account"
    And I follow "Session Preferences"
    Then the "Catholicism" checkbox should be checked
