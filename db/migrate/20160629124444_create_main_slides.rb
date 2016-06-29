class CreateMainSlides < ActiveRecord::Migration
  def change
    create_table :main_slides do |t|
      t.boolean :published
      t.integer :sorting_position
      t.attachment :image

      t.timestamps null: false
    end
  end
end
