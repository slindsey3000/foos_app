# Club Seeding Script

This script populates the clubs database from the `foosball_clubs.json` file.

## Usage

Run the script from the Rails application root:

```bash
rails runner db/seed_clubs.rb
```

## What it does

1. Reads the `foosball_clubs.json` file
2. Maps JSON fields to Club model fields:
   - `name` → `name`
   - `address` → `address`
   - `city` → `city`
   - `state` → `state`
   - `zip` → `zip_code`
   - `contact` → `phone`
   - `event_time` → `day_and_time_info`
   - `notes` → `description`
   - `administrator` → `contact_person`
   - `tables` → added to `description`

3. Creates Club records in the database
4. Provides progress updates and final statistics

## Field Mapping

| JSON Field | Club Model Field | Description |
|------------|------------------|-------------|
| name | name | Club name |
| address | address | Street address |
| city | city | City name |
| state | state | State abbreviation |
| zip | zip_code | ZIP code |
| contact | phone | Phone number |
| event_time | day_and_time_info | Playing schedule |
| notes | description | Club information |
| administrator | contact_person | Club administrator |
| tables | description | Number of tables (appended) |

## Notes

- The script will clear existing clubs before seeding (remove `Club.destroy_all` if you want to keep existing data)
- Tables information is appended to the description field
- The script handles errors gracefully and continues processing
- Progress is shown every 10 clubs processed
