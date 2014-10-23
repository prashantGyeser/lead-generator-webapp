

json.leadStreams @lead_streams.each do |lead_stream|
  json.extract! lead_stream, :id, :user_id

  city = City.find(lead_stream.city_id)
  category = Category.find(lead_stream.category_id)

  name = category.name + ' in ' + city.name

  json.name name

  leads_today = UserLead.where(lead_stream_id: lead_stream.id).where("created_at >= ?", Time.zone.now.beginning_of_day).count

  json.leads leads_today

end