# Create test users for USA Foosball application

# Clear existing users
User.destroy_all

# Create admin users
shawn_lindsey = User.create!(
  username: 'shawn_lindsey',
  email: 'shawn@usafoosball.com',
  password: 'password123',
  firstname: 'Shawn',
  lastname: 'Lindsey',
  fullname: 'Shawn Lindsey',
  admin: true
)

jim_provest = User.create!(
  username: 'jim_provest',
  email: 'jim@usafoosball.com',
  password: 'password123',
  firstname: 'Jim',
  lastname: 'Provest',
  fullname: 'Jim Provest',
  admin: true
)

# Create regular user
dave_hertzenberg = User.create!(
  username: 'dave_hertzenberg',
  email: 'dave@usafoosball.com',
  password: 'password123',
  firstname: 'Dave',
  lastname: 'Hertzenberg',
  fullname: 'Dave Hertzenberg',
  admin: false
)

puts "Created admin user: #{shawn_lindsey.fullname} (username: #{shawn_lindsey.username}, password: password123)"
puts "Created admin user: #{jim_provest.fullname} (username: #{jim_provest.username}, password: password123)"
puts "Created regular user: #{dave_hertzenberg.fullname} (username: #{dave_hertzenberg.username}, password: password123)"

puts "\nSeed data created successfully!"
puts "You can now sign in with:"
puts "- Admin users: shawn_lindsey or jim_provest (password: password123)"
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
  image_url: "https://britfoos.com/wp-content/uploads/2025/02/475154782_1144207341044702_8672012232587329587_n.jpg"
)

article2 = Article.create!(
  title: "New Training Program Launches",
  content: "<h2>Improve Your Game with Our New Training Program</h2><p>We're excited to launch our <strong>comprehensive training program</strong> designed for players of all skill levels.</p><p>The program includes:</p><ul><li>Weekly online coaching sessions</li><li>Video analysis of your technique</li><li>Personalized training plans</li><li>Access to exclusive training materials</li></ul><p>Whether you're a beginner looking to learn the basics or an advanced player wanting to perfect your technique, our program has something for everyone.</p><p>Sign up today and start improving your foosball skills!</p>",
  author: "Jim Provest",
  published_at: 5.days.ago,
  featured: true,
  image_url: "https://britfoos.com/wp-content/uploads/2023/02/327900913_8768485673223358_6628759631875715819_n-1200x900.jpeg"
)

article3 = Article.create!(
  title: "Regional League Updates",
  content: "<h2>Latest Updates from Regional Leagues</h2><p>Here are the latest standings and updates from our regional leagues across the country:</p><h3>East Coast League</h3><p>The New York Foosball Club continues to dominate with a perfect 12-0 record. Their star player, <strong>Mike Rodriguez</strong>, has been named Player of the Month for the third consecutive month.</p><h3>West Coast League</h3><p>The Los Angeles Foosball Association has seen a surge in new members, with participation up 25% from last year. The championship match is scheduled for next month.</p><h3>Midwest League</h3><p>Chicago's foosball scene is heating up with three teams tied for first place. The playoff race is going to be exciting!</p>",
  author: "Dave Hertzenberg",
  published_at: 1.week.ago,
  featured: false,
  image_url: "https://britfoos.com/wp-content/uploads/2025/02/473812784_1136507678481335_7599134555701409039_n-1200x824.jpg"
)

puts "Created article: #{article1.title}"
puts "Created article: #{article2.title}"
puts "Created article: #{article3.title}"

puts "\nArticles created successfully!"
puts "You can now view articles at /news"
