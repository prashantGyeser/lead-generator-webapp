# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141203133952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "keywords", force: true do |t|
    t.string   "term"
    t.integer  "lead_stream_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin_created"
  end

  create_table "lead_streams", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city_name"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "leads", force: true do |t|
    t.string   "screen_name"
    t.text     "tweet"
    t.string   "location"
    t.string   "profile_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "times_shown"
    t.date     "date_last_shown"
    t.string   "user_image_url"
    t.string   "tweet_id"
    t.integer  "user_id"
    t.integer  "lead_stream_id"
    t.integer  "city_id"
    t.integer  "category_id"
    t.integer  "processor_datasift_subscription_id"
    t.integer  "klout_score"
    t.integer  "friends_count"
    t.integer  "followers_count"
    t.string   "priority"
    t.string   "poster_id"
    t.string   "poster_name"
    t.string   "poster_screen_name"
    t.integer  "poster_follower_count"
    t.integer  "poster_friends_count"
    t.boolean  "poster_verified"
    t.integer  "poster_statuses_count"
    t.string   "tweet_body"
    t.integer  "keyword_id"
    t.string   "poster_profile_image_url"
  end

  create_table "non_leads", force: true do |t|
    t.string   "poster_id"
    t.string   "poster_name"
    t.string   "poster_screen_name"
    t.integer  "poster_follower_count"
    t.integer  "poster_friends_count"
    t.boolean  "poster_verified"
    t.integer  "poster_statuses_count"
    t.string   "tweet_body"
    t.integer  "keyword_id"
    t.string   "poster_profile_image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.integer  "total_tweets_for_day"
    t.integer  "city_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_collected"
  end

  create_table "subscription_plans", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "lead_streams"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.string   "account_code"
    t.string   "plan_code"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tokens", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "screen_name"
  end

  create_table "tweet_replies", force: true do |t|
    t.integer  "lead_id"
    t.string   "message"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "token_id"
  end

  create_table "unprocessed_tweets", force: true do |t|
    t.string   "poster_id"
    t.string   "poster_name"
    t.string   "poster_screen_name"
    t.integer  "poster_follower_count"
    t.integer  "poster_friends_count"
    t.boolean  "poster_verified"
    t.integer  "poster_statuses_count"
    t.string   "tweet_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "keyword_id"
    t.string   "poster_profile_image_url"
    t.boolean  "processed"
  end

  create_table "user_categories", force: true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_cities", force: true do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_leads", force: true do |t|
    t.integer  "lead_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "viewed"
    t.integer  "lead_stream_id"
    t.boolean  "reply_sent"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "authorized_application"
    t.boolean  "user_sent_to_processor"
    t.integer  "total_streams"
    t.boolean  "setup_complete"
    t.integer  "trial_duration"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
