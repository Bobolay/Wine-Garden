class CreateInteriorComponents < ActiveRecord::Migration
  def change
    create_table :interior_components do |t|
      t.string :name
      t.boolean :published
      t.integer :sorting_position
      t.string :label
      t.text :description
      t.attachment :image

      t.timestamps null: false
    end
  end
end
