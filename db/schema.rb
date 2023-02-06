# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_05_084736) do

  create_table "moods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "song_moods", force: :cascade do |t|
    t.integer "song_id", null: false
    t.integer "mood_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mood_id"], name: "index_song_moods_on_mood_id"
    t.index ["song_id"], name: "index_song_moods_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.string "genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_moods", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "mood_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mood_id"], name: "index_user_moods_on_mood_id"
    t.index ["user_id"], name: "index_user_moods_on_user_id"
  end

  create_table "user_songs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "song_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["song_id"], name: "index_user_songs_on_song_id"
    t.index ["user_id"], name: "index_user_songs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "song_moods", "moods"
  add_foreign_key "song_moods", "songs"
  add_foreign_key "user_moods", "moods"
  add_foreign_key "user_moods", "users"
  add_foreign_key "user_songs", "songs"
  add_foreign_key "user_songs", "users"
end
