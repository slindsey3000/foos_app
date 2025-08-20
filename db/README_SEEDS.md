# Database Seeds Documentation

## Overview
This directory contains seed files for populating the USA Foosball database with test data.

## Seed Files

### `seeds.rb` (Main Seed File)
The main seed file that runs when you execute `bin/rails db:seed`. This file:
- Loads the directors and admins seed file
- Creates test articles
- Creates test documents  
- Creates test clubs

### `directors_admin_seed.rb` (Directors and Admins Seed File)
A specialized seed file for creating and updating directors, admins, and World Cup selection committee members.

**Features:**
- Checks for existing users by email to avoid duplicates
- Updates existing users with new role assignments
- Creates new users with test data if they don't exist
- Handles all required fields with appropriate test data

**Usage:**
```bash
# Run the main seed file (includes directors/admin seed)
bin/rails db:seed

# Run only the directors/admin seed file
bin/rails runner db/directors_admin_seed.rb
```

## Personnel Data

### Directors
- Donald Wilson (President)
- Robert Mares (Vice President) 
- Terry Rue (Treasurer)
- Maryam Aly (Secretary)
- Tracy McMillan
- Jim Provost

### Admins
- Shawn Lindsey
- Jim Provost
- Maryam Aly

### World Cup Selection Committee
- Robert Mares
- Tom Yore

## Login Credentials
All users created by the seed files use the password: `password123`

Email addresses follow the pattern: `firstname@usafoosball.org`

Example:
- donald@usafoosball.org
- robert@usafoosball.org
- maryam@usafoosball.org

## Test Data
Users created by the seed file include obvious test data:
- Address: "123 Test Street"
- City: "Test City"
- State: "TS"
- ZIP: "12345"
- Phone: Generated based on name length

## Duplicate Prevention
The seed file checks for existing users by email address. If a user already exists, it will:
- Update the `director` boolean
- Update the `director_title` field
- Update the `admin` boolean
- Update the `world_cup_selection_committee` boolean

This allows you to run the seed file multiple times without creating duplicate users. 