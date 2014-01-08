class Business < ActiveRecord::Base
  belongs_to :city

  validates_presence_of :name
  validates_presence_of :city_id

  scope :active, -> {where active: true}

  def self.by_city(city=nil)
    if city
      where(city_id: city)
    else
      all
    end
  end

  def self.search(q)
    #NOTE: ILIKE -> postgresql only!!!
    where("name ILIKE :search", search: "%#{q}%")
  end

end
