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
