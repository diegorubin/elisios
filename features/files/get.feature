Feature: Get File
  Background:
    Given only Rails.root folder created

  Scenario: Download Gemfile
    Given I'm at dashboard page
    When I click in Rails.root folder
    And I click in Gemfile.lock file
    Then get Gemfile.lock
