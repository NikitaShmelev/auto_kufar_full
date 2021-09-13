json.extract! feedback, :id, :title, :body, :owner_id, :user_id, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
