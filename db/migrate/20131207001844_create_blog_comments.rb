class CreateBlogComments < ActiveRecord::Migration
  def change
    create_table :blog_comments do |t|
      t.string :author
      t.text :content
      t.string :avatar
      t.integer :rating
      t.references :blog, index: true

      t.timestamps
    end
  end
end
