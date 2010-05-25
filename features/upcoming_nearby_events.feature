Feature: Summary of upcoming events

    So that I see events I might want to attend
    As an event goer
    I want to see a summary of upcoming events in London

    Scenario: Show prompt to add event if no upcoming events
        Given I am on the homepage
        When there are no events happening soon
        Then I should see a message saying 'no upcoming events'
        And I should see a form for adding an event
            
    Scenario: Show upcoming events on homepage
        Given I am on the homepage
		And there are the following upcoming events
			| title | datetime | organiser | location |
			| "fun" | DateTime.new | "scientologists" | "here" |
			| "biz" | DateTime.new | "crazies" | "there" |
        Then I should see a list of upcoming events like this
			| title | datetime | organiser | location |
			| "fun" | "Tomorrow, 6pm" | "scientologists" | "here" |
			| "biz" | "Wednesday 16th, 8pm" | "crazies" | "there" |

