require File.dirname(__FILE__) + '/lib/helpers/view'
require File.dirname(__FILE__) + '/lib/helpers/date'
# send gets around private
ActionView::Base.send :include, Cothink::Helpers::View