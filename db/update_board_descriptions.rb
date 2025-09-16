# db/update_board_descriptions.rb
require 'json'
require 'open-uri'

# Ensure Rails environment is loaded
unless defined?(Rails)
  puts "Loading Rails environment..."
  require_relative '../config/environment'
end

puts "Updating board member descriptions from foosball_board.json..."

# Path to your JSON file
json_file_path = Rails.root.join('foosball_board.json')

unless File.exist?(json_file_path)
  puts "Error: foosball_board.json not found at #{json_file_path}"
  exit
end

board_data = JSON.parse(File.read(json_file_path))

# Track statistics
updated_count = 0
not_found_count = 0
error_count = 0

puts "Processing #{board_data.length} board members from JSON..."

board_data.each_with_index do |member_data, index|
  begin
    # Extract name from JSON
    full_name = member_data["name"]
    
    # Split name into first and last name
    name_parts = full_name.split(' ')
    if name_parts.length < 2
      puts "Warning: Could not parse name '#{full_name}' - skipping"
      not_found_count += 1
      next
    end
    
    firstname = name_parts[0]
    lastname = name_parts[1..-1].join(' ') # Handle names like "Maryam Aly" or "Tom Yore"
    
    # Find the user by first and last name
    user = User.where(director: true).find_by(
      firstname: firstname, 
      lastname: lastname
    )
    
    if user
      # Update the about field with the description
      user.update!(about: member_data["description"])
      updated_count += 1
      puts "Updated: #{user.fullname} (#{index + 1}/#{board_data.length})"
    else
      puts "Not found: #{full_name} (searched for firstname: '#{firstname}', lastname: '#{lastname}')"
      not_found_count += 1
    end
    
  rescue ActiveRecord::RecordInvalid => e
    error_count += 1
    puts "Error updating #{member_data["name"]}: #{e.message}"
  rescue => e
    error_count += 1
    puts "An unexpected error occurred for #{member_data["name"]}: #{e.message}"
  end
end

puts "\n--- Board Description Update Complete ---"
puts "Total board members in JSON: #{board_data.length}"
puts "Successfully updated: #{updated_count}"
puts "Not found in database: #{not_found_count}"
puts "Errors: #{error_count}"

puts "\nCurrent board members in database:"
User.where(director: true).each do |director|
  status = director.about.present? ? "✓ Has description" : "✗ No description"
  puts "- #{director.fullname} (#{director.director_title || 'Board Member'}): #{status}"
end
