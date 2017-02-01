json.array!(@category_systems) do |category_system|
  json.extract! category_system, :id, :sistem_id, :category_id
  json.url category_system_url(category_system, format: :json)
end
