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

ActiveRecord::Schema.define(version: 20170419141731) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diner_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "diner_id"
    t.integer  "delay_count"
    t.integer  "on_time_count"
    t.integer  "no_show_count"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "diners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "telephone"
    t.date     "dob"
    t.string   "add_line1"
    t.string   "add_line2"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dining_informations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "restaurant_id"
    t.string   "dining_style"
    t.string   "phone_number"
    t.string   "website"
    t.string   "add_info"
    t.string   "dress_code"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "capacity_seating"
    t.integer  "time_seating"
    t.string   "cuisines"
  end

  create_table "favourites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "restaurant_id"
    t.integer  "diner_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "holidays", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "restaurant_id"
    t.date     "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "message"
    t.boolean  "checked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.string   "description"
    t.date     "start_date"
    t.time     "start_time"
    t.date     "end_date"
    t.time     "end_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "reservations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "diner_id"
    t.integer  "restaurant_id"
    t.integer  "time_slot_id"
    t.integer  "packs"
    t.integer  "meal_type_id"
    t.integer  "payment_status"
    t.integer  "reservation_status"
    t.integer  "customer_status"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "notification_params", limit: 65535
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "purchased_at"
  end

  create_table "restaurant_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "position"
    t.string   "restaurant_name"
    t.string   "telephone"
    t.string   "city"
    t.string   "province"
    t.integer  "status"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "restaurant_id"
    t.string   "add_line1"
    t.string   "add_line2"
  end

  create_table "restaurants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "position"
    t.string   "restaurant_name"
    t.string   "telephone"
    t.string   "city"
    t.string   "province"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "about"
    t.string   "add_line1"
    t.string   "add_line2"
    t.string   "email"
  end

  create_table "time_periods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "restaurant_id"
    t.integer  "week_day"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "time_slots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "restaurant_id"
    t.date     "date"
    t.time     "time"
    t.integer  "reservation_count"
    t.integer  "waiting_list_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "user_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "waitings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "time_slot_id"
    t.integer  "diner_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "week_days", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
