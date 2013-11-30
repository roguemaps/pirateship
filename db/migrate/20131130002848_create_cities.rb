class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :state_id
      t.integer :country_id
      t.float   :lat, :limit => 25
      t.float   :lng, :limit => 25
      t.timestamps
    end

    add_index :cities, :name
    add_index :cities, :country_id
    add_index :cities, :state_id
  end
end
