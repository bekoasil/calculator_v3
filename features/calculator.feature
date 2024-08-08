Feature: Calculator Operations
  As a user
  I want to perform basic arithmetic operations
  So that I can do calculations quickly

  Scenario Outline: Perform arithmetic operations
    Given I have entered <first_number> as the first number
    And I have entered <second_number> as the second number
    When I choose to perform "<operation>"
    Then the result should be <result>

    Examples:
      | first_number | second_number | operation | result |
      | 5            | 3             | add       | 8      |
      | 28           | 17            | add       | 45     |
      | 10           | 4             | subtract  | 6      |
      | 56           | 11            | subtract  | 45     |
      | 6            | 7             | multiply  | 42     |
      | 8            | 9             | multiply  | 72     |
      | 15           | 3             | divide    | 5      |
      | 156          | 3             | divide    | 52     |
      | 1242         | 3             | divide    | 414     |
      

  Scenario: Division by zero
    Given I have entered 10 as the first number
    And I have entered 0 as the second number
    When I choose to perform "divide"
    Then I should see an error message "Division by zero is not allowed"
