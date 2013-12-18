class City < ActiveRecord::Base
  belongs_to :country
  belongs_to :state

  def city_display
    if state
      return "#{name}, #{state.name}"
    else
      return "#{name}, #{country.name}"
    end
  end
end
