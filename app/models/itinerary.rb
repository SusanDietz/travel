class Itinerary < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :points
end
