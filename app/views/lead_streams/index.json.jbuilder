json.array!(@lead_streams) do |lead_stream|
  json.extract! lead_stream, :id, :user_id, :category_id, :city_id
  json.url lead_stream_url(lead_stream, format: :json)
end
