class Itinerary < ActiveRecord::Base
  attr_accessible :description, :name, :user_id
  has_many :points
  has_many :itineraries_users
  has_many :users, through: :itineraries_users
end
