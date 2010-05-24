Feature: Filter events with tags

    Assorted tasks to navigate around the site

    Scenario: Go home
        Given I am not on the homepage
        And I click the site logo
        Then I should go to the homepage