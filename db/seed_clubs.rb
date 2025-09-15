# Seed script to populate clubs from foosball_clubs.json
# Run with: rails runner db/seed_clubs.rb

require 'json'

puts "Starting club seeding process..."

# Read the JSON file
json_file_path = Rails.root.join('foosball_clubs.json')
unless File.exist?(json_file_path)
  puts "Error: foosball_clubs.json file not found at #{json_file_path}"
  exit 1
end

clubs_data = JSON.parse(File.read(json_file_path))
puts "Found #{clubs_data.length} clubs in JSON file"

# Clear existing clubs (optional - comment out if you want to keep existing data)
puts "Clearing existing clubs..."
Club.destroy_all

# Track statistics
created_count = 0
skipped_count = 0
error_count = 0

clubs_data.each_with_index do |club_data, index|
  begin
    # Map JSON fields to Club model fields
    club_attributes = {
      name: club_data['name'],
      address: club_data['address'],
      city: club_data['city'],
      state: club_data['state'],
      zip_code: club_data['zip'],
      phone: club_data['contact'],
      day_and_time_info: club_data['event_time'],
      description: club_data['notes'],
      contact_person: club_data['administrator']
    }
    
    # Handle tables field - convert to description if present
    if club_data['tables'].present?
      tables_info = "Tables: #{club_data['tables']}"
      if club_attributes[:description].present?
        club_attributes[:description] = "#{club_attributes[:description]} | #{tables_info}"
      else
        club_attributes[:description] = tables_info
      end
    end
    
    # Create the club
    club = Club.create!(club_attributes)
    created_count += 1
    
    if (index + 1) % 10 == 0
      puts "Processed #{index + 1}/#{clubs_data.length} clubs..."
    end
    
  rescue => e
    puts "Error creating club '#{club_data['name']}': #{e.message}"
    error_count += 1
  end
end

puts "\n" + "="*50
puts "CLUB SEEDING COMPLETE"
puts "="*50
puts "Total clubs processed: #{clubs_data.length}"
puts "Successfully created: #{created_count}"
puts "Errors encountered: #{error_count}"
puts "Clubs skipped: #{skipped_count}"
puts "\nYou can now view the clubs at: /clubs"
