Feature: Branding

    So that I know what site I'm on
    As any user
    I want to see site branding

    Scenario: Show site masthead
        Given I am on the homepage
        Then I should see the site logo
        And the see the site title 
