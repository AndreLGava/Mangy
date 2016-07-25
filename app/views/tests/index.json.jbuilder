json.array!(@tests) do |test|
  json.extract! test, :id, :description, :settings, :file, :expected_result, :status
  json.url test_url(test, format: :json)
end
