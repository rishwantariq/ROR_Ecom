json.extract! product, :id, :price, :title, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
