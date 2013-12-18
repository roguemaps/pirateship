class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :category
      t.string :formatted_address
      t.string :phone
      t.string :website
      t.text :description
      t.text :details
      t.integer :price_level
      t.string :facebook_page
      t.integer :city_id
      t.decimal :lat, {:precision=>10, :scale=>6}
      t.decimal :lng, {:precision=>10, :scale=>6}
      t.boolean :active, default: false
      t.integer :created_by, default: 1
      t.integer :updated_by, default: 1
      t.timestamps

    end
      add_index :businesses, :city_id
      add_index :businesses, :name
      add_index :businesses, :category
  end
end
