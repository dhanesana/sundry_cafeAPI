json.cool_guy "YongChicken"
json.cafes @sorted do |hash|
  json.id hash.keys.first.id
  json.kor_name hash.keys.first.kor_name
  json.eng_name hash.keys.first.eng_name
  json.type hash.keys.first.cafe_type.capitalize
  json.cafe_url hash.keys.first.url
  json.members hash.values.first.count
  json.updated hash.values.first.created_at.to_i
end
