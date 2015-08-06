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
    And I fill in "coordinate2" with "A2"
    When I press "Submit"
    Then I should see "Battleship placed!"

  Scenario: Placing a cruiser
    Given I am on the cruiser page
    And I fill in "coordinate3" with "A3"
    When I press "Submit"
    Then I should see "Cruiser placed!"

  Scenario: Placing a destroyer
    Given I am on the destroyer page
    And I fill in "coordinate4" with "A4"
    When I press "Submit"
    Then I should see "Destroyer placed!"

  Scenario: Placing a submarine
    Given I am on the submarine page
    And I fill in "coordinate5" with "A5"
    When I press "Submit"
    Then I should see "Submarine placed!"
