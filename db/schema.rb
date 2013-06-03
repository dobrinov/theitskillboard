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

ActiveRecord::Schema.define(:version => 20130603185702) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "contact_type"
    t.string   "address"
    t.integer  "profile_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.date     "from_date"
    t.date     "to_date"
    t.integer  "study_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses_skills", :force => true do |t|
    t.integer "course_id"
    t.integer "skill_id"
  end

  create_table "employments", :force => true do |t|
    t.string   "position"
    t.date     "from_date"
    t.date     "to_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "profile_id"
    t.integer  "company_id"
  end

  create_table "impacts", :force => true do |t|
    t.date     "from"
    t.date     "to"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "interests", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "interests_profiles", :force => true do |t|
    t.integer "interest_id"
    t.integer "profile_id"
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "country"
    t.string   "city"
    t.string   "nationality"
    t.date     "birth_date"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.integer  "user_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "course_id"
  end

  create_table "projects_skills", :force => true do |t|
    t.integer "project_id"
    t.integer "skill_id"
  end

  create_table "skill_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "parent_skill_category_id"
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "skill_category_id"
  end

  create_table "studies", :force => true do |t|
    t.string   "program"
    t.date     "from_date"
    t.date     "to_date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "profile_id"
    t.integer  "university_id"
  end

  create_table "universities", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
