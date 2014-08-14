class UserItinerary < ActiveRecord::Base
  attr_accessible :itinerary_id, :user_id
  belongs_to :user
  belongs_to :itinerary

  validates :user_id, uniqueness: { :scope => :itinerary_id }
end
