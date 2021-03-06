json.array!(@reviews) do |review|
  json.extract! review, :author, :comment, :rating, :product_id
  json.url review_url(review, format: :json)
end
