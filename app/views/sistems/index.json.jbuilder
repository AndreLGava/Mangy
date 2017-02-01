json.array!(@sistems) do |sistem|
  json.extract! sistem, :id, :description
  json.url sistem_url(sistem, format: :json)
end
