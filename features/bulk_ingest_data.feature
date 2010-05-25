Feature: Bulk ingest data into application

    So that the content can update without hours of [MY] pain
    As an admin
    I want to bulk ingest data into the app

@dan
    Scenario: Find events CSV upload form
        Given I am on the admin overview
        Then I should see "Bulk add events"
        And there should be the following css "#bulk-add-events form"

    Scenario Outline: Upload CSV in admin
        Given I am on the admin overview
        When I upload a CSV at "<csv_path>"
        Then I should see confirmation of "<csv_rows>" "new events ingested"
        
        Scenarios: Files
            | csv_path                   | csv_rows |
            | files/events_0_rows.csv    | 0        |
            | files/events_10_rows.csv   | 10       |
            | files/events_1376_rows.csv | 1376     |
