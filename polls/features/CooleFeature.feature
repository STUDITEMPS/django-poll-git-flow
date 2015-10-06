# Created by trungphanan at 05.03.15
Feature: Vote
  #  Enter feature description here

  Scenario:  Tests the voting functionality
    Given Choice id "1"
    When vote for choice
    Then new vote is greater then old vote
