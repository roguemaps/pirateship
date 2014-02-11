class State < ActiveRecord::Base
  belongs_to :country
  has_many :cities

  include PgSearch
  pg_search_scope :search_by_name,
                  :against => [:name, :abbr],
                  :using => [:trigram],
                  :ranked_by => ":trigram"

  def self.by_name(name=nil)
    if name
      search_by_name(name)    
    else
      []
    end
  end

  def state_display
    "#{name}, #{country.name}"
  end
end
