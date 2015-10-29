json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :user_id, :rate, :comment, :goal_id, :user_id
  json.url feedback_url(feedback, format: :json)
end
