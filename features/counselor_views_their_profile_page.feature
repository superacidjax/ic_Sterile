@http://www.pivotaltracker.com/story/show/4713671 @counselors
Feature: Counselor Views Their Profile Page
  In order to review my profile page
  As a Counselor signed in to the system
  I want to view my counselor profile page

  Scenario:
    Given I am signed in as the following counselor:
      | first name        | Mary            |
      | last name         | Jane            |
      | city              | Jacksonville    |
      | state or province | Florida         |
      | country           | US              |
      | languages         | en, fr          |
      | religions         | catholicism     |
    And the following issues:
      | name     |
      | anger    |
      | bullying |
    And those issues belong to that counselor
    When I follow "Mary" within "//header"
    Then I should see "Mary Jane"
    And I should see "Jacksonville, Florida"
    And I should see "Catholicism" in the "Religious" section
    And I should see "Anger, Bullying" in the "Specialties" section
    And I should see "English, French" in the "Languages" section
