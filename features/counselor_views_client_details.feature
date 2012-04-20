@http://www.pivotaltracker.com/story/show/14274987 @counselors
Feature: Counselor views client details
  In order to prepare for sessions with a clients
  As a counselor on the client list page
  I want to view a client detail page

  - Given that I am signed in as a counselor
  - And I have sessions booked
  - And I am on the client list page
  - When I click a client's name
  - I am taken to the client details page
  - And I see personal/session preference information for the client

  Scenario:
    Given it is currently 2011-01-01
    Given I am signed in as a counselor
    And the following client:
      | first name                     | Clive               |
      | last name                      | Dieter              |
      | city                           | Chicago             |
      | state or province              | Illinois            |
      | postal code                    | 60661               |
      | country                        | US                  |
      | birthday                       | 2000-01-01          |
      | languages                      | en, fr              |
      | education                      | Some College        |
      | employment status              | full_time           |
      | emergency contact name         | Rebecca Black       |
      | relationship status            | single              |
      | previously counseled           | true                |
      | currently counseled            | false               |
      | other issues                   | Front or back seat? |
      | religions                      | catholicism         |
      | emergency contact phone number | 867 5309            |
      | emergency contact relationship | My Girl Friday      |
      | emergency contact permitted    | true                |
    And the following issues:
      | name     |
      | anger    |
      | bullying |
    And those issues belong to that client
    And I have a session with "Clive Dieter"
    When I go to my list of clients
    And I follow "Clive Dieter"
    Then I should see "Clive Dieter"
    And I should see "Chicago, Illinois" in the "Location" section
    And I should see "11" in the "Age" section
    And I should see "Some College" in the "Education" section
    And I should see "Rebecca Black" in the "Emergency Contact" section
    And I should see "867 5309" in the "Emergency Contact" section
    And I should see "My Girl Friday" in the "Emergency Contact" section
    And I should see "Yes" in the "Counseling Before" section
    And I should see "No" in the "Currently In Therapy" section
    And I should see "Anger, Bullying" in the "Special Needs" section
    And I should see "Front or back seat?" in the "Special Needs" section
    And I should see "English, French" in the "Languages" section
    And I should see "Catholicism" in the "Religious Preferences" section
