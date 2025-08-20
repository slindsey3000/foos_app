# USA Foosball Database Seed File
# This file destroys all existing data and creates fresh seed data

puts "🗑️  Destroying all existing data..."

# Destroy all data in reverse dependency order
User.destroy_all
Article.destroy_all
Document.destroy_all
Club.destroy_all

puts "✅ All existing data destroyed"

# Load directors, admins, and World Cup selection committee
puts "\n👥 Loading directors, admins, and World Cup selection committee..."
load(Rails.root.join('db', 'directors_admin_seed.rb'))

puts "\n📰 Creating test articles..."

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

puts "✅ Created #{Article.count} articles"
puts "📄 Creating documents from assets/documents folder..."

# Find Maryam Aly or any admin user
uploader = User.find_by(firstname: "Maryam", lastname: "Aly")
uploader ||= User.where(admin: true).first

if uploader
  documents_dir = Rails.root.join("public", "assets", "documents")
  if Dir.exist?(documents_dir)
    Dir.glob(File.join(documents_dir, "*")).each do |file_path|
      next unless File.file?(file_path)
      
      filename = File.basename(file_path)
      title = filename.gsub(/.[^.]*$/, "").gsub(/_/, " ").titleize
      description = "Document: #{title}"
      file_url = "https://usafoosball.org/assets/documents/#{filename}"
      
      Document.create!(
        title: title,
        description: description,
        uploaded_by: uploader.fullname,
        file_url: file_url
      )
      
      puts "✅ Created document: #{title}"
    end
  else
    puts "⚠️  Documents directory not found: #{documents_dir}"
  end
else
  puts "⚠️  No admin user found to upload documents"
end

puts "✅ Created #{Document.count} documents from assets folder"

puts "\n🏢 Creating test clubs..."

club1 = Club.create!(
  name: "Downtown Foosball Club",
  address: "123 Main Street",
  city: "New York",
  state: "NY",
  zip_code: "10001",
  phone: "(212) 555-0123",
  email: "info@downtownfoosball.com",
  website: "https://downtownfoosball.com",
  day_and_time_info: "Open Monday-Friday 6PM-11PM, Saturday-Sunday 2PM-10PM",
  description: "Premier foosball club in downtown Manhattan with tournament-grade tables and regular competitions.",
  contact_person: "Mike Rodriguez",
  established_date: Date.new(2020, 3, 15)
)

club2 = Club.create!(
  name: "Sports Bar & Grill",
  address: "456 Oak Avenue",
  city: "Los Angeles",
  state: "CA",
  zip_code: "90210",
  phone: "(310) 555-0456",
  email: "contact@sportsbarla.com",
  website: "https://sportsbarla.com",
  day_and_time_info: "Open daily 11AM-2AM, Foosball tournaments every Tuesday at 8PM",
  description: "Popular sports bar with multiple foosball tables and weekly tournaments.",
  contact_person: "Sarah Martinez",
  established_date: Date.new(2019, 8, 22)
)

club3 = Club.create!(
  name: "Community Center Foosball",
  address: "789 Pine Street",
  city: "Chicago",
  state: "IL",
  zip_code: "60601",
  phone: "(312) 555-0789",
  email: "foosball@communitycenter.org",
  website: "https://communitycenter.org",
  day_and_time_info: "Open Monday-Saturday 9AM-9PM, Youth programs on weekends",
  description: "Community center offering foosball for all ages with beginner-friendly programs.",
  contact_person: "Marcus Johnson",
  established_date: Date.new(2021, 1, 10)
)

club4 = Club.create!(
  name: "University Rec Center",
  address: "321 Campus Drive",
  city: "Austin",
  state: "TX",
  zip_code: "78701",
  phone: "(512) 555-0321",
  email: "rec@university.edu",
  website: "https://university.edu/rec",
  day_and_time_info: "Open to students and faculty, tournaments monthly",
  description: "University recreation center with foosball tables available to students and staff.",
  contact_person: "Elena Rodriguez",
  established_date: Date.new(2018, 9, 5)
)

club5 = Club.create!(
  name: "Professional Training Center",
  address: "654 Elite Boulevard",
  city: "Miami",
  state: "FL",
  zip_code: "33101",
  phone: "(305) 555-0654",
  email: "training@profoosball.com",
  website: "https://profoosball.com",
  day_and_time_info: "By appointment only, professional training sessions available",
  description: "Professional foosball training facility with coaching and tournament preparation.",
  contact_person: "Coach Thompson",
  established_date: Date.new(2022, 6, 12)
)

club6 = Club.create!(
  name: "Family Entertainment Center",
  address: "987 Fun Lane",
  city: "Denver",
  state: "CO",
  zip_code: "80201",
  phone: "(303) 555-0987",
  email: "fun@familyentertainment.com",
  website: "https://familyentertainment.com",
  day_and_time_info: "Open daily 10AM-10PM, family-friendly environment",
  description: "Family-oriented entertainment center with foosball and other games.",
  contact_person: "Family Manager",
  established_date: Date.new(2020, 11, 20)
)

puts "✅ Created #{Club.count} clubs"

puts "\n🎉 Database seeding completed successfully!"
puts "\n📊 Summary:"
puts "- Users: #{User.count}"
puts "- Articles: #{Article.count}"
puts "- Documents: #{Document.count}"
puts "- Clubs: #{Club.count}"
puts "\n🔗 You can now view:"
puts "- Articles at /news"
puts "- Documents at /documents"
puts "- Clubs at /clubs"
puts "- Board of Directors at /board"
