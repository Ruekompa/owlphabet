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

ActiveRecord::Schema.define(version: 20160418220328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.date     "release_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "cover_art"
    t.string   "slug"
    t.integer  "artist_id"
    t.integer  "project_id"
  end

  add_index "albums", ["artist_id"], name: "index_albums_on_artist_id", using: :btree
  add_index "albums", ["project_id"], name: "index_albums_on_project_id", using: :btree

  create_table "artists", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "slug"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "artists", ["email"], name: "index_artists_on_email", unique: true, using: :btree
  add_index "artists", ["invitation_token"], name: "index_artists_on_invitation_token", unique: true, using: :btree
  add_index "artists", ["invitations_count"], name: "index_artists_on_invitations_count", using: :btree
  add_index "artists", ["invited_by_id"], name: "index_artists_on_invited_by_id", using: :btree
  add_index "artists", ["name"], name: "index_artists_on_name", unique: true, using: :btree
  add_index "artists", ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true, using: :btree
  add_index "artists", ["slug"], name: "index_artists_on_slug", unique: true, using: :btree

  create_table "credits", force: :cascade do |t|
    t.text     "artist_ids", default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "cover_photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "artist_id"
  end

  add_index "profiles", ["artist_id"], name: "index_profiles_on_artist_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "artist_id"
    t.string   "slug"
    t.string   "cover_photo"
  end

  add_index "projects", ["artist_id"], name: "index_projects_on_artist_id", using: :btree
  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "tracks", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "artist_id"
    t.string   "album_id"
    t.string   "file_name"
    t.integer  "project_id"
    t.integer  "row_order"
    t.integer  "duration"
    t.string   "title"
    t.string   "slug"
    t.string   "info_artist"
    t.string   "info_album"
    t.string   "info_cover"
    t.integer  "info_year"
  end

  add_index "tracks", ["album_id"], name: "index_tracks_on_album_id", using: :btree
  add_index "tracks", ["artist_id"], name: "index_tracks_on_artist_id", using: :btree
  add_index "tracks", ["project_id"], name: "index_tracks_on_project_id", using: :btree

  add_foreign_key "albums", "artists"
  add_foreign_key "albums", "projects"
  add_foreign_key "projects", "artists"
  add_foreign_key "tracks", "projects"
end
