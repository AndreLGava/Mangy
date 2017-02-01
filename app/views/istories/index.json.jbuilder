json.array!(@istories) do |istory|
  json.extract! istory, :id, :url, :sprint_id, :category_id, :description
  json.url istory_url(istory, format: :json)
end
