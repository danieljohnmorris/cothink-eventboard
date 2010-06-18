Feature: Branding

    So that I know can get an overview of past/upcoming event dates
    As an admin
    I want to see the dates in the event list

    Scenario: Show event date in list
		When I am on event admin list page
		And show me the page
        Then I should see "Date"
