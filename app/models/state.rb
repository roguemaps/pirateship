class State < ActiveRecord::Base
  belongs_to :country
  has_many :cities

  def self.by_name(name=nil)
    if name
      where("name ILIKE any(array[:search])", search: name)
    else
      all
    end
  end

  def state_display
    "#{name}, #{country.name}"
  end
end
