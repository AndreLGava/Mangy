json.array!(@tecnologies) do |tecnology|
  json.extract! tecnology, :id, :description
  json.url tecnology_url(tecnology, format: :json)
end
