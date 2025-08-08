json.extract! document, :id, :title, :description, :uploaded_by, :file_url, :created_at, :updated_at
json.url document_url(document, format: :json)
