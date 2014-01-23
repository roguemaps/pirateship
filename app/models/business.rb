class Business < ActiveRecord::Base
  belongs_to :city
  has_and_belongs_to_many :tags

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

  def thumbnail_url
    #if there is a thumbnail return url
    #else
    nil
  end

  def new_tags=(list)
    tag_list = list.split(',').map do |tag_name|
      Tag.find_or_create_by_name tag_name
    end
    self.tags << tag_list
  end

end
