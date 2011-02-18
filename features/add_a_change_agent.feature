Feature: Add a Change Agent
  In order to publicize an agent of change
  As a visitor
  I want to be able to add a change agent

Scenario: Navigating to the Add Change Agent Page
  Given I am on the home page
  When I follow "Add a Change Agent"
  Then I should be on the add a change agent page

Scenario: Adding a Change Agent Happy Path
  Given I am on the add a change agent page
  When I fill in "Who Are They?" with "A change agent"
  And I fill in "Where Are They On The Web?" with "http://www.google.com"
  And I fill in "What Do They Do?" with "awesome stuff"
  And I fill in "Why Should Someone Support Them?" with "Because they are friggen awesome!"
  And I press "Add Change Agent"
  Then I am on the change agent added page
  And change agents should exist with the following values:
  | Name           | What They Do  | Why You Should Support Them       | Home Page             |
  | A change agent | awesome stuff | Because they are friggen awesome! | http://www.google.com |


Scenario: Adding a Change Agent Sad Path
  Given I am on the add a change agent page
  When I press "Add Change Agent"
  Then I am on the add a change agent page
  And no change agents should exist
  And I should see "Please provide a name for this Change Agent."
  And I should see "Please provide the Change Agents home page. This can be on Charity Navigator, Facebook or anywhere else."
  And I should see "Please provide a short description of what this change agent does."
  And I should see "Please explain why someone would want to support this Change Agent"


