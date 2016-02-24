json.array!(@caves) do |cafe|
  json.extract! cafe, :id, :kor_name, :eng_name, :url, :cafe_type
  json.url cafe_url(cafe, format: :json)
end
