@http://www.pivotaltracker.com/story/show/4713686 @counselors
Feature: Admin Views Counselor Details Page
  In order to vet counselors
  As an Admin on the pending counselors list page
  I want to view the details page for a counselor

  - click counselor name
  - I am taken to the counselor details page
  - I see counselor
  -- First Name
  -- Last Name
  -- Phone Number
  -- Time Zone
  -- City
  -- State
  -- Province or Non-US State
  -- Zip/Postal Code
  -- Country
  -- Email Address
  -- Certifications
  -- License number
  -- License suspension/incident information
  -- Specialties
  -- Languages
  -- Religions
  -- Session Preferences

  Scenario:
    Given the following counselor:
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
    When I am signed in as an admin
    And I follow "Counselors"
    And I follow "Ramona"
    Then I should see "Ramona"
    And I should see "Flowers"
    And I should see "192238"
    And I should see "Toronto Psyche"
    And I should see "2010-07-23"
    And I should see "Toronto Syche"
    And I should see "Drugs drugs drugs"
    And I should see "Abuse, School/Academics, Flakiness"
    And I should see "English, Spanish, Pig latin"
    And I should see "Flying Spaghetti Monster"
