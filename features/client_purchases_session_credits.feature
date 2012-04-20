@http://www.pivotaltracker.com/story/show/20240077 @sessions
Feature: Client purchases session credits
  In order to get counseling on a specific date and time
  As a Client on the purchase session credits page
  I want to purchase 1, 2 or 4 session credits at a time

  - I'm on the dashboard
  - click purchase session credits
  - click on "Purchase 1 Session Credit"
  - I'm taken to the Paypal Checkout
  - Fill in my Paypal username/password or Credit Card Info
  - Click on Buy
  - I am taken to my dashboard
  - I see my total Session Credits increased by 1

  Scenario: With 1 Session Credit
    Given I am signed in as the following client:
      | first_name      | John                |
      | last_name       | Travolts            |
      | email           | greaser@example.com |
      | session credits | 1                   |
    When I am on the client dashboard page
    Then I should see "1 Credit Left" in the "Credits" section

  Scenario: With 2 Session Credits
    Given I am signed in as the following client:
      | first_name      | John                |
      | last_name       | Travolts            |
      | email           | greaser@example.com |
      | session credits | 2                   |
    When I am on the client dashboard page
    Then I should see "2 Credits Left" in the "Credits" section

  Scenario: With 0 Session Credits
    Given I am signed in as the following client:
      | first_name      | John                |
      | last_name       | Travolts            |
      | email           | greaser@example.com |
    When I am on the client dashboard page
    Then I should see "0 Credits Left" in the "Credits" section
