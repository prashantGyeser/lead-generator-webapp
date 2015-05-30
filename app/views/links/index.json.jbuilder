json.array!(@links) do |link|
  json.extract! link, :id, :in_url, :out_url, :http_status
  json.url link_url(link, format: :json)
end
