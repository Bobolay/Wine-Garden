class CreateOrderRequests < ActiveRecord::Migration
  def change
    create_table :order_requests do |t|
      t.string :persons_quantity
      t.string :name
      t.string :phone
      t.string :date_time
      t.text :message
      t.string :referer
      t.string :session_id
      t.timestamps null: false
    end
  end
end
