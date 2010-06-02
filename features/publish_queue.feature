Feature: Publish Queue

    So that I can a) scape & draft events I'm not sure of yet, and b) Remove events from the site without deleting them
    As a site admin
    I want to control whether events are public on the site

    Scenario: Default publish state is true/public
        Given I login as an Admin
        When If I post a new event
        And do not touch the published state
        Then a new event should be created 
        And the published state should be "Published"
        And I should see the event on the public site
    
    Scenario: Creating a draft shouldn't publish
        Given I login as an Admin
        When I post a new event 
        And set the published state to "Draft"
        Then a new event should be created
        And the published state should be "Draft"
        And I should see the event on the public site
    
    Scenario: If editing and not changing publish state, leave it well alone!    
        Given I login as an Admin
        When I edit an event
        And I change the published setting
        And save the event
        Then the published setting should be updated

        Scenarios: Change published setting
            | published_before | published_after |
            | no               | yes             |
            | yes              | no              |

    Scenario: If editing, and change publish state, save updated state
        Given I login as an Admin
        When I edit an event
        And I leave the published setting alone
        And save the event
        Then the published setting should be unchanged
    
        Scenarios: Leave change published setting alone
            | published_before | published_after |
            | no               | no              |
            | yes              | yes             |