# encoding: UTF-8
module SafeSeed
  def create_or_update_by_name!(attributes)
    if attributes.is_a?(Array)
      attributes.collect { |attr| create_or_update_by_name!(attr) }
    else
      find_or_initialize_by({:name => attributes[:name]}).update!(attributes)
    end
  end
end

Tag.extend SafeSeed


Tag.create_or_update_by_name!([{ :name => "Gluten Free", :filterable => true },
  { :name => "GMO Free", :filterable => true }, 
  { :name => "Organic", :filterable => true },
  { :name => "Local", :filterable => true },
  { :name => "Kid Friendly", :filterable => true },
  { :name => "Soy Free", :filterable => true },
  { :name => "Egg Free", :filterable => true },
  { :name => "Farm to Table", :filterable => true },
  { :name => "Biodynamic", :filterable => true }])