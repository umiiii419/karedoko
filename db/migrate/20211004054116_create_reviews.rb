class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

      t.references :user,     null: false, foreign_key: true
      t.references :shop,     null: false, foreign_key: true
      t.string     :title,    null: false
      t.text       :body,     null: false
      t.string     :image_id
      t.float      :rate,     null: false, default: 0

      t.timestamps
    end
  end
end
