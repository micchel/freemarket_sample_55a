class CreateItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images do |t|
      t.references :item, null: false, foreign_key: true, type: :bigint
      t.string :image, null: false
      t.timestamps
    end
  end
end
