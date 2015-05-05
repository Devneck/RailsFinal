class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :stock
      t.decimal :sell_price
      t.decimal :cost
      t.decimal :weight

      t.timestamps
    end
  end
end
