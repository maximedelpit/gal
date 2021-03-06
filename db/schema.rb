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

ActiveRecord::Schema.define(version: 20180705154842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_stat_statements"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.string "linkedin_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industry_subcategories", force: :cascade do |t|
    t.string "name"
    t.boolean "validated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_industry_subcategories_on_name", unique: true
  end

  create_table "leads", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "company_size"
    t.string "location"
    t.string "job_title"
    t.string "phone"
    t.string "mail"
    t.string "linkedin_url"
    t.string "state"
    t.date "deadline"
    t.string "within"
    t.text "description"
    t.bigint "user_id"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "build_status"
    t.string "share_to"
    t.boolean "is_private"
    t.boolean "for_my_self"
    t.integer "offer_limit"
    t.index ["user_id"], name: "index_leads_on_user_id"
  end

  create_table "propositions", force: :cascade do |t|
    t.string "mail"
    t.string "state"
    t.boolean "click_to_buy"
    t.boolean "private", default: false
    t.bigint "user_id"
    t.bigint "lead_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.index ["lead_id"], name: "index_propositions_on_lead_id"
    t.index ["user_id"], name: "index_propositions_on_user_id"
  end

  create_table "prospect_areas", force: :cascade do |t|
    t.string "country"
    t.string "region"
    t.string "zipcode"
    t.string "department"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "validated"
    t.index ["name"], name: "index_prospect_areas_on_name", unique: true
  end

  create_table "subcategories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "industry_subcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["industry_subcategory_id"], name: "index_subcategories_on_industry_subcategory_id"
    t.index ["user_id"], name: "index_subcategories_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.boolean "validated"
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tutorials", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "youtube_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.string "job_title"
    t.string "phone_number"
    t.string "company"
    t.string "state"
    t.string "language"
    t.bigint "industry_id"
    t.bigint "subcategory_id"
    t.boolean "admin", default: false, null: false
    t.string "linkedin_email"
    t.string "provider"
    t.string "picture_url"
    t.string "uid"
    t.string "linkedin_url"
    t.datetime "token_expiry"
    t.string "token"
    t.boolean "accepts_tos"
    t.boolean "nl_subscription"
    t.boolean "publish_for_myself"
    t.boolean "publish_for_others"
    t.boolean "get_clients"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["industry_id"], name: "index_users_on_industry_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["subcategory_id"], name: "index_users_on_subcategory_id"
  end

  create_table "zones", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "prospect_area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prospect_area_id"], name: "index_zones_on_prospect_area_id"
    t.index ["user_id"], name: "index_zones_on_user_id"
  end

  add_foreign_key "leads", "users"
  add_foreign_key "propositions", "leads"
  add_foreign_key "propositions", "users"
  add_foreign_key "subcategories", "industry_subcategories"
  add_foreign_key "subcategories", "users"
  add_foreign_key "users", "industries"
  add_foreign_key "users", "subcategories"
  add_foreign_key "zones", "prospect_areas"
  add_foreign_key "zones", "users"
end
