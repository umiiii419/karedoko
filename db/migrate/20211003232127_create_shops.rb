class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|

      t.references :genre,            null: false, foreign_key: true
      t.string     :name,             null: false
      t.string     :name_kana,        null: false
      t.string     :image_id,         null: false
      t.string     :address,          null: false
      t.string     :telephone_number, null: false
      t.string     :opening_hours,    null: false
      t.string     :regular_holiday,  null: false
      t.string     :nearest_station,  null: false
      t.boolean    :is_deleted,       null: false, default: false

      t.timestamps
    end
  end
end
