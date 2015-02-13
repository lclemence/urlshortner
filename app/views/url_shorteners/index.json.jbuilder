json.array!(@url_shorteners) do |url_shortener|
  json.extract! url_shortener, :id, :user_id, :original_url, :shortened_url
  json.url url_shortener_url(url_shortener, format: :json)
end
