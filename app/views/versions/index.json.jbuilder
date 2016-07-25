json.array!(@versions) do |version|
  json.extract! version, :id, :responsable, :used_user, :system, :observation, :impediment, :start, :finish
  json.url version_url(version, format: :json)
end
