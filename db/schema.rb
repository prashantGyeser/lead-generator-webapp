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

ActiveRecord::Schema.define(version: 20150503061220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beta_signups", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "alternate_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "country_subdivisions", force: true do |t|
    t.integer  "country_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "radius"
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

  create_table "email_lefts", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
  end

  create_table "keywords", force: true do |t|
    t.string   "term"
    t.integer  "lead_stream_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin_created"
    t.boolean  "archived",             default: false
    t.datetime "last_searched"
    t.integer  "last_result_count"
    t.integer  "last_duplicate_count"
    t.boolean  "not_working"
    t.datetime "last_run"
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
    t.string   "name"
    t.integer  "email_left_id"
    t.string   "search_type"
    t.string   "country_name"
    t.integer  "country_id"
    t.integer  "time_left_for_processing_hours"
    t.integer  "time_left_for_processing_mins"
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
    t.boolean  "not_lead"
    t.boolean  "archived"
    t.string   "tweet_id"
    t.string   "gender"
    t.string   "country"
  end

  create_table "mailboxer_conversation_opt_outs", force: true do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

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
    t.string   "tweet_id"
    t.string   "location"
    t.string   "country"
  end

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "message"
    t.boolean  "archived",          default: false
    t.string   "notification_type"
  end

  create_table "reportable_cache", force: true do |t|
    t.string   "model_class_name", limit: 100,               null: false
    t.string   "report_name",      limit: 100,               null: false
    t.string   "grouping",         limit: 10,                null: false
    t.string   "aggregation",      limit: 10,                null: false
    t.string   "conditions",       limit: 100,               null: false
    t.float    "value",                        default: 0.0, null: false
    t.datetime "reporting_period",                           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reportable_cache", ["model_class_name", "report_name", "grouping", "aggregation", "conditions", "reporting_period"], name: "name_model_grouping_aggregation_period", unique: true, using: :btree
  add_index "reportable_cache", ["model_class_name", "report_name", "grouping", "aggregation", "conditions"], name: "name_model_grouping_agregation", using: :btree

  create_table "reports", force: true do |t|
    t.integer  "total_tweets_for_day"
    t.integer  "city_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_collected"
  end

  create_table "sample_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sample_leads", force: true do |t|
    t.integer  "sample_category_id"
    t.string   "tweet"
    t.string   "screen_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_emails", force: true do |t|
    t.string   "email"
    t.boolean  "notification_sent", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "temp_leads", force: true do |t|
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
    t.string   "tweet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.string   "country"
  end

  create_table "temp_non_leads", force: true do |t|
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
    t.string   "tweet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.string   "country"
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
    t.string   "profile_image_url"
  end

  create_table "training_data_exports", force: true do |t|
    t.string   "tweet_id"
    t.string   "keyword_term"
    t.string   "category"
    t.string   "tweet_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "training_data_type"
  end

  create_table "tweet_replies", force: true do |t|
    t.integer  "lead_id"
    t.string   "message"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "token_id"
    t.string   "tweet_id"
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
    t.string   "tweet_id"
    t.string   "geo_enabled"
    t.string   "location"
    t.string   "country"
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
    t.string   "email",                        default: "",    null: false
    t.string   "encrypted_password",           default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "authorized_application"
    t.boolean  "user_sent_to_processor"
    t.integer  "total_streams",                default: 1
    t.boolean  "setup_complete"
    t.integer  "trial_duration",               default: 7
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",            default: 0
    t.integer  "sample_category_id"
    t.boolean  "new_user",                     default: true
    t.boolean  "admin"
    t.boolean  "is_active",                    default: true
    t.boolean  "subscribed",                   default: false
    t.string   "website"
    t.boolean  "founder_welcome_sent",         default: false
    t.boolean  "trial_over_notification_sent", default: false
    t.boolean  "global"
    t.string   "active_beta_feature"
    t.boolean  "on_trial_or_subscribed",       default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
