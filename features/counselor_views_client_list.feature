@http://www.pivotaltracker.com/story/show/14274989 @counselors
Feature: Counselor views client list
  In order to prepare for sessions with a client
  As a counselor
  I want view a list of my clients

  - Given that I am signed in as a counselor
  - And I have sessions booked
  - When I click clients I am taken to the clients list page
  - And I see a list of my clients

  Background:
    Given I am signed in as a counselor
    And the following client:
      | first name        | Clive  |
      | last name         | Dieter |
      | city              | Boston |
      | state or province | MA     |
      | languages         | en, fr |
    And the following issues:
      | name     |
      | anger    |
      | bullying |
    And those issues belong to that client
    And the following client:
      | first name        | Eugene    |
      | last name         | Freders   |
      | city              | Chicago   |
      | state or province | IL        |
      | languages         |           |

  Scenario:
    When I have a session with "Clive Dieter"
    And I have a session with "Eugene Freders"
    And I am on the homepage
    When I follow "Clients"
    Then I should see "Clive Dieter"
    And I should see "Eugene Freders"
    And I should see "Anger, Bullying" in the section before "Clive Dieter"
    And I should see "Boston, MA" in the section before "Clive Dieter"
    And I should see "English, French" in the section before "Clive Dieter"
    And I should not see "You haven't booked any sessions with clients yet. Update your schedule"

  Scenario:
    When I am on the homepage
    And I follow "Clients"
    Then I should see "You haven't booked any sessions with clients yet. Update your schedule"
    And I should not see "Clive Dieter"
    And I should not see "Eugene Freders"
