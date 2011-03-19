Feature: Become a Change Agent
  In order to share the things I do to change the world
  As a visitor
  I want to be become a change agent

Scenario: Navigating to the Become a Change Agent Page
  Given I am on the home page
  When I follow "Become a change agent"
  Then I should be on the become a change agent page



Scenario: Adding a Change without email
  Given I am on the become a change agent page
  When I press "Complete Registration"
  Then email should have an error message
  Then I should get told that registration failed
  Then 0 change agents should exist


Scenario: Adding a Change Agent
  Given I am on the become a change agent page
  When properly fill out the registration
  Then I should get confirmation that registration succeeded
