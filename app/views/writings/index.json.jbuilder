json.array!(@writings) do |writing|
  json.extract! writing, :id, :title, :body
  json.url writing_url(writing, format: :json)
end
