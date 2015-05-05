# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
include Faker
require 'date'

thumbs = %w(products/thumb_bird.job products/thumb_cat.jpg products/thumb_lady.jpg products/thumb_laptop.jpg products/thumb_sidewalk.jpg)
images = %w(bird cat lady laptop sidewalk)

Article.destroy_all
100.times do
  article = Article.create( :title => "#{Company.bs}",
                            :author => "#{Name.name}",
                            :published_date => "#{Date.new(rand(1960..2013), rand(1..12), rand(1..28))}",
                            :published => "True",
                            :content => Lorem.paragraphs.join("<br/>"),
                            :thumbnail => "products/" + images[rand(images.length)] + ".jpg"
  )
end

Product.destroy_all
Review.destroy_all
100.times do
  image = images[rand(images.length)]

  product = Product.create(:name => "#{Commerce.product_name}",
                           :description => Lorem.paragraphs.join("<br/>"),
                           :stock => rand(10000),
                           :sell_price => ((rand(1..100).to_s) + '.' + (rand(0.99).to_s)).to_f,
                           :cost => ((rand(1..100)).to_s + '.' + (rand(0.99).to_s)).to_f,
                           :weight => ((rand(1..100)).to_s + '.' + (rand(0.99).to_s)).to_f,
                           :image => "products/" + image + ".jpg",
                           thumb: "products/thumb_" + image + ".jpg"
  )
  rand(0..10).times do
    product.reviews.create(
        :author => "#{Name.name}",
        :comment => Lorem.sentences(3).join,
        :rating => rand(1..10)
    )
  end
end


