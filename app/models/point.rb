class Point < ActiveRecord::Base
  attr_accessible :name, :description, :latitude, :longitude
end
