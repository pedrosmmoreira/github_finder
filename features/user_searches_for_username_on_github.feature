Feature: User searches for Github username
  As a user interested in programming
  I want to search for a Github username
  In order to find that user's preferred programming language

  Scenario: Search Github for username
    Given I am interested in programming
    When I search for a Github username
    Then I should see the preferred programming language for that user
