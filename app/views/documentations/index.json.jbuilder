json.array!(@documentations) do |documentation|
  json.extract! documentation, :id, :requisito, :description, :pratic, :part, :functionality, :traceable_item, :category, :link, :groups, :context, :tag, :configuration
  json.url documentation_url(documentation, format: :json)
end
