class City < ActiveRecord::Base
has_many :listings , :class_name => "Listing", :foreign_key => "city_id"
end
