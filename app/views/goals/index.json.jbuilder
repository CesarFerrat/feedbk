json.array!(@goals) do |goal|
  json.extract! goal, :id, :user_id, :description
  json.url goal_url(goal, format: :json)
end
