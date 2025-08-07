class HomeController < ApplicationController
  def index
    # For now, we'll use placeholder data until models are created
    @news_articles = [
      {
        "title" => "2024 National Championship Announced",
        "excerpt" => "The USA Foosball Association is excited to announce the 2024 National Championship tournament...",
        "image_url" => "/assets/news-championship.jpg",
        "published_at" => Date.current - 2.days,
        "slug" => "2024-national-championship"
      },
      {
        "title" => "New Training Program Launches",
        "excerpt" => "We're launching a comprehensive training program for players of all skill levels...",
        "image_url" => "/assets/news-training.jpg",
        "published_at" => Date.current - 5.days,
        "slug" => "new-training-program"
      },
      {
        "title" => "Regional League Updates",
        "excerpt" => "Updates on regional league standings and upcoming matches across the country...",
        "image_url" => "/assets/news-league.jpg",
        "published_at" => Date.current - 1.week,
        "slug" => "regional-league-updates"
      }
    ]

    @locations = [
      {
        "id" => 1,
        "name" => "Downtown Foosball Club",
        "address" => "123 Main St, New York, NY",
        "description" => "Premier foosball facility with 12 tournament tables",
        "image_url" => "/assets/location-downtown.jpg",
        "type" => "Club"
      },
      {
        "id" => 2,
        "name" => "Sports Bar & Grill",
        "address" => "456 Oak Ave, Los Angeles, CA",
        "description" => "Casual play with great food and atmosphere",
        "image_url" => "/assets/location-sportsbar.jpg",
        "type" => "Bar"
      },
      {
        "id" => 3,
        "name" => "Community Center",
        "address" => "789 Pine Rd, Chicago, IL",
        "description" => "Family-friendly environment with beginner tables",
        "image_url" => "/assets/location-community.jpg",
        "type" => "Community"
      },
      {
        "id" => 4,
        "name" => "University Rec Center",
        "address" => "321 Campus Dr, Austin, TX",
        "description" => "Student-focused facility with competitive leagues",
        "image_url" => "/assets/location-university.jpg",
        "type" => "University"
      },
      {
        "id" => 5,
        "name" => "Professional Training Center",
        "address" => "654 Elite Blvd, Miami, FL",
        "description" => "High-end facility with coaching and tournaments",
        "image_url" => "/assets/location-training.jpg",
        "type" => "Training"
      },
      {
        "id" => 6,
        "name" => "Family Entertainment Center",
        "address" => "987 Fun Way, Seattle, WA",
        "description" => "All-ages venue with multiple table types",
        "image_url" => "/assets/location-family.jpg",
        "type" => "Family"
      }
    ]
  end
end
