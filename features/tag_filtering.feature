Feature: Filter events with tags

    So that I can see more appropriate upcoming events to me
    As an event goer
    I want to filter events by available tags I'm interested in

    Scenario: Select a tag
        Given I am on the homepage
        When I click a tag
        Then I should see the tag highlighted
        And I should see the events update
        
    Scenario: Remove a tag
        Given I am on the homepage
        When I click a tag's remove link
        Then I should not see the tag highlighted
        And I should see the events update