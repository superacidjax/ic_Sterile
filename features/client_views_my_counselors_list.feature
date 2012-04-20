@http://www.pivotaltracker.com/story/show/14274985 @clients
Feature: Client views my counselors list
  In order to quickly review information on counselor I have a session with
  As a client on the counselors page
  I want to view a list of my counselors

  - Given that I am signed in as a client
  - And I have sessions booked
  - And I am on the counselor list page
  - When I click on my counselors
  - I am taken to the my counselors list page
  - And I see a list of counselors that I have booked sessions with

  Scenario: success
    Given I am signed in as a client
    And the following counselors:
      | first name | last name |
      | Roger      | Klotz     |
      | Patty      | Mayonaise |
    And I have a session with "Patty Mayonaise"
    And I am on the homepage
    When I follow "Counselors"
    Then I should see "My Counselors"
    And I should see "Patty Mayonaise"
    And I should not see "Roger Klotz"
