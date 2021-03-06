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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130112183428) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "contributors", :force => true do |t|
    t.string   "email",                                     :default => "", :null => false
    t.string   "encrypted_password",         :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                             :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "coordinator_approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "desired_week"
    t.text     "devotion_quick_description"
  end

  add_index "contributors", ["confirmation_token"], :name => "index_contributors_on_confirmation_token", :unique => true
  add_index "contributors", ["email"], :name => "index_contributors_on_email", :unique => true
  add_index "contributors", ["reset_password_token"], :name => "index_contributors_on_reset_password_token", :unique => true

  create_table "devotion_days", :force => true do |t|
    t.integer  "day_no"
    t.date     "publish_date"
    t.text     "coordinator_notes"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sent_count"
  end

  create_table "devotions", :force => true do |t|
    t.integer  "contributor_id"
    t.integer  "devotion_day_id"
    t.string   "title"
    t.text     "bible_text"
    t.string   "bible_book"
    t.string   "bible_chapter"
    t.string   "bible_verse"
    t.text     "content"
    t.string   "your_name"
    t.text     "about_me"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.integer  "attachment_file_size"
    t.string   "attachment_content_type"
    t.datetime "attachment_updated_at"
  end

  add_index "devotions", ["devotion_day_id"], :name => "index_devotions_on_devotion_day_id"

  create_table "rich_rich_files", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rich_file_file_name"
    t.string   "rich_file_content_type"
    t.integer  "rich_file_file_size"
    t.datetime "rich_file_updated_at"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.text     "uri_cache"
    t.string   "simplified_type",        :default => "file"
  end

  create_table "seasons", :force => true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "skip_sundays"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "navigation_title"
  end

  create_table "subscribers", :force => true do |t|
    t.string   "email"
    t.string   "private_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscribers", ["email"], :name => "index_subscribers_on_email"
  add_index "subscribers", ["private_code"], :name => "index_subscribers_on_private_code"

  create_table "videos", :force => true do |t|
    t.integer  "devotion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  add_index "videos", ["devotion_id"], :name => "index_videos_on_devotion_id"

end
