@http://www.pivotaltracker.com/story/show/12164119 @clients
Feature: Client edits personal information
  In order to keep my information current
  As a client
  I want to edit my personal information

  Background:
    Given I am signed in as the following client:
      | first_name | Barry                  |
      | last_name  | Zuckerkorn             |
      | email      | zuckerkorn@example.com |
      | password   | password               |
    When I follow "My account"
    And I follow "Personal Information"

  Scenario: success
    When I choose "Male" in the "Gender" section
    And I choose "Single" in the "Relationship status" section
    And I choose "Full-time" in the "Employment status" section
    And I choose "Some college" in the "Education" section
    And I press "Save"
    Then I should see "Successfully updated your information."
