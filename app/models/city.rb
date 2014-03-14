class City < ActiveRecord::Base
  belongs_to :country
  belongs_to :state

  scope :by_state, lambda { |states| joins(:state).where('states.id IN (?)', states) }

  # #why so slow?
  # include PgSearch
  # pg_search_scope :search_by_name,
  #                 :against => [:name],
  #                 :using => [:trigram],
  #                 :ranked_by => ":trigram"


  def self.search(q=nil)

    states = State.by_name(q)
    logger.info states.collect(&:name)
    unless states.empty?
      by_state(states).by_name(q)
    else
      by_name(q)
    end

  end

  def self.by_name(name=nil)
    unless name.blank?
      where("cities.name % ?", name).order("similarity(cities.name, '#{name}') DESC")
    else
      City.none
    end
  end


  def city_display
    if state
      return "#{name}, #{state.name}"
    else
      return "#{name}, #{country.name}"
    end
  end
end
