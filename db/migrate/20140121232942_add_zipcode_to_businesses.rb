class AddZipcodeToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :zipcode, :string, after: :formatted_address
  end
end
