# Directors, Admins, and World Cup Selection Committee Seed File
# This file handles the creation and updating of key personnel

puts "Starting Directors, Admins, and World Cup Selection Committee seed..."

# Define the personnel data
personnel_data = [
  # Directors
  {
    firstname: "Donald",
    lastname: "Wilson",
    director: true,
    director_title: "President",
    admin: false,
    world_cup_selection_committee: false
  },
  {
    firstname: "Robert",
    lastname: "Mares",
    director: true,
    director_title: "Vice President",
    admin: false,
    world_cup_selection_committee: true
  },
  {
    firstname: "Terry",
    lastname: "Rue",
    director: true,
    director_title: "Treasurer",
    admin: false,
    world_cup_selection_committee: false
  },
  {
    firstname: "Maryam",
    lastname: "Aly",
    director: true,
    director_title: "Secretary",
    admin: true,
    world_cup_selection_committee: false
  },
  {
    firstname: "Tracy",
    lastname: "McMillan",
    director: true,
    director_title: nil,
    admin: false,
    world_cup_selection_committee: false
  },
  {
    firstname: "Jim",
    lastname: "Provost",
    director: true,
    director_title: nil,
    admin: true,
    world_cup_selection_committee: false
  },
  # World Cup Selection Committee (additional members)
  {
    firstname: "Tom",
    lastname: "Yore",
    director: false,
    director_title: nil,
    admin: false,
    world_cup_selection_committee: true
  },
  # Admins (additional)
  {
    firstname: "Shawn",
    lastname: "Lindsey",
    director: false,
    director_title: nil,
    admin: true,
    world_cup_selection_committee: false
  }
]

personnel_data.each do |person|
  # Check if user exists by email (using the pattern firstname@usafoosball.org)
  email = "#{person[:firstname].downcase}@usafoosball.org"
  
  # Generate a test phone number based on firstname
  phone = "(555) #{person[:firstname].length}#{person[:lastname].length}#{person[:firstname].length}-#{person[:lastname].length}#{person[:firstname].length}#{person[:lastname].length}"
  
  existing_user = User.find_by(email: email)
  
  if existing_user
    puts "Updating existing user: #{person[:firstname]} #{person[:lastname]} (#{email})"
    
    # Update the boolean fields
    existing_user.update!(
      director: person[:director],
      director_title: person[:director_title],
      admin: person[:admin],
      world_cup_selection_committee: person[:world_cup_selection_committee]
    )
  else
    puts "Creating new user: #{person[:firstname]} #{person[:lastname]} (#{email})"
    
    # Create new user with test data
    User.create!(
      username: "#{person[:firstname].downcase}_#{person[:lastname].downcase}",
      email: email,
      password: "password123",
      password_confirmation: "password123",
      firstname: person[:firstname],
      lastname: person[:lastname],
      phone: phone,
      address: "123 Test Street",
      city: "Test City",
      state: "TS",
      zip_code: "12345",
      level: "Expert",
      about: "Test user created for #{person[:firstname]} #{person[:lastname]}",
      image_url: nil,
      director: person[:director],
      director_title: person[:director_title],
      admin: person[:admin],
      world_cup_selection_committee: person[:world_cup_selection_committee]
    )
  end
end

puts "\nDirectors, Admins, and World Cup Selection Committee seed completed!"
puts "\nSummary:"
puts "- Directors: #{User.where(director: true).count} users"
puts "- Admins: #{User.where(admin: true).count} users"
puts "- World Cup Selection Committee: #{User.where(world_cup_selection_committee: true).count} users"

puts "\nLogin credentials (password: password123):"
User.where(admin: true).or(User.where(director: true)).or(User.where(world_cup_selection_committee: true)).each do |user|
  puts "- #{user.fullname}: #{user.email}"
end 