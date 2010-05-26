require 'fastercsv'
class Event < ActiveRecord::Base
  
  belongs_to :organisation
  
  def self::ingest_csv(csv_file)
    count_saved = 0
    e = Event.create(:title => "dan")
    
    # @parsed_file= FasterCSV.read("features/files/events_6_rows_over_11_lines.csv", :headers => true, :skip_blanks => true)
    # @parsed_file.each_with_index do |row, index|
    #   # e = Event.create(
    #   #   :title => row[0]
    #   # )
    #   # e.description = row[1]
    #   # e.start_date = Date.parse(row[2])
    #   # e.location = row[3]
    #   # e.source = row[4]
    #   # e.url = row[5]
    #   # e.organisation = Organisation.find_or_create_by_name(row[6])
    #   # 
    #   # count_saved += 1 if e.save
    #   # e.save
    # end
    
    count_saved
  end

  def _formatted_date(date,piece)
    date = self.send(date)
    if piece == 'ampm'
      date.strftime('%p').downcase
    elsif piece == 'day'
      date.day
    elsif piece == 'month'
      date.strftime('%b')
    else
      hour = date.strftime('%I').gsub(/^0/,'')
      minutes = date.strftime('%M')
      minutes == '00' ? hour : "#{hour}.#{minutes}"
    end
  end
  
  def method_missing(method,*args)
    if method.to_s =~ /^(start|end)_(ampm|time|day|month)$/
      _formatted_date($1 + '_date',$2)
    else
      super(method,*args)
    end
    
    events
  end
end
