@http://www.pivotaltracker.com/story/show/4713685 @admin
Feature: Admin Approves New Counselor
  In order to allow new counselors to work through iCouch
  As an Admin on the counselor details page
  I want to approve a new counselor

  - click approve
  - I am taken to the counselors list
  - Account status is changed to Approved
  - The approved counselor's status is Approved in the counselors list
  - I click the counselor's name
  - I am taken to the counselor details page
  - The counselor's status is listed as approved
  - The counselor can sign in to the system

  Scenario: success
    Given the following counselor:
      | first name                     | Ramona             |
      | status                         | submitted          |
      | email                          | ramona@example.com |
      | skype_id                       | my_skype_id        |
      | gender                         | Female             |
      | undergraduate university       | undergrad u        |
      | undergraduate degree           | undergrad degree   |
      | graduate university            | grad u             |
      | graduate degree                | grad degree        |
      | doctoral university            | doc u              |
      | doctoral degree                | doc degree         |
      | certifications                 | certs              |
      | license number                 | lic123             |
      | licensing_authority            | auth123            |
      | license suspension explanation | lic sus expl       |
      | license suspension authority   | lic sus auth       |
      | license suspension date        | lic sus date       |
      | employer id number             | emp id no          |
      | licensed                       | true               |
      | license suspended              | false              |
      | status                         | submitted          |
      | other issues                   |                    |
      | other languages                |                    |
      | other religions                |                    |
      | languages                      |                    |
      | religions                      |                    |
    And I am signed in as an admin
    When I follow "Counselors"
    And I follow "Ramona"
    Then I should see "ramona@example.com"
    And I should see "my_skype_id"
    And I should see "undergrad u"
    And I should see "undergrad degree"
    And I should see "grad u"
    And I should see "grad degree"
    And I should see "certs"
    And I should see "lic123"
    And I should see "auth123"
    And I should see "Female"
    And I press "Approve"
    Then I should see "Active" in the "Ramona" row
    When I follow "Ramona"
    Then I should see "Active"
    When I follow "Sign out"
    And I follow "Sign in"
    And I fill in "Email" with "ramona@example.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Signed in successfully"
