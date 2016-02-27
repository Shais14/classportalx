json.array!(@grades) do |grade|
  json.extract! grade, :id, :studentID, :courseID, :value
  json.url grade_url(grade, format: :json)
end
