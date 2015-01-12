Feature: Folder content
  Background:
    Given only "/home" folder created

  Scenario: List folder file
    Given I'm at dashboard page
    When I click in "/home" folder
    Then files should be listed

  Scenario: Ignore current folder in files list
    Given I'm at dashboard page
    When I click in "/home" folder
    Then folder "/." should not shown
