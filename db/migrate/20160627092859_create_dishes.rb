class CreateDishes < ActiveRecord::Migration
  def up
    create_table :dishes do |t|
      t.string :name
      t.boolean :published
      t.integer :sorting_position
      t.attachment :image
      t.string :label
      t.integer :price
      t.text :description
      t.integer :weight
    end
  end
end
