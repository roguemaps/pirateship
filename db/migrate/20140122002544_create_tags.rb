class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.boolean :filterable, default: false

      t.timestamps
    end

  end
end
