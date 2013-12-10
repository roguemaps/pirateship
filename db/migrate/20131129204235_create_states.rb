class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbr, :limit => 5
      t.integer :country_id 
      t.timestamps
    end

    add_index :states, :name
    add_index :states, :country_id
  end

end
