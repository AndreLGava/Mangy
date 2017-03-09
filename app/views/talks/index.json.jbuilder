json.array!(@talks) do |talk|
  json.extract! talk, :id, :who, :said
  json.url talk_url(talk, format: :json)
end
