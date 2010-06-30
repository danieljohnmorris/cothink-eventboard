class Organisation < ActiveRecord::Base
  has_many :events
  acts_as_taggable_on #alias for :tags - if this used as well as custom type, saves_from breaks!
end
