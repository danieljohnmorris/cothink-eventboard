Feature: Bulk ingest data into application

    So that the content can update without hours of [MY] pain
    As an admin
    I want to bulk ingest data into the app

    Scenario: Upload CSV in admin
        Given I am on the admin overview
        When I do a new bulk ingest, by uploading a CSV of 50 new entries
        Then I should see '50 new events ingested'