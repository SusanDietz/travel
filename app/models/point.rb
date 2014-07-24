class Point < ActiveRecord::Base
  attr_accessible :name, :description, :latitude, :longitude
  belongs_to :user
end
