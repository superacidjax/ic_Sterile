Feature: Client Views A Counselor's Available Times For Next Week
In order to find a session time with a counselor that matches my schedule
As a Client on the Counselor details page
I want to view a counselor's available times for the next week

- I see available times for next week
- click a day of the week
- I see available time slots for that day
- unavailable times are disabled
- already booked times are disabled

  Scenario:
    Given it is currently "2011-11-11"
    And the following counselor:
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
    Then I should see a "9:00 AM" button in the "Mon, Nov 14" list
    And I should see a "10:00 AM" button in the "Mon, Nov 14" list
