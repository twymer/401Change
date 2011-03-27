@wip1
Feature: Show needs on a map
  In order to find needs around me
  As a site visitor
  I would like to be able to see needs on a map

Background:
	Given the following needs
	| description                | latitude   | longitude          |
	| The Wizard Need Food Badly | 42.7309334 | -84.47629849999998 |
	| For Great Justice          | 42.733587  | -84.55545699999999 |
	
@nyi
@javascript
Scenario: Seeing needs on the map
	Given I am on the home page
	Then I should be able to see all the needs on the map	

