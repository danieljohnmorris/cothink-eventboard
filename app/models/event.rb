require 'fastercsv'
class Event < ActiveRecord::Base
  belongs_to :organisation
  
  def self::ingest_csv(csv_file)
    events = []
    
    @parsed_file= FasterCSV.read("features/files/events_6_rows_over_11_lines.csv", :headers => true, :skip_blanks => true)
    @parsed_file.each_with_index do |row, index| 
        e = Event.new
        events << e
        e.title = row[0]
        e.description = row[1]
        e.start_date = Date.parse(row[2])
        e.location = row[3]
        e.source = row[4]
        e.url = row[5]
        e.organisation = Organisation.find_or_create_by_name(row[6])

        puts e.inspect
    end
    
    events
  end
end
