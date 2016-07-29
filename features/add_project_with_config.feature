Feature: add project and its config/credentials info

  As a project supervisor
  So that I can keep tabs on another project
  I want to add a project and specify credentials for scraping its metrics

Scenario: add project with config info for CodeClimate gem

  Given I am on the projects page
  When I follow "New Project"
  And I fill in "name" with "Test Project"
  And I enter new "Code climate" config values:
   | key   | value |
   | token | 12345 |
   | login | fox   |
  And I press "Submit"
  Then there should be a project "Test Project" with config values:
   | key   | value |
   | token | 12345 |
   | login | fox   |


