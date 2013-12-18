class Business < ActiveRecord::Base
  belongs_to :city

  validates_presence_of :name
  validates_presence_of :city_id
end
