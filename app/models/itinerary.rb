class Itinerary < ActiveRecord::Base
  acts_as_commentable
  attr_accessible :description, :name, :user_id
  has_many :points
  has_many :users, through: :user_itineraries
  has_many :user_itineraries
  belongs_to :owner,  foreign_key: :owner_id, class_name: 'User'
end
