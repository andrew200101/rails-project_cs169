Feature: Get a list of reps for a given address

Background: We are on the representative search page

Scenario: check rep database
  Given I am on the Texas search page
  Then 31 representatives should exist in the db
  When I go to the California search page
  Then the db should not contain dupes