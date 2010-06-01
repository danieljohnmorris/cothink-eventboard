class HomeController < ApplicationController
  def index
    @events = Event.paginate :page => params[:page], :order => 'start_date ASC', :where => 'start_date > NOW()'
  end
end
