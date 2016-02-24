json.cool_guy "YongChicken"
json.cafes @caves do |cafe|
  json.id cafe.id
  json.kor_name cafe.kor_name
  json.eng_name cafe.eng_name
  json.type cafe.cafe_type.capitalize
  json.cafe_url cafe.url
  json.url cafe_url(cafe, format: :json)
  json.members cafe.memberships.order('created_at DESC').first.count
  json.updated cafe.memberships.order('created_at DESC').first.created_at.to_i
end
