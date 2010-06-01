Feature: Like an event
  In order to capture events I'm interest in, and broadcast that interest
  As Carment
  I want to be able to 'like' events

  Background
	Given There are no "events"
  
  @tim
  Scenario: Break up events into weeks
	Given there are the following upcoming events
	 | title  | start_date          | location | organisation   |
	 | mental | 18-10-2100 18:00:00 | fun land | scientologists |
	 | biz    | 12-10-2100 19:00:00 | biz land | fsb            |
	And I am on the homepage
	When I press "like" within "#event-id-mental"
	And I press "my liked events" within "#filters"
	Then I should I see the following events
	 | title  | start_date          | location | organisation   |
	 | mental | 18-10-2100 18:00:00 | fun land | scientologists |
