Feature: In order to know that I cannot book sessions with a counselor anymore
  As a client on the counselor show page
  I want to see their status

  - given an inactive counselor
  - when I view their show page
  - then I see their status as inactive

  Scenario:
    Given I am signed in as a client
    And the following counselors:
      | first name | last name   | status      |
      | Roger      | Klotz       | active      |
      | Patty      | Mayonaise   | active      |
      | Mister     | Deactivated | deactivated |
    And I have a session with "Patty Mayonaise"
    And I have a session with "Mister Deactivated"
    And I am on the homepage
    When I follow "Counselors"
    Then I should see "My Counselors"
    And I should see "Patty Mayonaise"
    And I should see "Mister Deactivated"
    And I should not see "Roger Klotz"
    When I follow "Mister Deactivated"
    Then I should not see "Book an available session"
    And I should see "Counselor is inactive."
