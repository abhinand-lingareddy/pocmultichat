json.extract! message, :id, :body, :user_id, :chat_id, :created_at, :updated_at
json.url message_url(message, format: :json)