Feature: Filters
  Background:
    Given an list of folders
      | path |
      | /dojo1 |
      | /dojo2 |
      | /dojo3 |
      | /dojo4 |
      | /dojo5 |

  Scenario: Search a folder
    Given I'm at dashboard page
    When I filter for "dojo1"
    And I click on "filtrar"
    Then folder "dojo2" should not be shown
    And only "dojo1" should be shown

  Scenario: Search a set of folders
    Given I'm at dashboard page
    When I filter for "dojo"
    And I click on "filtrar"
    Then should shown "5" folders
