Feature: Summary of upcoming events

    So that I see events I might want to attend
    As an event goer
    I want to see a summary of upcoming events in London
	
	@tim
    Scenario: Show prompt to add event if no upcoming events
        Given I am on the homepage
		And There are no "events"
        Then I should see an info message saying "Oops, couldn't find any events. Try being less specific about the type of event." within ".events"
    
	
    Scenario: Show upcoming events on homepage
		Given there are the following upcoming events
		 | title  | start_time          | location | organisation   |
		 | mental | 18-10-2010 18:00:00 | fun land | scientologists |
		 | biz    | 12-10-2010 19:00:00 | biz land | fsb            |
		When I am on the homepage
        Then I should see a list of upcoming events like this
		 | title  | start_time    | location | organisation   |
		 | biz    | 12th Oct, 6pm | biz land | fsb            |
		 | mental | 18th Oct, 7pm | fun land | scientologists |
