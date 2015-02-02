json.array!(@ratings) do |rating|
  json.extract! rating, :id, :discuss
  json.url rating_url(rating, format: :json)
end
