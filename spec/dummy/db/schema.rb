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

ActiveRecord::Schema.define(version: 20141022152601) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "redditor_containers", force: true do |t|
    t.string   "type"
    t.integer  "position"
    t.string   "redditable_type"
    t.integer  "redditable_id"
    t.text     "options"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "redditor_images", force: true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.integer  "position"
    t.string   "src"
    t.string   "title"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "container_id"
    t.text     "options"
  end

  add_index "redditor_images", ["imageable_id"], name: "index_redditor_images_on_imageable_id"
  add_index "redditor_images", ["imageable_type"], name: "index_redditor_images_on_imageable_type"

  create_table "redditor_pages", force: true do |t|
    t.integer  "pageable_id"
    t.string   "pageable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "redditor_pages", ["pageable_id"], name: "index_redditor_pages_on_pageable_id"
  add_index "redditor_pages", ["pageable_type"], name: "index_redditor_pages_on_pageable_type"

  create_table "redditor_slider_blocks", force: true do |t|
    t.integer  "page_id"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "redditor_slider_blocks", ["page_id"], name: "index_redditor_slider_blocks_on_page_id"

  create_table "redditor_text_blocks", force: true do |t|
    t.integer  "page_id"
    t.text     "content"
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "container_id"
  end

  add_index "redditor_text_blocks", ["page_id"], name: "index_redditor_text_blocks_on_page_id"

  create_table "redditor_video_blocks", force: true do |t|
    t.integer  "page_id"
    t.integer  "position"
    t.integer  "width"
    t.integer  "height"
    t.string   "link"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "container_id"
    t.text     "options"
  end

  add_index "redditor_video_blocks", ["page_id"], name: "index_redditor_video_blocks_on_page_id"

end
