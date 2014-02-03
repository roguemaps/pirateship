class CreateIndexesForCityState < ActiveRecord::Migration
  # def change
  #   remove_index :states, :name
  #   remove_index :cities, :name
  #   add_index :states, :name, using: 'gin'
  #   # add_index :states, :abbr, using: :gin
  #   add_index :cities, :name, using: 'gin'
  # end

  def up
    execute "DROP INDEX IF EXISTS index_cities_on_name"
    execute "CREATE INDEX index_cities_on_name ON cities USING gin ((name) gin_trgm_ops);"
  end

  def down
    execute "DROP INDEX IF EXISTS index_cities_on_name"
  end

end
