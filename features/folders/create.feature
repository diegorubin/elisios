Feature: Folders
  Background:
    Given No folders

  Scenario: Create new folder
    Given I'm at dashboard page
    When I fill input "path" with "/etc"
    And I click in add button
    Then new folder "/etc" should be created
    And clear the input "path"

  Scenario: Not create folder without path
    Given I'm at dashboard page
    When I fill input "path" with ""
    And I click in add button
    Then not create a new folder
    And show message "O diretório não pode estar em branco"
