Feature: Client with no credits clicks book sessionIn order to book a session
  As a client on the counselor details page
  I want to be notified that I need to purchase credits in order to book a session

  - given that I am a client with no credits
  - when I click book a session
  - then I see a message that I need to purchase credits to book a session
  - and I see a link to purchase credits
  - when I click that link I am taken to the purchase credits page

  Scenario: When client has no session credits
    Given it is currently "2011-11-11"
    And I am signed in as the following client:
      | first_name      | John                |
      | last_name       | Travolts            |
      | email           | greaser@example.com |
      | session credits | 0                   |
    And the following counselor:
      | first name | Ramona  |
      | last name  | Flowers |
    When I am on the client dashboard page
    And I follow "Counselors"
    And I follow "Find a counselor"
    And I fill in "search" with "Ramona"
    And I press "Search"
    And I follow "Ramona Flowers"
    And I press "7:00 PM" in the "Wed, Nov 16" list
    Then I should be on the new client account purchase page
    And I should see "You do not have enough session credits. Please purchase more."
