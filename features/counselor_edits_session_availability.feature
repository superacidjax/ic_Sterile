@http://www.pivotaltracker.com/story/show/4713668 @sessions
Feature: Counselor edits session preferences
  In order to set up available sessions
  As a counselor on my dashboard
  I want edit my session preferences

  Scenario:
    Given I am signed in as the following counselor:
      | first name                     | Ramona                   |
      | last name                      | Flowers                  |
      | licensed                       | true                     |
      | license number                 | 192238                   |
      | licensing authority            | Toronto Psyche           |
      | license suspended              | true                     |
      | license suspension date        | 2010-07-23               |
      | license suspension authority   | Toronto Syche            |
      | license suspension explanation | Drugs drugs drugs        |
      | other issues                   | Flakiness                |
      | languages                      | en, es                   |
      | other languages                | Pig latin                |
      | other religions                | Flying Spaghetti Monster |
    And the following issues:
      | name      |
      | abuse     |
      | academics |
    And those issues belong to that counselor
    And the following issue:
      | name | anger |
    When I follow "My account"
    And I follow "Session Preferences"
    And I uncheck "Abuse"
    And I check "Anger"
    And I check "1-2am"
    And I uncheck "Spanish"
    And I check "French"
    And I fill in "counselor_other_religions" with ""
    And I check "Buddhism"
    And I press "Save"
    Then I should see "Session preferences updated"
    And the "Anger" checkbox should be checked
    And the "Abuse" checkbox should not be checked
    And the "counselor_other_religions" field should not contain "Flying Spaghetti Monster"
    And the "counselor_other_languages" field should contain "Pig latin"
