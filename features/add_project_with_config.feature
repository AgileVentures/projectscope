Feature: add project and its config/credentials info

  As a project supervisor
  So that I can keep tabs on another project
  I want to add a project and specify credentials for scraping its metrics

Scenario: add project without specifying credentials

  Given I am on the projects page
  When I follow "New Project"
  And I fill in "name" with "Test Project"
  And I f
  And I press "Submit"
  Then project "Test Project" should exist

