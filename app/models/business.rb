class Business < ActiveRecord::Base
  belongs_to :city
  has_and_belongs_to_many :tags

  validates_presence_of :name
  validates_presence_of :city_id

  has_attached_file :profile_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/business_thumb_placeholder.png"

  scope :active, -> {where active: true}
  scope :in_cities, lambda { |cities| joins(:city).where('cities.id IN (?)', cities) }

  include PgSearch
  pg_search_scope :search_text, 
    :against => {
      :name => 'A',
      :category => 'B',
      :description => 'C'
    },
    :using => {
      :tsearch => {
        :dictionary => "english",
        :any_word => true
      }
    }

  def self.by_city(city=nil)
    unless city.blank?
      in_cities(city)
    else  
      all
    end
  end

  def self.search(q)
    unless q.empty?
      search_text(q)
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
  def self.tagged_with_all(tag_list)
    unless tag_list.empty?
      joins(:tags).where(tags: {id: tag_list }).group("businesses.id").having("count(*) = #{tag_list.size}")
    else
      all
    end
  end

  def tagged?(tag_list)
    return true if tag_list.empty?
    tags & tag_list == tag_list
  end

  def new_tags=(list)
    tag_list = list.split(',').map do |tag_name|
      Tag.find_or_create_by_name tag_name.strip
    end
    self.tags << tag_list
  end

end
