@http://www.pivotaltracker.com/story/show/20369965
Feature: Client edits avatar
  In order to keep my avatar up to date
  As a client editing my personal information
  I want to edit my avatar

  - On edit personal information
  - Select a new avatar image
  - Press save
  - edit page displays newly uploaded image

  Background:
    Given I am signed in as the following client:
      | first_name | Barry                  |
      | last_name  | Zuckerkorn             |
      | email      | zuckerkorn@example.com |
      | password   | password               |
    When I follow "My account"
    And I follow "Personal Information"

  Scenario: success
    When I attach the file "spec/fixtures/scott.png" to "Avatar"
    And I press "Save"
    Then I should see "Successfully updated your information."
    When I follow "Personal Information"
    Then I should see an image named "scott.png"
