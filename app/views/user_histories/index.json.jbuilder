json.array!(@user_histories) do |user_history|
  json.extract! user_history, :id, :user_id, :course_id, :action
  json.url user_history_url(user_history, format: :json)
end
