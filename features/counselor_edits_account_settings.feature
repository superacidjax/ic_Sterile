@http://www.pivotaltracker.com/story/show/4713669 @counselors
Feature: Counselor Edits Account Settings
  In order to keep my information current
  As a counselor on my dashboard
  I want to edit my account settings

  Background:
    Given the following counselor:
      | first name        | Ramona             |
      | email             | ramona@example.com |
      | city              | Toronto            |
      | state or province | Ontario            |
      | country           | CA                 |
      | postal code       | M4B 8ED            |
      | phone number      | 215 291 1003       |
      | skype_id          | my_skype_id        |
      | status            | active             |
    When I sign in as "ramona@example.com"
    And I follow "My account"

  Scenario: success
    When I fill in "City" with "Vancouver"
    And I fill in "Zip/Postal" with "V5K 1E2"
    And I fill in "Phone number" with "332 203 2382"
    And I press "Save settings"
    And I follow "Sign out"
    When I sign in as an admin
    And I follow "Counselors"
    And I follow "Ramona"
    Then I should see "Vancouver"
    And I should see "V5K 1E2"
    And I should see "332 203 2382"

  Scenario: has validation error
    When I fill in "Skype ID" with ""
    And I press "Save settings"
    Then I should see "can't be blank"
