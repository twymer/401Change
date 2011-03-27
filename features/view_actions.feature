@wip1
Feature: View actions page
  Tests the ability to view actions

Scenario: Navigate to Actions page
  Given I am on the home page
  When I follow "View Actions"
  Then I should be on the view actions page

