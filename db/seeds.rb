# Create test users for USA Foosball application

# Load directors, admins, and World Cup selection committee
# Clear all existing data for a fresh start
User.destroy_all
Article.destroy_all
Document.destroy_all
Club.destroy_all
load(Rails.root.join('db', 'directors_admin_seed.rb'))

puts "\nSeed data created successfully!"

# Create articles from news files
puts "\nCreating articles from news files..."

# Find Foos News user for article association
foos_news_user = User.find_by(firstname: "Foos", lastname: "News")
if foos_news_user.nil?
  puts "❌ Foos News user not found! Cannot create articles."
else
  puts "✅ Found Foos News: #{foos_news_user.fullname}"
  
  news_dir = Rails.root.join("public", "assets", "documents", "news")
  puts "📁 Checking news directory: #{news_dir}"
  
  if Dir.exist?(news_dir)
    puts "✅ News directory exists!"
    puts "🔍 Scanning for news files..."
    
    files_found = Dir.glob(File.join(news_dir, "*"))
    puts "📋 Found #{files_found.length} items in directory"
    
    files_found.each_with_index do |file_path, index|
      puts "  #{index + 1}. #{file_path}"
    end
    
    article_count = 0
    Dir.glob(File.join(news_dir, "*")).each do |file_path|
      puts "\n🔍 Processing: #{file_path}"
      
      if File.file?(file_path)
        puts "✅ Is a file"
        
        filename = File.basename(file_path)
        puts "📄 Filename: #{filename}"
        
        # Skip .DS_Store and other system files
        if filename.start_with?(".")
          puts "⏭️  Skipping system file: #{filename}"
          next
        end
        
        # Generate title from filename
        title = filename.gsub(/\.[^.]*$/, "").gsub(/_/, " ").titleize
        puts "📝 Generated title: #{title}"
        
        # Read file content
        begin
          content = File.read(file_path)
          puts "📄 Read content: #{content.length} characters"
          
          # Convert plain text to basic HTML
          html_content = content.split("\n\n").map { |paragraph| 
            "<p>#{paragraph.strip}</p>" 
          }.join("\n")
          
          puts "💾 Creating Article record..."
          # Set specific image URLs based on article title
          image_url = case title
          when "The Comback Of A Tabletop Sport"
            "https://cdn.shopify.com/s/files/1/2677/1846/files/History_of_Foosball_Table_600x600.jpg?v=1716307180"
          when "Tornado World Championships 2025"
            "https://arc.stimg.co/startribunemedia/3HJ67NZXJDQ26PKEVGO6EIVKHQ.jpg?&w=1080&ar=3/2&fit=crop"
          else
            "https://foosballplanet.com/cdn/shop/files/NSC-MatthewMTornadoTournamentT-3000FoosballTablewoassemblycompletedpic1_bd907b39-51a6-4c28-986a-1dcfde66cd4c_large.jpg?v=1692697838"
          end
          
          article = Article.create!(
            title: title,
            content: html_content,
            author: foos_news_user.fullname,
            user: foos_news_user,
            published_at: 1.day.ago,
            featured: true,
            image_url: image_url
          )
          puts "✅ Successfully created article: #{article.title} (ID: #{article.id}) by #{article.user.fullname}"
          article_count += 1
        rescue => e
          puts "❌ Failed to create article: #{e.message}"
          puts "   Error details: #{e.class}"
        end
      else
        puts "⚠️  Not a file, skipping"
      end
    end
    
    puts "\n📊 Article creation summary:"
    puts "   - Files processed: #{files_found.length}"
    puts "   - Articles created: #{article_count}"
    puts "   - Total articles in database: #{Article.count}"
  else
    puts "❌ News directory does not exist: #{news_dir}"
  end
end

puts "✅ Article creation process completed"
puts "\nArticles created successfully!"
puts "You can now view articles at /news"



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

# Create documents from assets folder

puts "\n📄 Creating documents from assets/documents folder..."

# Find Maryam Aly or any admin user
puts "👤 Looking for uploader user..."
uploader = User.find_by(firstname: "Maryam", lastname: "Aly")
if uploader
  puts "✅ Found Maryam Aly: #{uploader.fullname}"
else
  puts "⚠️  Maryam Aly not found, looking for any admin user..."
  uploader = User.where(admin: true).first
  if uploader
    puts "✅ Found admin user: #{uploader.fullname}"
  else
    puts "❌ No admin users found!"
  end
end

if uploader
  documents_dir = Rails.root.join("public", "assets", "documents", "docs")
  puts "📁 Checking documents directory: #{documents_dir}"
  
  if Dir.exist?(documents_dir)
    puts "✅ Documents directory exists!"
    puts "🔍 Scanning for files..."
    
    files_found = Dir.glob(File.join(documents_dir, "*"))
    puts "📋 Found #{files_found.length} items in directory"
    
    files_found.each_with_index do |file_path, index|
      puts "  #{index + 1}. #{file_path}"
    end
    
    document_count = 0
    Dir.glob(File.join(documents_dir, "*")).each do |file_path|
      puts "\n🔍 Processing: #{file_path}"
      
      if File.file?(file_path)
        puts "✅ Is a file"
        
        filename = File.basename(file_path)
        puts "📄 Filename: #{filename}"
        
        # Skip .DS_Store and other system files
        if filename.start_with?(".")
          puts "⏭️  Skipping system file: #{filename}"
          next
        end
        
        title = filename.gsub(/\.[^.]*$/, "").gsub(/_/, " ").titleize
        puts "📝 Generated title: #{title}"
        
        description = "Document: #{title}"
        puts "📄 Description: #{description}"
        
        file_url = "https://usafoosball.org/assets/documents/docs/#{filename}"
        puts "🔗 File URL: #{file_url}"
        
        puts "💾 Creating Document record..."
        begin
          document = Document.create!(
            title: title,
            description: description,
            uploaded_by: uploader.fullname,
            file_url: file_url
          )
          puts "✅ Successfully created document: #{document.title} (ID: #{document.id})"
          document_count += 1
        rescue => e
          puts "❌ Failed to create document: #{e.message}"
          puts "   Error details: #{e.class}"
        end
      else
        puts "⚠️  Not a file, skipping"
      end
    end
    
    puts "\n📊 Document creation summary:"
    puts "   - Files processed: #{files_found.length}"
    puts "   - Documents created: #{document_count}"
    puts "   - Total documents in database: #{Document.count}"
  else
    puts "❌ Documents directory does not exist: #{documents_dir}"
    puts "�� Current working directory: #{Dir.pwd}"
    puts "🔍 Available directories in public/assets:"
    if Dir.exist?(Rails.root.join("public", "assets"))
      Dir.entries(Rails.root.join("public", "assets")).each do |entry|
        puts "   - #{entry}" unless entry.start_with?(".")
      end
    else
      puts "   - public/assets directory does not exist"
    end
  end
else
  puts "❌ No uploader found - cannot create documents"
end

puts "✅ Document creation process completed"

