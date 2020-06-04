json.extract! user_image, :id, :name, :stitch_pic, :created_at, :updated_at
json.url user_image_url(user_image, format: :json)
