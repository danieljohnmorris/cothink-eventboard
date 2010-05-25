Feature: Navigate to the homepage from anywhere

    So that I can get back to the start
    As any user
    I want to be able to navigate to the homepage

    Scenario: Go home thru logo link id
        Given I am not on the homepage
        And I click the site logo
        Then I should be on the homepage
        
    Scenario: Go home thru link title
        Given I am not on the homepage
        And I follow "Back to the homepage"
        Then I should be on the homepage