module Cothink
  module Helpers
    module Date
  
      def nice_datify(date)
        date.strftime('%b ') + date.strftime('%d').gsub(/^0+/,'')
      end
      def monday_of_week_containing(date)
        ::Date.strptime(date.strftime('%Y %W 1'),'%Y %W %w')
      end
      def weeks_in_future_of(to_compare,against_past_date)
        ((monday_of_week_containing(to_compare) - monday_of_week_containing(against_past_date) ) / 7).ceil
      end
    end
  end
end