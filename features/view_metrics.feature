@javascript @vcr
Feature: View A Projects Metrics

  As a project supervisor
  So that I can keep tabs on another project
  I want to view that projects metrics

  Background:
    Given the following projects exist:
      | name         |
      | LocalSupport |
      | WebsiteOne   |
    And they have the following metric configs:
      | project      | metric_name  | key | value                                         |
      | LocalSupport | code_climate | url | https://github.com/AgileVentures/LocalSupport |
      | WebsiteOne   | code_climate | url | https://github.com/AgileVentures/WebsiteOne   |
      | LocalSupport | github       | url | https://github.com/AgileVentures/LocalSupport |
      | WebsiteOne   | github       | url | https://github.com/AgileVentures/WebsiteOne   |
    And they have the following metric samples:
      | project      | metric_name  | score |
      | LocalSupport | code_climate | 3.1   |
      | WebsiteOne   | code_climate | 3.4   |
      | LocalSupport | github       | 0.7   |
      | WebsiteOne   | github       | 0.6   |

  Scenario: view metric for projects
    When I am on the projects page
    Then I should see "3.1" within "#LocalSupport_code_climate_metric"
    And I should see "3.4" within "#WebsiteOne_code_climate_metric"
    And I should see "0.7" within "#LocalSupport_github_metric"
    And I should see "0.6" within "#WebsiteOne_github_metric"

  Scenario: update metrics for projects
    Given A project update job has been run
    When I am on the projects page
    Then I should see "3.2" within "#LocalSupport_code_climate_metric"
    And I should see "3.5" within "#WebsiteOne_code_climate_metric"
    And I should see "0.6328125" within "#LocalSupport_github_metric"
    And I should see "0.2803191489361702" within "#WebsiteOne_github_metric"
#    And I debug

    # why are we calculating score and image on the fly and memo-izing them?  makes code more complex
    # trading off storage?  if we're not worried about storage we can drop all the gem internal memo-ization

    # that attr_encryted thing that armando is talking about makes sense on config model

    # [ ] need to update the code climate gem to provide svg
    # [ ] need to review tests for github gem - get latest version hooked up and deployed
    # [ ] review all of rails app

    # configuration of ProjectMetrics gem might even be redundant


    # should we store the metric gem version (if we're storing score and image?, even just raw data might change ...)

    # is Armando's desire to store raw_data related to an implicit requirement to be able
    # to apply new metrics retrospectively?


  #      | code_climate | <svg xmlns="http://www.w3.org/2000/svg" width="110" height="20"><linearGradient id="a" x2="0" y2="100%"><stop offset="0" stop-color="#bbb" stop-opacity=".1"/><stop offset="1" stop-opacity=".1"/></linearGradient><rect rx="3" width="110" height="20" fill="#555"/><rect rx="3" x="82" width="28" height="20" fill="#97CA00"/><path fill="#97CA00" d="M82 0h4v20h-4z"/><rect rx="3" width="110" height="20" fill="url(#a)"/><g fill="#fff" text-anchor="middle" font-family="DejaVu Sans,Verdana,Geneva,sans-serif" font-size="11"><text x="42" y="15" fill="#010101" fill-opacity=".3">code climate</text><text x="42" y="14">code climate</text><text x="95" y="15" fill="#010101" fill-opacity=".3">3.5</text><text x="95" y="14">3.5</text></g></svg> |
