@http://www.pivotaltracker.com/story/show/4713729 @sessions
Feature: Counselor Views Upcoming Sessions On Their Dashboard
  In order to make sure I don't miss upcoming sessions
  As a Counselor on my dashboard
  I want to see my upcoming sessions

  - I see list of my next 5 upcoming sessions
  - for each session I see
  -- client name
  -- date
  -- time

  Scenario:
    Given it is currently "2011-10-15"
    And I am signed in as a counselor
    And I have a session with "John Smith" on "2011-10-20" at 17 hours
    And I have a session with "Jane Smith" on "2011-10-17" at 11 hours
    When I follow "Dashboard"
    Then I should see "John Smith"
    And I should see "5:00 PM"
    And I should see "Jane Smith"
    And I should see "11:00 AM"
