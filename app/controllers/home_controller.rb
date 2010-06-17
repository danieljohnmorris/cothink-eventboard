class HomeController < ApplicationController
  def index
    # annoying cant use named scope Event.published here! 
    @events = Event.paginate :page => params[:page], :order => 'start_date ASC', :conditions => ["publish_state = #{Event::PUBLISHED_STATE}", 'start_date > NOW()']
  end
end
