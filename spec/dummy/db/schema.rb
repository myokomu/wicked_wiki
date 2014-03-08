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

ActiveRecord::Schema.define(version: 20140214074005) do

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username"

  create_table "wicked_wiki_images", force: true do |t|
    t.string   "name"
    t.string   "file_meta"
    t.integer  "wiki_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "wicked_wiki_images", ["name"], name: "index_wicked_wiki_images_on_name"
  add_index "wicked_wiki_images", ["slug"], name: "index_wicked_wiki_images_on_slug", unique: true

  create_table "wicked_wiki_revisions", force: true do |t|
    t.text     "content"
    t.integer  "wiki_id"
    t.integer  "user_id"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wicked_wiki_revisions", ["ip"], name: "index_wicked_wiki_revisions_on_ip"
  add_index "wicked_wiki_revisions", ["user_id"], name: "index_wicked_wiki_revisions_on_user_id"
  add_index "wicked_wiki_revisions", ["wiki_id"], name: "index_wicked_wiki_revisions_on_wiki_id"

  create_table "wicked_wiki_wikis", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "protection", default: "none"
    t.integer  "user_id"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "wicked_wiki_wikis", ["ip"], name: "index_wicked_wiki_wikis_on_ip"
  add_index "wicked_wiki_wikis", ["slug"], name: "index_wicked_wiki_wikis_on_slug", unique: true
  add_index "wicked_wiki_wikis", ["title"], name: "index_wicked_wiki_wikis_on_title", unique: true
  add_index "wicked_wiki_wikis", ["user_id"], name: "index_wicked_wiki_wikis_on_user_id"

end
