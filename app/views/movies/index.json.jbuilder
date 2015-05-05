json.array!(@movies) do |movie|
  json.extract! movie, :name, :director, :description, :year, :length, :format
  json.url movie_url(movie, format: :json)
end
