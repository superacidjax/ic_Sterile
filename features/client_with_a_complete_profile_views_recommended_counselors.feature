Feature: Client With A Complete Profile Views Recommended Counselors
  In order to quickly connect with a counselor
  As a Client who has never booked a session on my dashboard
  I want to view recommended counselors

  - I see a list of recommended counselors that match my account settings
  - must match on at least one language
  - match on most specialties first
  - For each counselor I see
  -- photo
  -- name
  -- location
  -- language
  -- first 3 specialties

  Scenario:
    Given the following counselor:
      | first name | Ramona  |
      | last name  | Flowers |
    And the following client:
      | first name | julie             |
      | last name  | jenkins           |
      | email      | julie@example.com |
    And the following issue:
      | name | anger |
    And that issue belongs to that client
    And that issue belongs to that counselor
    And I am signed in as "julie@example.com"
    Then I should see "Ramona Flowers"

  Scenario: client has no preferred languages
    Given the following counselor:
      | first name | Ramona  |
      | last name  | Flowers |
      | languages  |         |
    And the following client:
      | first name | julie             |
      | last name  | jenkins           |
      | email      | julie@example.com |
    And the following issue:
      | name | anger |
    And that issue belongs to that client
    And that issue belongs to that counselor
    And I am signed in as "julie@example.com"
    Then I should not see "Ramona Flowers"
