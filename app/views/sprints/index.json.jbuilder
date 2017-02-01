json.array!(@sprints) do |sprint|
  json.extract! sprint, :id, :start, :done, :meta
  json.url sprint_url(sprint, format: :json)
end
