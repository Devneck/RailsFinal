class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author
      t.text :comment
      t.integer :rating
      t.references :product, index: true

      t.timestamps
    end
  end
end
