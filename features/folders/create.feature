Feature: Folders
  Scenario: Create new folder
    Given I'm at dashboard page
    When I fill input "path" with "/etc"
    And I click in add button
    Then new folder "/etc" should be created

