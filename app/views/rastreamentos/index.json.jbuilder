json.array!(@rastreamentos) do |rastreamento|
  json.extract! rastreamento, :id, :time, :pessoa_id, :issue_id, :status_id
  json.url rastreamento_url(rastreamento, format: :json)
end
