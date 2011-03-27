@nyi
Feature: Become a Change Agent
  In order to share the things I do to change the world
  As a visitor
  I want to be become a change agent

Scenario: Get to the Become a Change Agent Page
  Given I am on the home page
  When I follow "Become a change agent"
  Then I should be on the become a change agent page

Scenario: Adding a Change Agent Wrongly
  Given I am on the become a change agent page
  When I press "Complete Registration"
  Then I should get told that registration failed

Scenario: Adding A Change Agent Missing only his email
  Given I am on the become a change agent page
  When I register with an invalid email
  Then email should have an error message
  And name should not have an error message

Scenario: Adding a Change Agent
  Given I am on the become a change agent page
  When properly submit the registration
  Then I should get confirmation that registration succeeded
