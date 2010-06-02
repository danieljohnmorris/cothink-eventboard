class Admin::EventsController < ApplicationController
  # GET /admin_events
  # GET /admin_events.xml
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /admin/events/1
  # GET /admin/events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /admin/events/new
  # GET /admin/events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /admin/events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /admin_events
  # POST /admin_events.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(admin_event_path(@event), :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/events/1
  # PUT /admin/events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(admin_event_path(@event), :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/events/1
  # DELETE /admin/events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(admin_events_url) }
      format.xml  { head :ok }
    end
  end

  # POST /admin/events/ingest
  def ingest
    # TODO - move to model, hopefully rails will fix stupid mysqlcompat error!
    saved_events = []
    @parsed_file= FasterCSV.parse(params[:csv][:file], :headers => true, :skip_blanks => true) # parse=string, read=file!
    
    @parsed_file.each do |row|
        e = Event.new
        e.title = row[0]
        e.description = row[1]
        e.start_date = Date.parse(row[2])
        e.location = row[3]
        e.source = row[4]
        e.url = row[5]
        e.organisation = Organisation.find_or_create_by_name(row[6])
        saved_events << e if e.save
    end
    
    flash[:success], flash[:error] = nil # try to appease cuke :(
    if saved_events.length < 1
      flash[:error]="The CSV you uploaded was empty!"
    else
      flash[:success]="CSV import successful, #{saved_events.length} events ingested"
    end
      
    redirect_to admin_path
  end
end
