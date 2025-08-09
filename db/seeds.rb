# Create test users for USA Foosball application

# Clear existing users
User.destroy_all

# Create admin users
shawn_lindsey = User.create!(
  username: 'Superstar3000',
  email: 'slindsey3000@gmail.com',
  password: 'password123',
  firstname: 'Shawn',
  lastname: 'Lindsey',
  fullname: 'Shawn Lindsey',
  admin: true,
  director: true,
  about: 'President and founder of USA Foosball Association. Passionate about growing the sport and building a strong community of players across the United States.',
  image_url: nil
)

jim_provest = User.create!(
  username: 'ILoveProduce',
  email: 'jamesprovost44@gmail.com',
  password: 'password123',
  firstname: 'Jim',
  lastname: 'Provost',
  fullname: 'Jim Provost',
  admin: true,
  director: true,
  about: 'Marketing of USA Foosball Association. Former professional player with over 20 years of experience in tournament organization and player development.',
  image_url: nil
)

# Create regular user
dave_hertzenberg = User.create!(
  username: 'dave_hertzenberg',
  email: 'dave@usafoosball.com',
  password: 'password123',
  firstname: 'Dave',
  lastname: 'Hertzenberg',
  fullname: 'Dave Hertzenberg',
  admin: false,
  director: true,
  about: 'Board member and regional coordinator for the Midwest. Dedicated to expanding foosball opportunities in local communities and schools.',
  image_url: nil
)

puts "Created admin user: #{shawn_lindsey.fullname} (username: #{shawn_lindsey.username}, password: password123)"
puts "Created admin user: #{jim_provest.fullname} (username: #{jim_provest.username}, password: password123)"
puts "Created regular user: #{dave_hertzenberg.fullname} (username: #{dave_hertzenberg.username}, password: password123)"

puts "\nSeed data created successfully!"
puts "You can now sign in with:"
puts "- Admin users: Superstar3000 or ILoveProduce (password: password123)"
puts "- Regular user: dave_hertzenberg (password: password123)"

# Create test articles
puts "\nCreating test articles..."

Article.destroy_all

article1 = Article.create!(
  title: "2024 National Championship Announced",
  content: "<h2>Exciting News for USA Foosball!</h2><p>The USA Foosball Association is thrilled to announce the <strong>2024 National Championship Tournament</strong> will be held in <em>Las Vegas, Nevada</em> from June 15-20, 2024.</p><p>This year's championship will feature:</p><ul><li>Open Division with $50,000 prize pool</li><li>Women's Division with $25,000 prize pool</li><li>Junior Division for players under 18</li><li>Doubles and Singles competitions</li></ul><p>Registration opens on March 1st, 2024. Don't miss your chance to compete for the national title!</p>",
  author: "Shawn Lindsey",
  published_at: 2.days.ago,
  featured: true,
  image_url: "https://foosballplanet.com/cdn/shop/files/NSC-MatthewMTornadoTournamentT-3000FoosballTablewoassemblycompletedpic1_bd907b39-51a6-4c28-986a-1dcfde66cd4c_large.jpg?v=1692697838"
)

article2 = Article.create!(
  title: "New Training Program Launches",
  content: "<h2>Improve Your Game with Our New Training Program</h2><p>We're excited to launch our <strong>comprehensive training program</strong> designed for players of all skill levels.</p><p>The program includes:</p><ul><li>Weekly online coaching sessions</li><li>Video analysis of your technique</li><li>Personalized training plans</li><li>Access to exclusive training materials</li></ul><p>Whether you're a beginner looking to learn the basics or an advanced player wanting to perfect your technique, our program has something for everyone.</p><p>Sign up today and start improving your foosball skills!</p>",
  author: "Jim Provest",
  published_at: 5.days.ago,
  featured: true,
  image_url: "https://www.mensjournal.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_618/MTk2MTM2NjcyOTc1OTg4MjI5/mj-618_348_the-party-boy-king-of-foosball.webp"
)

article3 = Article.create!(
  title: "Regional League Updates",
  content: "<h2>Latest Updates from Regional Leagues</h2><p>Here are the latest standings and updates from our regional leagues across the country:</p><h3>East Coast League</h3><p>The New York Foosball Club continues to dominate with a perfect 12-0 record. Their star player, <strong>Mike Rodriguez</strong>, has been named Player of the Month for the third consecutive month.</p><h3>West Coast League</h3><p>The Los Angeles Foosball Association has seen a surge in new members, with participation up 25% from last year. The championship match is scheduled for next month.</p><h3>Midwest League</h3><p>Chicago's foosball scene is heating up with three teams tied for first place. The playoff race is going to be exciting!</p>",
  author: "Dave Hertzenberg",
  published_at: 1.week.ago,
  featured: false,
  image_url: "https://foosballplanet.com/cdn/shop/files/NSC-MatthewMTornadoTournamentT-3000FoosballTablewoassemblycompletedpic1_bd907b39-51a6-4c28-986a-1dcfde66cd4c_large.jpg?v=1692697838"
)

article4 = Article.create!(
  title: "Professional Player Spotlight: The Rising Stars",
  content: "<h2>Meet the Next Generation of Foosball Champions</h2><p>Every year, new talent emerges in the competitive foosball scene. This month, we're highlighting three rising stars who are making waves in professional tournaments.</p><h3>Sarah Martinez - West Coast Sensation</h3><p>At just 22 years old, Sarah has already won three regional championships and is quickly becoming known for her lightning-fast defensive plays and strategic offensive moves.</p><h3>Marcus Johnson - Midwest Marvel</h3><p>Marcus brings a unique style to the table, combining traditional techniques with innovative new strategies that have caught many opponents off guard.</p><h3>Elena Rodriguez - East Coast Elite</h3><p>Elena's precision and consistency have earned her a spot in the top 10 national rankings, and she's showing no signs of slowing down.</p>",
  author: "Tournament Reporter",
  published_at: 4.days.ago,
  featured: true,
  image_url: "https://www.mensjournal.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_618/MTk2MTM2NjcyOTc1OTg4MjI5/mj-618_348_the-party-boy-king-of-foosball.webp"
)

article5 = Article.create!(
  title: "Equipment Guide: Choosing Your Perfect Table",
  content: "<h2>Finding the Right Foosball Table for Your Needs</h2><p>Whether you're setting up a game room at home or outfitting a professional training facility, choosing the right foosball table is crucial for the best playing experience.</p><h3>Tournament-Grade Tables</h3><p>For serious players, tournament-grade tables offer the precision and durability needed for competitive play. Look for features like:</p><ul><li>Solid construction with heavy-duty materials</li><li>Professional-grade rods with proper bearings</li><li>Competition-approved ball design</li><li>Regulation playing surface dimensions</li></ul><h3>Home Recreation Tables</h3><p>For casual players and families, recreational tables provide great entertainment value while being more budget-friendly.</p><p>Remember, the right table can make all the difference in developing your skills and enjoying the game!</p>",
  author: "Equipment Specialist",
  published_at: 6.days.ago,
  featured: false,
  image_url: "https://foosballplanet.com/cdn/shop/files/NSC-MatthewMTornadoTournamentT-3000FoosballTablewoassemblycompletedpic1_bd907b39-51a6-4c28-986a-1dcfde66cd4c_large.jpg?v=1692697838"
)

puts "Created article: #{article1.title}"
puts "Created article: #{article2.title}"
puts "Created article: #{article3.title}"
puts "Created article: #{article4.title}"
puts "Created article: #{article5.title}"

puts "\nArticles created successfully!"
puts "You can now view articles at /news"

# Create test documents
puts "\nCreating test documents..."

Document.destroy_all

document1 = Document.create!(
  title: "USA Foosball Official Rules",
  description: "Complete official rules and regulations for USA Foosball tournaments and competitions. This document covers all aspects of gameplay, scoring, and tournament procedures.",
  uploaded_by: "Shawn Lindsey",
  file_url: "https://example.com/documents/usa-foosball-rules.pdf"
)

document2 = Document.create!(
  title: "Tournament Registration Form",
  description: "Official registration form for USA Foosball tournaments. Complete this form to register for upcoming competitions and events.",
  uploaded_by: "Jim Provost",
  file_url: "https://example.com/documents/tournament-registration.docx"
)

document3 = Document.create!(
  title: "Player Code of Conduct",
  description: "Standards of behavior and conduct expected from all USA Foosball players, officials, and spectators at tournaments and events.",
  uploaded_by: "Dave Hertzenberg",
  file_url: "https://example.com/documents/player-code-of-conduct.pdf"
)

puts "Created document: #{document1.title}"
puts "Created document: #{document2.title}"
puts "Created document: #{document3.title}"

puts "\nDocuments created successfully!"
puts "You can now view documents at /documents"

# Create test clubs
puts "\nCreating test clubs..."

Club.destroy_all

club1 = Club.create!(
  name: "Downtown Foosball Club",
  address: "123 Main Street",
  city: "New York",
  state: "NY",
  zip_code: "10001",
  phone: "(212) 555-0123",
  email: "info@downtownfoosball.com",
  website: "https://www.downtownfoosball.com",
  coordinates: "40.7128, -74.0060",
  day_and_time_info: "Monday and Wednesday evenings 7-10 PM, Saturday afternoons 2-6 PM",
  description: "Premier foosball facility with 12 tournament tables, professional lighting, and a full bar. Host to monthly tournaments and weekly leagues.",
  contact_person: "Mike Johnson",
  established_date: Date.new(2018, 3, 15)
)

club2 = Club.create!(
  name: "Sports Bar & Grill",
  address: "456 Oak Avenue",
  city: "Los Angeles",
  state: "CA",
  zip_code: "90210",
  phone: "(310) 555-0456",
  email: "manager@sportsbarla.com",
  website: "https://www.sportsbarla.com",
  coordinates: "34.0522, -118.2437",
  day_and_time_info: "Tuesday and Thursday nights 8-11 PM, Sunday all day",
  description: "Casual play with great food and atmosphere. 4 Tornado tables in a relaxed bar setting. Perfect for beginners and casual players.",
  contact_person: "Sarah Williams",
  established_date: Date.new(2019, 6, 20)
)

club3 = Club.create!(
  name: "Community Center Foosball",
  address: "789 Pine Road",
  city: "Chicago",
  state: "IL",
  zip_code: "60601",
  phone: "(312) 555-0789",
  email: "foosball@communitycenter.org",
  website: "https://www.communitycenter.org/foosball",
  coordinates: "41.8781, -87.6298",
  day_and_time_info: "Wednesday and Friday evenings 6-9 PM, Saturday mornings 10 AM-1 PM",
  description: "Family-friendly environment with beginner tables and coaching available. Great for families and new players learning the game.",
  contact_person: "David Chen",
  established_date: Date.new(2020, 1, 10)
)

club4 = Club.create!(
  name: "University Rec Center",
  address: "321 Campus Drive",
  city: "Austin",
  state: "TX",
  zip_code: "73301",
  phone: "(512) 555-0321",
  email: "recsports@university.edu",
  website: "https://recreation.university.edu/foosball",
  coordinates: "30.2672, -97.7431",
  day_and_time_info: "Monday through Friday 4-8 PM, weekends 12-6 PM",
  description: "Student-focused facility with competitive leagues and intramural tournaments. Open to students and community members.",
  contact_person: "Jennifer Martinez",
  established_date: Date.new(2017, 9, 5)
)

club5 = Club.create!(
  name: "Professional Training Center",
  address: "654 Elite Boulevard",
  city: "Miami",
  state: "FL",
  zip_code: "33101",
  phone: "(305) 555-0654",
  email: "training@elitefoosball.com",
  website: "https://www.elitefoosball.com",
  coordinates: "25.7617, -80.1918",
  day_and_time_info: "By appointment, Monday through Saturday 9 AM-9 PM",
  description: "High-end facility with coaching and tournaments. Professional training programs for serious players looking to improve their game.",
  contact_person: "Carlos Rodriguez",
  established_date: Date.new(2016, 11, 12)
)

club6 = Club.create!(
  name: "Family Entertainment Center",
  address: "987 Fun Way",
  city: "Seattle",
  state: "WA",
  zip_code: "98101",
  phone: "(206) 555-0987",
  email: "info@familyfuncenter.com",
  website: "https://www.familyfuncenter.com",
  coordinates: "47.6062, -122.3321",
  day_and_time_info: "Daily 10 AM-10 PM, special events on weekends",
  description: "All-ages venue with multiple table types including Tornado, Warrior, and classic tables. Perfect for family outings and casual play.",
  contact_person: "Lisa Thompson",
  established_date: Date.new(2019, 4, 8)
)

puts "Created club: #{club1.name}"
puts "Created club: #{club2.name}"
puts "Created club: #{club3.name}"
puts "Created club: #{club4.name}"
puts "Created club: #{club5.name}"
puts "Created club: #{club6.name}"

puts "\nClubs created successfully!"
puts "You can now view clubs at /clubs"
