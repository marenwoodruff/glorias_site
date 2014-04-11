json.array!(@therapies) do |therapy|
  json.extract! therapy, :id, :name, :therapy, :address
  json.url therapy_url(therapy, format: :json)
end
