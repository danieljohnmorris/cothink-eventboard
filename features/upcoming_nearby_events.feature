Feature: Summary of upcoming events

    So that I see events I might want to attend
    As an event goer
    I want to see a summary of upcoming events in London

	Background
		Given There are no "events"
	
    Scenario: Show prompt to add event if no upcoming events
        Given I am on the homepage
        Then I should see an info message saying "Oops, couldn't find any events. Try being less specific about the type of event." within ".events"
	
	@tim
    Scenario: Show upcoming events on homepage
	
		Events should be in descending order, and past events should not be shown.

		Given there are the following upcoming events
		 | title  | start_date          | location | organisation   |
		 | mental | 18-10-2100 18:00:00 | fun land | scientologists |
		 | biz    | 12-10-2100 19:00:00 | biz land | fsb            |
		 | biz    | 12-10-2006 19:00:00 | biz land | fsb            |
		When I am on the homepage
        Then I should see a list of upcoming events like this
	 	| title  | start_date | start_month | start_time | location | organisation   |
		| biz    | 12         | Oct         | 6pm        | biz land | fsb            |
		| mental | 18         | Oct         | 7pm        | fun land | scientologists |
		                                      
	Scenario: Break up events into weeks
	  Given there are 30 random events over the next month
	  When I am on the homepage
	  Then I should see 4 week dividers
	  And I should see 30 date markers
	
	
	
	# probably shouldn't bother doing this yet - design will change
	# Scenario: Pagniate upcoming events
	# 	Given there are "10" random "Event"
	# 	And pagination items per page for "Event" is set to "4"
	# 	When I am on the homepage
	# 	Then I should see "4" events
	# 	And I should see "2" other pages in the paginator, comprised of "6" more items 
		
