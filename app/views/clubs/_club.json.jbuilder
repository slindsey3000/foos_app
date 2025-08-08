json.extract! club, :id, :name, :address, :city, :state, :zip_code, :phone, :email, :website, :coordinates, :day_and_time_info, :description, :image_url, :contact_person, :established_date, :created_at, :updated_at
json.url club_url(club, format: :json)
