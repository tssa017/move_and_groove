# Move and Groove

Move and Groove is a fitness tracking app that allows users to sign up and monitor their progress towards fitness goals by logging their activities 🏊‍♀️

I designed and built this full-stack application as project 6 for the OpenClassrooms Full Stack Developer path. For the back-end I use Ruby on Rails with Devise for authentication and PostgreSQL for the database. For the front-end I use Tailwind CSS.

## Features

-   **User Authentication**: Allows users to sign up, log in, log out, and reset their passwords.
-   **Activity Tracking**: Users can create, edit, and delete activities to track their workouts.
-   **Activity Logs**: Users can log their workouts including the date, duration, repetitions, calories consumed, and notes.
-   **User Profile**: Users can view and update their profile information including first name, last name, age, and weight.

## Requirements

-   Ruby version 3.2.2
-   [Rails version 7.1.3](https://guides.rubyonrails.org/v5.1/getting_started.html)
-   PostgreSQL database

## Installation

1. Clone and access the project using the following commands:

```bash
git clone git@github.com:tssa017/move_and_groove.git
cd move_and_groove
```

2. Install dependencies specified in the Gemfile using the following command:

```bash
bundle install
```

3. Setup the database with the following commands:

```bash
rails db:create
rails db:migrate
```

4. Start the server:

```bash
rails server
```

## Configuration

Ensure you have the following environment variables set in a `config/.env` file:

-   `DB_NAME`
-   `DB_USER`
-   `DB_PASSWORD`

## Usage

1. Sign up for an account.
2. Log in using your credentials.
3. Navigate through the application to track your activities and log your workouts.
4. Update your profile information as needed.
5. You may delete your account if necessary.

## Models

-   **User**: Represents a registered user of the application.
-   **Activity**: Represents a type of activity (e.g., running, weightlifting).
-   **ActivityLog**: Logs the details of each workout session including date, duration, repetitions, calories consumed, and notes.

## Database Schema

The application uses PostgreSQL as the development and production database. Below is the schema definition:

```ruby
ActiveRecord::Schema[7.1].define(version: 2024_03_22_152525) do
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "title", limit: 45
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_duration_based"
  end

  create_table "activity_logs", force: :cascade do |t|
    t.datetime "date", precision: nil
    t.float "duration"
    t.integer "calories_consumed"
    t.string "notes", limit: 800
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "activity_id"
    t.integer "repetitions"
    t.index ["user_id"], name: "index_activity_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.integer "weight"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activity_logs", "activities"
  add_foreign_key "activity_logs", "users"
end
```

## Resources

-   [Rails docs](https://guides.rubyonrails.org/)
-   [Project description](https://openclassrooms.com/fr/paths/509/projects/241/assignment)

Enjoy the platform! 🚀
