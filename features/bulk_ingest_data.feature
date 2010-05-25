Feature: Bulk ingest data into application

    So that the content can update without hours of [MY] pain
    As an admin
    I want to bulk ingest data into the app

    Scenario: Find events CSV upload form
        Given I am on the admin overview
        Then I should see "Bulk upload events"

    Scenario: Upload CSV in admin
        Given I am on the admin overview
        When upload a CSV
            
        Then I should see 'new events ingested'
        And all events should be saved