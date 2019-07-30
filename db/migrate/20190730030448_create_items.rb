class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :item_image_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true
      t.integer :brand_id, null: false
      t.string :name, null: false
      t.text :explain, null: false 
      t.integer :price, null: false
      t.bigint :seller_id, null: false
      t.bigint :buyer_id
      t.integer :status, null: false
      t.string :delivery_cost, null: false
      t.string :delivery_way, null: false
      t.string :delivery_prefecture, null: false
      t.string :delivery_date, null: false
      t.timestamps
    end
  end
end
