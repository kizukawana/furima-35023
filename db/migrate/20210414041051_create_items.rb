class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,              null: false
      t.text       :explanation,       null: false
      t.integer    :category_id,       null: false
      t.integer    :condition_id,      null: false
      t.integer    :delivery_fee_id,   null: false
      t.integer    :area_id,           null: false
      t.integer    :delivery_day_id,   null: false
      t.string     :price,             null: false
      t.references :user,              null: false


      t.timestamps
    end
  end
end
