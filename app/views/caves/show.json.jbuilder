json.(@cafe, :id, :kor_name, :eng_name)
json.cafe_url @cafe.url
json.history @cafe.memberships do |membership|
  json.members membership.count
  json.created membership.created_at.to_i
end
