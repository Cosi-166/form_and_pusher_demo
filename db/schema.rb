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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20140309214454) do
=======
ActiveRecord::Schema.define(version: 20140316214743) do

  create_table "categories", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
>>>>>>> d55581b914075feb8d47fc2da6de5cac65f897dc

  create_table "items", force: true do |t|
    t.string   "title"
    t.text     "description"
<<<<<<< HEAD
    t.string   "type"
=======
    t.text     "owner"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "samples", force: true do |t|
    t.string   "name"
    t.integer  "age"
>>>>>>> d55581b914075feb8d47fc2da6de5cac65f897dc
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
