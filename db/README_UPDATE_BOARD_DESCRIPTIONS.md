# Board Description Update Script

## Overview
This script updates board member descriptions in the database using data from `foosball_board.json`.

## What it does
- Reads board member data from `foosball_board.json`
- Matches board members by first and last name
- Updates the `about` field in the User model for directors
- Provides detailed logging and statistics

## How to run

### On Heroku (Production)
```bash
heroku run rails runner db/update_board_descriptions.rb
```

### Locally (Development)
```bash
rails runner db/update_board_descriptions.rb
```

## File Structure
- **Input**: `foosball_board.json` (in project root)
- **Script**: `db/update_board_descriptions.rb`
- **Output**: Updates `users.about` field for directors

## JSON Format Expected
```json
[
  {
    "name": "Donald Wilson",
    "description": "Donald Wilson is the president of the United States Table Soccer Organization..."
  }
]
```

## Matching Logic
- Splits full name from JSON into firstname and lastname
- Searches for User records where `director: true` and names match
- Updates the `about` field with the description from JSON

## Safety Features
- Only updates existing director records
- Provides detailed error reporting
- Shows statistics of successful updates vs. errors
- Lists all current board members and their description status

## Example Output
```
Updating board member descriptions from foosball_board.json...
Processing 7 board members from JSON...
Updated: Donald Wilson (1/7)
Updated: Robert Mares (2/7)
Updated: Maryam Aly (3/7)
Updated: Terry Rue (4/7)
Updated: Tracy McMillan (5/7)
Updated: Jim Provost (6/7)
Updated: Tom Yore (7/7)

--- Board Description Update Complete ---
Total board members in JSON: 7
Successfully updated: 7
Not found in database: 0
Errors: 0

Current board members in database:
- Donald Wilson (President): ✓ Has description
- Robert Mares (Vice President): ✓ Has description
- Maryam Aly (Secretary): ✓ Has description
- Terry Rue (Treasurer): ✓ Has description
- Tracy McMillan (Board Member): ✓ Has description
- Jim Provost (Board Member): ✓ Has description
- Tom Yore (Board Member): ✓ Has description
```
