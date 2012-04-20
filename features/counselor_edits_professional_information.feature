Feature: Counselor edits professional information
  In order to be approved
  As a counselor
  I want edit my professional information

  Scenario:
    Given I am signed in as the following counselor:
      | first name               | Joey                                     |
      | last name                | Ramone                                   |
      | birthday                 | 1988-01-01                               |
      | employer id number       | 42                                       |
      | gender                   | Male                                     |
      | undergraduate university | NYU                                      |
      | country                  | US                                       |
      | state_or_province        | Florida                                  |
      | certifications           | CCNA, RHCA, CISSP, CEH                   |
      | licensed                 | false                                    |
      | license number           |                                          |
      | licensing authority      |                                          |
      | license suspended        | false                                    |
      | counselor bio            | In West Philadelphia, born and raised... |
    And the following issues:
      | name      |
      | abuse     |
      | academics |
    And those issues belong to that counselor
    And the following issue:
      | name | anger |
    When I follow "My account"
    And I follow "Professional Information"
    And I fill in "counselor_employer_id_number" with "84"
    And I fill in "University" with "Harvard" in the "Graduate" section
    And I fill in "Degree" with "Neckties" in the "Graduate" section
    And I fill in "Qualifications" with "All of them, plus even more."
    And I choose "Yes" within "//dd[@class='radios license_info']"
    And I fill in "counselor[counselor_bio]" with "...to sit on my throne as the Prince of Bel Air"
    And I press "Save Preferences"
    Then the "counselor_employer_id_number" field should contain "84"
    And the "University" field should contain "Harvard"
    And the "Degree" field should contain "Neckties"
    And the "Qualifications" field should contain "All of them, plus even more."
    And the "Yes" checkbox within "//dd[@class='radios license_info']" should be checked
    And the "counselor[counselor_bio]" field should contain "...to sit on my throne as the Prince of Bel Air"
