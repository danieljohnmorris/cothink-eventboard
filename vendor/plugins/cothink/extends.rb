require File.dirname(__FILE__) + '/lib/helpers/view'
# send gets around private
ActionView::Base.send :include, Cothink::Helpers::View