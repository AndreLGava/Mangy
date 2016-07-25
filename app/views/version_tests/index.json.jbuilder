json.array!(@version_tests) do |version_test|
  json.extract! version_test, :id, :obtained_result, :impact, :check, :version_id, :text_id
  json.url version_test_url(version_test, format: :json)
end
