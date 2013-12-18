class State < ActiveRecord::Base
  belongs_to :country
  has_many :cities

  def state_display
    "#{name}, #{country.name}"
  end
end
