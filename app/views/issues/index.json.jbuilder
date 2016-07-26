json.array!(@issues) do |issue|
  json.extract! issue, :id, :link, :done, :available_for_test, :real_problem, :version_test_id
  json.url issue_url(issue, format: :json)
end
