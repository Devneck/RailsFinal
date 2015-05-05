json.array!(@products) do |product|
  json.extract! product, :name, :description, :stock, :sell_price, :cost, :weight
  json.url product_url(product, format: :json)
end
