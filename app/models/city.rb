class City < ActiveRecord::Base
  belongs_to :country
  belongs_to :state

  def self.search(q=nil)
    search_terms = q.split
    results = []
    states = State.by_name(search_terms)
    unless states.empty?
      states.each do |state|
        return state.cities.by_name(search_terms).first
      end
    else
      return self.by_name(search_terms).first
    end

  end

  def self.by_name(name=nil)
    if name
      where("name ILIKE any(array[:search])", search: name)
    else
      all
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
