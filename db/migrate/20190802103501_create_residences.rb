class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.references :user, foreign_key: true, type: :bigint
      t.string     :zip_code, null: false
      t.integer    :prefecture_id
      t.string     :city, null: false
      t.string     :address
      t.string     :detail
      t.timestamps
    end
  end
end
