class Event < ActiveRecord::Base
  
  belongs_to :organisation
  
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
  end
end
