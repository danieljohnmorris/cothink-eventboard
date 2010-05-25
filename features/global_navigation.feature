Feature: Filter events with tags

    Assorted tasks to navigate around the site

    Scenario: Go home thru logo link id
        Given I am not on the homepage
        And I click the site logo
        Then I should be on the homepage
        
    Scenario: Go home thru link title
        Given I am not on the homepage
        And I follow "Back to the homepage"
        Then I should be on the homepage