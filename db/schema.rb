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

ActiveRecord::Schema.define(version: 20150730011357) do

  create_table "audios", force: true do |t|
    t.string   "sound_file_file_name"
    t.string   "sound_file_content_type"
    t.integer  "sound_file_file_size"
    t.datetime "sound_file_updated_at"
  end

  create_table "bios", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clinics", force: true do |t|
    t.string   "what"
    t.datetime "when"
    t.string   "where"
    t.string   "how"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eggs", force: true do |t|
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "gallery_id"
  end

  create_table "links", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mobile_texts", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "msg"
    t.string   "scroll_msg"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", force: true do |t|
    t.string   "what"
    t.string   "where"
    t.datetime "when"
    t.string   "how"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_media_links", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tools", force: true do |t|
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "text"
  end

  create_table "videos", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
