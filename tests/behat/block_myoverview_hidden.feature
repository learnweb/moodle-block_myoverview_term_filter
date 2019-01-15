@block @block_myoverview_term_filter @javascript
Feature: The my overview block allows users to hide their courses
  In order to enable the my overview block in a course
  As a student
  I can add the my overview block to my dashboard

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email                | idnumber |
      | student1 | Student   | X        | student1@example.com | S1       |
    And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1        | 0        |
      | Course 2 | C2        | 0        |
      | Course 3 | C3        | 0        |
      | Course 4 | C4        | 0        |
      | Course 5 | C5        | 0        |
    And the following "course enrolments" exist:
      | user | course | role |
      | student1 | C1 | student |
      | student1 | C2 | student |
      | student1 | C3 | student |
      | student1 | C4 | student |
      | student1 | C5 | student |

  Scenario: Test hide toggle functionality
    Given I log in as "student1"
    When I click on ".coursemenubtn" "css_element" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    And I click on "Hide from view" "link" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    And I reload the page
    Then I should not see "Course 2" in the "Course overview" "block"
    And I log out

  Scenario: Test hide toggle functionality w/ favorites
    Given I log in as "student1"
    And I click on ".coursemenubtn" "css_element" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    And I click on "Star this course" "link" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    And I click on ".coursemenubtn" "css_element" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    And I click on "Hide from view" "link" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    When I reload the page
    Then I should not see "Course 2" in the "Course overview" "block"
    And I click on "All" "button" in the "Course overview" "block"
    And I click on "Starred" "link" in the "Course overview" "block"
    Then I should not see "Course 2" in the "Course overview" "block"
    And I click on "Starred" "button" in the "Course overview" "block"
    And I click on "Hidden" "link" in the "Course overview" "block"
    Then I should see "Course 2" in the "Course overview" "block"
    And I log out

  Scenario: Test show toggle functionality
    Given I log in as "student1"
    And I click on ".coursemenubtn" "css_element" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    And I click on "Hide from view" "link" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    When I click on "All" "button" in the "Course overview" "block"
    And I click on "Hidden" "link" in the "Course overview" "block"
    When I click on ".coursemenubtn" "css_element" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    And I click on "Show this course" "link" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    And I reload the page
    And I click on "Hidden" "button" in the "Course overview" "block"
    When I click on "All" "link" in the "Course overview" "block"
    Then I should see "Course 2" in the "Course overview" "block"
    And I log out

  Scenario: Test show toggle functionality w/ favorites
    Given I log in as "student1"
    And I click on ".coursemenubtn" "css_element" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    And I click on "Star this course" "link" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    And I click on ".coursemenubtn" "css_element" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    And I click on "Hide from view" "link" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    And I click on "All" "button" in the "Course overview" "block"
    And I click on "Hidden" "link" in the "Course overview" "block"
    And I should see "Course 2" in the "Course overview" "block"
    And I click on ".coursemenubtn" "css_element" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    And I click on "Show this course" "link" in the "//div[@class='card dashboard-card' and contains(.,'Course 2')]" "xpath_element"
    When I reload the page
    Then I should not see "Course 2" in the "Course overview" "block"
    And I click on "Hidden" "button" in the "Course overview" "block"
    And I click on "All" "link" in the "Course overview" "block"
    Then I should see "Course 2" in the "Course overview" "block"
    And I click on "All" "button" in the "Course overview" "block"
    And I click on "Starred" "link" in the "Course overview" "block"
    Then I should see "Course 2" in the "Course overview" "block"
    And I log out