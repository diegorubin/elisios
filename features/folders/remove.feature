Feature: Remove folder
  Background:
    Given There is the "/etc" folder created

  Scenario: Remove
    Given I'm at dashboard page
    When I click in remove button
    Then folder "/etc" should be removed
