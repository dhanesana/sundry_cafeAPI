json.array!(@memberships) do |membership|
  json.extract! membership, :id, :cafe_id, :count
  json.url membership_url(membership, format: :json)
end
