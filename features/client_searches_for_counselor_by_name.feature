Feature: Client Searches For A Counselor By Name
  In order to get counseling remotely
  As a Client on the landing page
  I want to find a counselor

  - click find counselor
  - I am taken to the find a counselor page
  - provide counselor name
  - click search
  - I am taken to the search results page
  - I see a list of counselors matching my search criteria
  - For each counselor I see
  -- photo
  -- name
  -- location
  -- language
  -- first 3 specialties

  Background:
    Given I am signed in as a client
    And the following counselor:
      | first name        | Todd                |
      | last name         | Patel               |
      | email             | matthew@example.com |
      | status            | pending             |
      | city              | Jacksonville        |
      | state_or_province | Florida             |
      | country           | US                  |
      | languages         | en, es              |
    And the following issues:
      | name      |
      | anger     |
      | fears     |
      | parenting |
      | zoos      |
    And those issues belong to that counselor

    And the following counselor:
      | first name        | Todd             |
      | last name         | Ingram           |
      | email             | todd@example.com |
      | status            | active           |
      | city              | Jacksonville     |
      | state_or_province | Florida          |
      | country           | US               |
      | languages         | en               |
    And the following issues:
      | name      |
      | abuse     |
      | fears     |
      | parenting |
      | suicide   |
    And those issues belong to that counselor
    And that counselor has this avatar:
      | file name | avatar.png |

    And the following counselor:
      | first name        | Lucas             |
      | last name         | Lee               |
      | email             | lucas@example.com |
      | status            | active            |
      | city              | Neptune Beach     |
      | state_or_province | Florida           |
      | country           | US                |
      | languages         | en                |
    And the following issues:
      | name      |
      | abuse     |
      | academics |
    And those issues belong to that counselor
    And I am on the homepage
    When I follow "Counselors"
    And I follow "Find a counselor"

  Scenario: counselor is found
    When I fill in "search" with "Todd"
    And I press "Search"
    Then I should see "Todd Ingram"
    And I should see an image named "avatar.png"
    And I should see "Jacksonville, Florida" in the "Todd Ingram" section
    And I should see "English" in the "Todd Ingram" section
    And I should see "Abuse, Fears/Phobias, Children/Parenting"
    But I should not see "Suicide"
    And I should not see "Todd Patel"
    And I should not see "Lucas Lee"

  Scenario: no counselor is found
    When I fill in "search" with "Johnny"
    And I press "Search"
    Then I should see "No results for Johnny"
