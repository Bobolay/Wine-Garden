class CreateProductSlides < ActiveRecord::Migration
  def change
    create_table :product_slides do |t|
      t.boolean :published
      t.integer :sorting_position
      t.attachment :image
      t.string :name
      t.string :model_name
      t.integer :year

      t.timestamps null: false
    end
  end
end
