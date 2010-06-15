require 'fastercsv'
class Event < ActiveRecord::Base
  validates_presence_of :title, :start_date, :location # minimum useful fields
  belongs_to :organisation
  
  ### publish pseudo state machine
  
  attr_protected :publish_state
  DRAFT_STATE = 0
  PUBLISHED_STATE = 1
    
  def publish
    return true if self.publish_state == PUBLISHED_STATE

    self.publish_state = PUBLISHED_STATE
    return self.save! ? true : false
  end

  def hide
    return true if self.publish_state == DRAFT_STATE
    
    self.publish_state = DRAFT_STATE
    return self.save! ? true : false
  end

  def published?
    return self.publish_state == PUBLISHED_STATE ? true : false
  end

  def draft?
    return self.publish_state == DRAFT_STATE ? true : false
  end
  
  ### tim stuffs
  
  def _formatted_date(date,piece)
    date = self.send(date)
    return "" unless date # otherwise get errors

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
  
  def method_missing(method,*args,&block)
    if method.to_s =~ /^(start|end)_(ampm|time|day|month)$/
      _formatted_date($1 + '_date',$2)
    else
      super(method,*args,&block)
    end
  end
end
