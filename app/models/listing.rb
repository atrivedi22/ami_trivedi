class Listing < ActiveRecord::Base
  has_many :replies , :class_name => "Reply", :foreign_key => "listing_id"
  belongs_to :user , :class_name => "User", :foreign_key => "user_id"
  belongs_to :city
  has_many :responders, :through => :replies , :source => :user
end
