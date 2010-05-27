class HomeController < ApplicationController
  def index
    @events = Event.paginate :page => params[:page], :order => 'created_at DESC'
  end
end
