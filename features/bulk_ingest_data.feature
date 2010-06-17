Feature: Bulk ingest data into application

    So that the content can update without hours of [MY] pain
    As an admin
    I want to bulk ingest data into the app

    Scenario: Find events CSV upload form
        Given I am on the admin overview
        Then I should see "Bulk add events"
        And there should be the following css "#bulk-add-events form"

    Scenario Outline: Upload CSV in admin
        Given I am on the admin overview
        When I upload a CSV at "<csv_path>"
        Then I should see "<message>"
        
        Scenarios:
            | csv_path                   | message                                     |
            | files/events_7_rows.csv    | CSV import successful, 7 events ingested    |
            # | files/events_1318_rows.csv | CSV import successful, 1318 events ingested |
        
    Scenario Outline: Upload blank CSV in admin
        Given I am on the admin overview
        When I upload a CSV at "<csv_path>"
        Then I should see "<message>"

        Scenarios:
            | csv_path                | message                         |
            | files/events_0_rows.csv | The CSV you uploaded was empty! |
