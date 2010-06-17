Feature: Star events

	So that I can save events I'm interested in and show favour
	As a event goer
	I want to star events

    Scenario: Star an event
        Given I am on an event page
		And the star is dimmed
        When I click the star
        Then I should see the star highlighted

    Scenario: Unstar an event
        Given I am on an event page
		And the star is bright
        When I click the star
        Then I should see the star dimmed

    Scenario Outline: See all starred events on my events page
        Given I have N starred events
        When I am on the my events page
        Then I should see N events listed

	Scenarios:
		| Amount |
		| 1		 |
		| 5 	 | 
		| 10 	 | 
		| 50 	 |
		| 500	 |
	 	
    Scenario: Don't see events if none starred!
        Given I don't have any starred events
        When I am on the my events page
        Then I should see "No starred events"
        And there should not be the following css ".event"

    Scenario: See a starred event on my events page
        Given I have starred an event
        When I am on the my events page
        Then I should see the event