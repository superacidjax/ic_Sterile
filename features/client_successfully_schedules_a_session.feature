@http://www.pivotaltracker.com/story/show/4713731 @sessions
Feature: Client successfully schedules a session
  In order to get counseling on a specific date and time
  As a Client on the Counselor details page
  I want to schedule a session

  Scenario: When client has session credits
    Given it is currently "2011-11-11"
    And I am signed in as the following client:
      | first_name      | John               |
      | last_name       | Travolts           |
      | email           | client@example.com |
      | session credits | 2                  |
    And the following counselor:
      | first name | Ramona                |
      | last name  | Flowers               |
      | email      | counselor@example.com |
    When I am on the client dashboard page
    And I follow "Counselors"
    And I follow "Find a counselor"
    And I fill in "search" with "Ramona"
    And I press "Search"
    And I follow "Ramona Flowers"
    Then I should not see "Skype id"

    When I press "7:00 PM" in the "Wed, Nov 16" list
    Then I should not see a "7:00 PM" button in the "Wed, Nov 16" list
    And "counselor@example.com" should receive an email with subject "John Travolts has booked an iCouch session with you"
    And "client@example.com" should receive an email with subject "Enjoy your iCouch session with Ramona Flowers!"

    When I follow "Dashboard"
    Then I should see "1 Credit Left" in the "Credits" section

    When I follow "Ramona Flowers" within "//dl[@class='session']/dd"
    Then I should see "Skype ID"
