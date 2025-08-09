# This file contains comprehensive seed data with clubs from all 50 states and DC
# Run with: rails runner db/comprehensive_seeds.rb

puts "Starting comprehensive seed process..."

# Clear existing data
puts "Clearing existing data..."
User.destroy_all
Article.destroy_all
Document.destroy_all
Club.destroy_all

# Create test users 
puts "Creating test users..."

# Create users through normal Rails methods
admin_user = User.create!(
  username: "admin",
  email: "admin@usafoosball.com", 
  password: "password",
  password_confirmation: "password",
  firstname: "Shawn",
  lastname: "Lindsey",
  fullname: "Shawn Lindsey",
  admin: true,
  director: true,
  about: "Developer USA Foosball Association. Professional foosball player with 20+ years of experience.",
  phone: "(555) 123-4567",
  address: "123 Foosball Lane",
  city: "Austin",
  state: "TX",
  zip_code: "78701",
  level: "ProMaster"
)

director_user = User.create!(
  username: "jim_provost",
  email: "jim@usafoosball.com",
  password: "password", 
  password_confirmation: "password",
  firstname: "Jim",
  lastname: "Provost",
  fullname: "Jim Provost",
  admin: false,
  director: true,
  about: "Executive Director and tournament organizer. Dedicated to growing the sport across America.",
  phone: "(555) 234-5678",
  address: "456 Tournament Dr",
  city: "Denver",
  state: "CO",
  zip_code: "80202",
  level: "Pro"
)

regular_user = User.create!(
  username: "dave_hertz",
  email: "dave@usafoosball.com",
  password: "password",
  password_confirmation: "password", 
  firstname: "Dave",
  lastname: "Hertzenberg",
  fullname: "Dave Hertzenberg",
  admin: false,
  director: false,
  about: "Long-time foosball enthusiast and community organizer.",
  phone: "(555) 345-6789",
  address: "789 Player St",
  city: "Portland",
  state: "OR",
  zip_code: "97205",
  level: "Expert"
)

puts "Created #{User.count} users"

# Create test articles (same as original)
puts "Creating test articles..."

Article.create!(
  title: "USA Foosball Championship 2024 Announced",
  author: "Tournament Committee",
  slug: "usa-foosball-championship-2024",
  featured: true,
  published_at: 2.days.ago,
  content: "<p>We're excited to announce the dates and location for the 2024 USA Foosball Championship...</p>"
)

Article.create!(
  title: "New Tournament Rules for 2024 Season",
  author: "Rules Committee", 
  slug: "new-tournament-rules-2024",
  featured: false,
  published_at: 1.week.ago,
  content: "<p>Several important rule changes will take effect for the 2024 tournament season...</p>"
)

Article.create!(
  title: "Foosball Training Tips from the Pros",
  author: "Pro Players",
  slug: "foosball-training-tips-pros",
  featured: true,
  published_at: 3.days.ago,
  content: "<p>Learn advanced techniques and strategies from professional foosball players...</p>"
)

puts "Created #{Article.count} articles"

# Create test documents (same as original)
puts "Creating test documents..."

Document.create!(
  title: "Official Tournament Rules",
  description: "Complete rulebook for all sanctioned USA Foosball tournaments and competitions.",
  file_url: "https://example.com/tournament-rules.pdf",
  uploaded_by: "Tournament Committee"
)

Document.create!(
  title: "Player Registration Form", 
  description: "Required form for all players participating in USA Foosball sanctioned events.",
  file_url: "https://example.com/player-registration.pdf",
  uploaded_by: "Registration Committee"
)

Document.create!(
  title: "Club Charter Application",
  description: "Application form for establishing new USA Foosball affiliated clubs.",
  file_url: "https://example.com/club-charter.pdf", 
  uploaded_by: "Club Development"
)

puts "Created #{Document.count} documents"

# Create comprehensive clubs data - 1-3 clubs per state/DC
puts "Creating clubs across all 50 states and DC..."

clubs_data = [
  # Alabama
  { name: "Birmingham Foosball League", city: "Birmingham", state: "AL", zip: "35203" },
  { name: "Mobile Bay Foosball Club", city: "Mobile", state: "AL", zip: "36601" },
  
  # Alaska
  { name: "Anchorage Table Sports", city: "Anchorage", state: "AK", zip: "99501" },
  
  # Arizona
  { name: "Phoenix Foosball Association", city: "Phoenix", state: "AZ", zip: "85001" },
  { name: "Tucson Table Football", city: "Tucson", state: "AZ", zip: "85701" },
  
  # Arkansas
  { name: "Little Rock Foosball Club", city: "Little Rock", state: "AR", zip: "72201" },
  
  # California
  { name: "Golden State Foosball", city: "Los Angeles", state: "CA", zip: "90210" },
  { name: "Bay Area Foosball League", city: "San Francisco", state: "CA", zip: "94102" },
  { name: "San Diego Foosball Club", city: "San Diego", state: "CA", zip: "92101" },
  
  # Colorado  
  { name: "Denver Mountain Foosball", city: "Denver", state: "CO", zip: "80202" },
  { name: "Colorado Springs Foosball", city: "Colorado Springs", state: "CO", zip: "80903" },
  
  # Connecticut
  { name: "Hartford Foosball League", city: "Hartford", state: "CT", zip: "06103" },
  
  # Delaware
  { name: "First State Foosball", city: "Wilmington", state: "DE", zip: "19801" },
  
  # District of Columbia
  { name: "Capital City Foosball", city: "Washington", state: "DC", zip: "20001" },
  { name: "DC Metro Foosball League", city: "Washington", state: "DC", zip: "20002" },
  
  # Florida
  { name: "Elite Foosball Training", city: "Miami", state: "FL", zip: "33101" },
  { name: "Orlando Foosball Club", city: "Orlando", state: "FL", zip: "32801" },
  { name: "Tampa Bay Foosball", city: "Tampa", state: "FL", zip: "33602" },
  
  # Georgia
  { name: "Atlanta Foosball Association", city: "Atlanta", state: "GA", zip: "30303" },
  { name: "Savannah Coastal Foosball", city: "Savannah", state: "GA", zip: "31401" },
  
  # Hawaii
  { name: "Aloha Foosball Club", city: "Honolulu", state: "HI", zip: "96813" },
  
  # Idaho
  { name: "Boise Foosball League", city: "Boise", state: "ID", zip: "83702" },
  
  # Illinois
  { name: "Windy City Foosball", city: "Chicago", state: "IL", zip: "60601" },
  { name: "Springfield Foosball Club", city: "Springfield", state: "IL", zip: "62701" },
  
  # Indiana
  { name: "Indianapolis Foosball League", city: "Indianapolis", state: "IN", zip: "46204" },
  { name: "Fort Wayne Foosball", city: "Fort Wayne", state: "IN", zip: "46802" },
  
  # Iowa
  { name: "Des Moines Foosball Club", city: "Des Moines", state: "IA", zip: "50309" },
  
  # Kansas
  { name: "Wichita Foosball Association", city: "Wichita", state: "KS", zip: "67202" },
  
  # Kentucky
  { name: "Louisville Foosball League", city: "Louisville", state: "KY", zip: "40202" },
  { name: "Lexington Foosball Club", city: "Lexington", state: "KY", zip: "40507" },
  
  # Louisiana
  { name: "New Orleans Foosball Club", city: "New Orleans", state: "LA", zip: "70112" },
  { name: "Baton Rouge Foosball", city: "Baton Rouge", state: "LA", zip: "70801" },
  
  # Maine
  { name: "Portland Foosball League", city: "Portland", state: "ME", zip: "04102" },
  
  # Maryland
  { name: "Baltimore Foosball Club", city: "Baltimore", state: "MD", zip: "21201" },
  { name: "Annapolis Foosball League", city: "Annapolis", state: "MD", zip: "21401" },
  
  # Massachusetts
  { name: "Boston Foosball Association", city: "Boston", state: "MA", zip: "02108" },
  { name: "Worcester Foosball Club", city: "Worcester", state: "MA", zip: "01608" },
  
  # Michigan
  { name: "Detroit Motor City Foosball", city: "Detroit", state: "MI", zip: "48226" },
  { name: "Grand Rapids Foosball", city: "Grand Rapids", state: "MI", zip: "49503" },
  
  # Minnesota
  { name: "Twin Cities Foosball", city: "Minneapolis", state: "MN", zip: "55401" },
  { name: "Duluth Foosball Club", city: "Duluth", state: "MN", zip: "55802" },
  
  # Mississippi
  { name: "Jackson Foosball League", city: "Jackson", state: "MS", zip: "39201" },
  
  # Missouri
  { name: "Kansas City Foosball Club", city: "Kansas City", state: "MO", zip: "64108" },
  { name: "St. Louis Foosball League", city: "St. Louis", state: "MO", zip: "63101" },
  
  # Montana
  { name: "Big Sky Foosball", city: "Billings", state: "MT", zip: "59101" },
  
  # Nebraska
  { name: "Omaha Foosball Association", city: "Omaha", state: "NE", zip: "68102" },
  
  # Nevada
  { name: "Las Vegas Foosball Club", city: "Las Vegas", state: "NV", zip: "89101" },
  { name: "Reno Foosball League", city: "Reno", state: "NV", zip: "89501" },
  
  # New Hampshire
  { name: "Manchester Foosball Club", city: "Manchester", state: "NH", zip: "03101" },
  
  # New Jersey
  { name: "Newark Foosball League", city: "Newark", state: "NJ", zip: "07102" },
  { name: "Atlantic City Foosball", city: "Atlantic City", state: "NJ", zip: "08401" },
  
  # New Mexico
  { name: "Albuquerque Foosball Club", city: "Albuquerque", state: "NM", zip: "87102" },
  
  # New York
  { name: "Metro Foosball League", city: "New York", state: "NY", zip: "10001" },
  { name: "Buffalo Foosball Club", city: "Buffalo", state: "NY", zip: "14202" },
  { name: "Albany Foosball Association", city: "Albany", state: "NY", zip: "12207" },
  
  # North Carolina
  { name: "Charlotte Foosball League", city: "Charlotte", state: "NC", zip: "28202" },
  { name: "Raleigh Foosball Club", city: "Raleigh", state: "NC", zip: "27601" },
  
  # North Dakota
  { name: "Fargo Foosball Club", city: "Fargo", state: "ND", zip: "58102" },
  
  # Ohio
  { name: "Cleveland Foosball League", city: "Cleveland", state: "OH", zip: "44113" },
  { name: "Columbus Foosball Club", city: "Columbus", state: "OH", zip: "43215" },
  { name: "Cincinnati Foosball", city: "Cincinnati", state: "OH", zip: "45202" },
  
  # Oklahoma
  { name: "Oklahoma City Foosball", city: "Oklahoma City", state: "OK", zip: "73102" },
  { name: "Tulsa Foosball League", city: "Tulsa", state: "OK", zip: "74103" },
  
  # Oregon
  { name: "Portland Foosball Association", city: "Portland", state: "OR", zip: "97205" },
  { name: "Eugene Foosball Club", city: "Eugene", state: "OR", zip: "97401" },
  
  # Pennsylvania
  { name: "Philadelphia Foosball League", city: "Philadelphia", state: "PA", zip: "19107" },
  { name: "Pittsburgh Foosball Club", city: "Pittsburgh", state: "PA", zip: "15222" },
  
  # Rhode Island
  { name: "Providence Foosball Club", city: "Providence", state: "RI", zip: "02903" },
  
  # South Carolina
  { name: "Charleston Foosball League", city: "Charleston", state: "SC", zip: "29401" },
  { name: "Columbia Foosball Club", city: "Columbia", state: "SC", zip: "29201" },
  
  # South Dakota
  { name: "Sioux Falls Foosball", city: "Sioux Falls", state: "SD", zip: "57104" },
  
  # Tennessee
  { name: "Nashville Foosball League", city: "Nashville", state: "TN", zip: "37203" },
  { name: "Memphis Foosball Club", city: "Memphis", state: "TN", zip: "38103" },
  
  # Texas
  { name: "Lone Star Foosball Club", city: "Austin", state: "TX", zip: "73301" },
  { name: "Houston Foosball League", city: "Houston", state: "TX", zip: "77002" },
  { name: "Dallas Foosball Association", city: "Dallas", state: "TX", zip: "75201" },
  
  # Utah
  { name: "Salt Lake Foosball Club", city: "Salt Lake City", state: "UT", zip: "84111" },
  { name: "Provo Foosball League", city: "Provo", state: "UT", zip: "84601" },
  
  # Vermont
  { name: "Burlington Foosball Club", city: "Burlington", state: "VT", zip: "05401" },
  
  # Virginia
  { name: "Richmond Foosball League", city: "Richmond", state: "VA", zip: "23219" },
  { name: "Virginia Beach Foosball", city: "Virginia Beach", state: "VA", zip: "23451" },
  
  # Washington
  { name: "Seattle Foosball Association", city: "Seattle", state: "WA", zip: "98101" },
  { name: "Spokane Foosball Club", city: "Spokane", state: "WA", zip: "99201" },
  
  # West Virginia
  { name: "Charleston Foosball League", city: "Charleston", state: "WV", zip: "25301" },
  
  # Wisconsin
  { name: "Milwaukee Foosball Club", city: "Milwaukee", state: "WI", zip: "53202" },
  { name: "Madison Foosball League", city: "Madison", state: "WI", zip: "53703" },
  
  # Wyoming
  { name: "Cheyenne Foosball Club", city: "Cheyenne", state: "WY", zip: "82001" }
]

# Sample data for variety
descriptions = [
  "Premier foosball club with weekly tournaments and leagues for all skill levels.",
  "Friendly community club welcoming players of all abilities and experience levels.", 
  "Competitive foosball league featuring tournament-grade tables and expert coaching.",
  "Family-friendly venue with casual play and organized tournaments.",
  "Professional training facility with coaching programs for serious players.",
  "Established club with a rich history of developing champion players.",
  "All-ages venue perfect for beginners and experienced players alike.",
  "State-of-the-art facility featuring the latest tournament equipment.",
  "Community-focused club promoting foosball across the region.",
  "Tournament-level play in a welcoming and inclusive environment."
]

schedules = [
  "Mondays and Wednesdays 7 PM-10 PM, Saturdays 2 PM-8 PM",
  "Tuesday and Thursday leagues 6 PM-9 PM, Open play weekends", 
  "Wednesdays 7 PM-10 PM, Saturdays 1 PM-6 PM",
  "Monday-Friday 6 PM-9 PM, Sunday tournaments 12 PM-6 PM",
  "Daily 10 AM-10 PM, special events on weekends",
  "Weekday evenings 7 PM-10 PM, Weekend tournaments",
  "Open play Tuesdays and Thursdays 7 PM-9 PM",
  "Weekend tournaments, weeknight practice sessions",
  "Thursday leagues 7 PM-10 PM, Saturday open play 2 PM-8 PM",
  "Monday and Friday evenings, Sunday afternoon tournaments"
]

contact_names = [
  "Mike Johnson", "Sarah Wilson", "David Martinez", "Jennifer Adams",
  "Carlos Rodriguez", "Lisa Thompson", "Robert Chen", "Amanda Davis", 
  "Michael Brown", "Emily Garcia", "James Miller", "Jessica Lee",
  "Kevin White", "Rachel Green", "Brian Clark", "Nicole Taylor",
  "Steven Anderson", "Maria Gonzalez", "Daniel Moore", "Ashley Jackson"
]

street_names = [
  "Main St", "Oak Ave", "Park Blvd", "Center St", "First Ave",
  "Elm Street", "Maple Drive", "Pine Road", "Victory Lane", "Sports Way"
]

# Area codes by state for realistic phone numbers
area_codes = {
  "AL" => "205", "AK" => "907", "AZ" => "602", "AR" => "501", "CA" => "310",
  "CO" => "303", "CT" => "860", "DE" => "302", "DC" => "202", "FL" => "305",
  "GA" => "404", "HI" => "808", "ID" => "208", "IL" => "312", "IN" => "317",
  "IA" => "515", "KS" => "316", "KY" => "502", "LA" => "504", "ME" => "207",
  "MD" => "410", "MA" => "617", "MI" => "313", "MN" => "612", "MS" => "601",
  "MO" => "816", "MT" => "406", "NE" => "402", "NV" => "702", "NH" => "603",
  "NJ" => "973", "NM" => "505", "NY" => "212", "NC" => "704", "ND" => "701",
  "OH" => "216", "OK" => "405", "OR" => "503", "PA" => "215", "RI" => "401",
  "SC" => "843", "SD" => "605", "TN" => "615", "TX" => "512", "UT" => "801",
  "VT" => "802", "VA" => "804", "WA" => "206", "WV" => "304", "WI" => "414", "WY" => "307"
}

created_clubs = []

clubs_data.each_with_index do |club_data, index|
  area_code = area_codes[club_data[:state]] || "555"
  phone_suffix = sprintf("%03d", rand(1000))
  
  club = Club.create!(
    name: club_data[:name],
    address: "#{100 + rand(900)} #{street_names.sample}",
    city: club_data[:city], 
    state: club_data[:state],
    zip_code: club_data[:zip],
    phone: "(#{area_code}) 555-#{phone_suffix}",
    email: "info@#{club_data[:name].downcase.gsub(/[^a-z0-9]/, '')}.com",
    website: "https://www.#{club_data[:name].downcase.gsub(/[^a-z0-9]/, '')}.com",
    coordinates: "#{rand(25.0..49.0).round(4)}, #{rand(-125.0..-67.0).round(4)}",
    day_and_time_info: schedules.sample,
    description: descriptions.sample + " Features #{rand(4..12)} professional tournament tables.",
    contact_person: contact_names.sample,
    established_date: Date.new(rand(2000..2023), rand(1..12), rand(1..28))
  )
  created_clubs << club
end

puts "Created #{created_clubs.length} clubs across all 50 states and DC!"
puts "\nClubs by state:"
created_clubs.group_by(&:state).sort.each do |state, clubs|
  puts "#{state}: #{clubs.length} clubs"
end

puts "\n=== SEED DATA COMPLETE ==="
puts "Users: #{User.count}"
puts "Articles: #{Article.count}" 
puts "Documents: #{Document.count}"
puts "Clubs: #{Club.count}"
puts "\nYou can now test the state search functionality!"
puts "Visit /clubs and try searching for different states"