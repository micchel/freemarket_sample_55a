class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :category_id, null: false, foreign_key: true
      t.integer :brand_id
      t.string :name, null: false
      t.text :explain, null: false
      t.integer :price, null: false
      t.bigint :seller_id, null: false
      t.bigint :buyer_id
      t.integer :status, null: false
      t.integer :delivery_cost, null: false
      t.integer :delivery_way, null: false
      t.integer :delivery_prefecture, null: false
      t.integer :delivery_date, null: false
      t.timestamps
    end
  end
end
