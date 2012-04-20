@http://www.pivotaltracker.com/story/show/4713733 @clients
Feature: Client views counselor details page
  In order to find a counselor that fits my needs
  As a Client on the counselor list page
  I want to view details for a counselor

  - click counselor name
  - I am taken to the counselor details page
  - I see
  -- name
  -- location
  -- language
  -- specialties
  -- education
  -- certifications
  -- license location
  - do not display blank information the counselor has not provided
  - available time slots for the counselor

  Scenario:
    Given the following counselor:
      | first name          | Ramona                   |
      | last name           | Flowers                  |
      | city                | Toronto                  |
      | country             | CA                       |
      | licensed            | true                     |
      | license number      | 192238                   |
      | licensing authority | New York                 |
      | other issues        | Flakiness                |
      | languages           | en, es                   |
      | other languages     | Pig latin                |
      | other religions     | Flying Spaghetti Monster |
      | certifications      | Your mom                 |
    And the following issues:
      | name      |
      | abuse     |
      | academics |
    And those issues belong to that counselor
    And I am signed in as a client
    And I have a session with "Ramona Flowers"
    When I follow "Counselors"
    And I follow "Ramona Flowers"
    Then I should see "Ramona Flowers"
    And I should see "Toronto, CA"
    And I should see "New York"
    And I should see "English, Spanish, Pig latin"
    And I should see "Abuse, School/Academics, Flakiness"
    And I should see "Your mom"
