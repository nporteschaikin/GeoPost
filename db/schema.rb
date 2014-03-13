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

ActiveRecord::Schema.define(:version => 20140115201758) do

  create_table "areas", :force => true do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.decimal  "radius",     :precision => 8, :scale => 2
    t.string   "label"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "areas", ["place_id"], :name => "index_areas_on_place_id"
  add_index "areas", ["user_id"], :name => "index_areas_on_user_id"

  create_table "assets", :force => true do |t|
    t.string   "type"
    t.integer  "attached_id"
    t.string   "attached_type"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "assets", ["attached_id"], :name => "index_assets_on_attached_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "likes", :force => true do |t|
    t.integer  "liked_id"
    t.string   "liked_type"
    t.integer  "user_id"
    t.datetime "created_at"
  end

  add_index "likes", ["liked_id"], :name => "index_likes_on_liked_id"
  add_index "likes", ["user_id"], :name => "index_likes_on_user_id"

  create_table "places", :force => true do |t|
    t.string "query"
    t.float  "latitude"
    t.float  "longitude"
    t.string "address"
    t.text   "types"
  end

  create_table "posts", :force => true do |t|
    t.integer  "place_id"
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "title"
    t.text     "body"
    t.integer  "likes_count",    :default => 0
    t.integer  "comments_count", :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "posts", ["place_id"], :name => "index_posts_on_place_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "tag_relationships", :force => true do |t|
    t.integer "tagged_id"
    t.string  "tagged_type"
    t.integer "tag_id"
  end

  add_index "tag_relationships", ["tag_id"], :name => "index_tag_relationships_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string "name"
    t.string "slug"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "default_area_id"
    t.datetime "date_of_birth"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
