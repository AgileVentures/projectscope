@javascript @vcr
Feature: view a projects metrics

  As a project supervisor
  So that I can keep tabs on another project
  I want to view that projects metrics

  Background:
    Given the following projects exist:
      | name         |
      | LocalSupport |
    And they have the following metric configs:
      | metric_name  | key | value                                         |
      | code_climate | url | https://github.com/AgileVentures/LocalSupport |
    And they have the following metric samples:
      | metric_name  | raw_data                                            |
      | code_climate | <svg xmlns="http://www.w3.org/2000/svg" width="110" height="20"><linearGradient id="a" x2="0" y2="100%"><stop offset="0" stop-color="#bbb" stop-opacity=".1"/><stop offset="1" stop-opacity=".1"/></linearGradient><rect rx="3" width="110" height="20" fill="#555"/><rect rx="3" x="82" width="28" height="20" fill="#97CA00"/><path fill="#97CA00" d="M82 0h4v20h-4z"/><rect rx="3" width="110" height="20" fill="url(#a)"/><g fill="#fff" text-anchor="middle" font-family="DejaVu Sans,Verdana,Geneva,sans-serif" font-size="11"><text x="42" y="15" fill="#010101" fill-opacity=".3">code climate</text><text x="42" y="14">code climate</text><text x="95" y="15" fill="#010101" fill-opacity=".3">3.5</text><text x="95" y="14">3.5</text></g></svg> |

  Scenario: view metric for projects
    Given I am on the projects page
    Then I should see "3.2"

    # next step requires vcr install via bundle, hard code, then add another project
    # I guess any hard coding could do this, unless we explcitly set the metric values
    # in the background, which we could do

    # then we have a separate feature for updating all the metrics that hits the network ...

    # hmmm, would be nice if metric samples has score and image stored in them as well -
    # why are we calculating them on the fly and memo-izing them?  makes code more complex
    # trading off storage?