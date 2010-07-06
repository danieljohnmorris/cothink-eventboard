module ApplicationHelper
 # assets version
 def assets
   "assets/1"
 end
end

# to allow for escaping strings in views that may be nil
class NilClass
  def html_safe
    
  end
end