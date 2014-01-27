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
    unless q.empty?
      #NOTE: ILIKE -> postgresql only!!!
      where("businesses.name ILIKE :search", search: "%#{q}%")
    else
      all
    end
  end

  def self.tagged(tag_list)
    unless tag_list.empty?
      joins(:tags).where('businesses_tags.tag_id IN (?)', tag_list).uniq
    else
      all
    end
  end

  def tagged?(tag_list)
    return true if tag_list.empty?
    tags & tag_list == tag_list
  end

  def thumbnail_url
    #if there is a thumbnail return url
    #else
    nil
  end

  def new_tags=(list)
    tag_list = list.split(',').map do |tag_name|
      Tag.find_or_create_by_name tag_name.strip
    end
    self.tags << tag_list
  end

end
