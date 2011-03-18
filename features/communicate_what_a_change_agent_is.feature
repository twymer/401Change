Feature: Discover what a Change Agent Is
  In order to understand what a change agent is
  As a visitor
  I want information about what a change agent is on the home page

  Scenario: Change agent overview
    Given I am on the home page
    Then I should see "What Are Change Agents?"

  Scenario: Seeking more information
    Given I am on the home page
    When I follow "what else change agents do"
    Then I should be on the about change agents page
    And I should see a description

