class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string   :name,           null: false
      t.text     :explanation,    null: false
      t.integer   :category,       null: false
      t.string   :condition,      null: false
      t.string   :delivery_fee,   null: false
      t.string   :area,           null: false
      t.datetime :days,           null: false
      t.string   :price,          null: false

      t.timestamps
    end
  end
end
