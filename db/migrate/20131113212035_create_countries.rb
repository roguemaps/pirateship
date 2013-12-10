class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :alpha_2, :limit => 2
      t.string :alpha_3, :limit => 3
      t.string :numeric, :limit => 3
      t.timestamps
    end
  end
end
