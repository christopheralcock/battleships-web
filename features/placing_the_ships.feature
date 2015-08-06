Feature: placing the ships
  In order to start playing the game
  As a Player
  I want to be able to place my ships

  Scenario: Placing an aircraft carrier
    Given I am on the new game page
    And I fill in "coordinate" with "A1"
    When I press "Submit"
    Then I should see "Aircraft Carrier placed!"

  Scenario: Placing a battleship
    Given I am on the battleship page
    And I fill in "coordinate2" with "F1"
    When I press "Submit"
    Then I should see "Battleship placed!"
