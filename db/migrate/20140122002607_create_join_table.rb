class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :businesses, :tags do |t|
      t.index [:business_id, :tag_id]
      t.index [:tag_id, :business_id]
    end
  end
end
