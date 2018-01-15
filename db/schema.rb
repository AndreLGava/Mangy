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

ActiveRecord::Schema.define(version: 20180113155901) do

  create_table "categories", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "sistem_id"
  end

  add_index "categories", ["sistem_id"], name: "index_categories_on_sistem_id"

  create_table "categories_sistems", force: :cascade do |t|
    t.integer "category_id"
    t.integer "sistem_id"
  end

  create_table "category_systems", force: :cascade do |t|
    t.integer  "sistem_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_systems", ["category_id"], name: "index_category_systems_on_category_id"
  add_index "category_systems", ["sistem_id"], name: "index_category_systems_on_sistem_id"

  create_table "documentations", force: :cascade do |t|
    t.text     "requisito"
    t.text     "description"
    t.text     "pratic"
    t.string   "part"
    t.string   "functionality"
    t.text     "traceable_item"
    t.string   "category"
    t.string   "link"
    t.string   "groups"
    t.string   "context"
    t.text     "tag"
    t.text     "configuration"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "historia", force: :cascade do |t|
    t.string   "url"
    t.integer  "sprint_id"
    t.integer  "category_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "historia", ["category_id"], name: "index_historia_on_category_id"
  add_index "historia", ["sprint_id"], name: "index_historia_on_sprint_id"

  create_table "histories", force: :cascade do |t|
    t.string   "url"
    t.integer  "sprint_id"
    t.integer  "category_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "histories", ["category_id"], name: "index_histories_on_category_id"
  add_index "histories", ["sprint_id"], name: "index_histories_on_sprint_id"

  create_table "issues", force: :cascade do |t|
    t.string   "link"
    t.boolean  "done",               default: false
    t.boolean  "available_for_test", default: false
    t.boolean  "real_problem",       default: true
    t.integer  "version_test_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.text     "description"
  end

  add_index "issues", ["version_test_id"], name: "index_issues_on_version_test_id"

  create_table "istories", force: :cascade do |t|
    t.string   "url"
    t.integer  "sprint_id"
    t.integer  "category_id"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "istories", ["category_id"], name: "index_istories_on_category_id"
  add_index "istories", ["sprint_id"], name: "index_istories_on_sprint_id"

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "rastreamentos", force: :cascade do |t|
    t.datetime "time"
    t.integer  "pessoa_id"
    t.integer  "issue_id"
    t.integer  "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rastreamentos", ["issue_id"], name: "index_rastreamentos_on_issue_id"
  add_index "rastreamentos", ["pessoa_id"], name: "index_rastreamentos_on_pessoa_id"
  add_index "rastreamentos", ["status_id"], name: "index_rastreamentos_on_status_id"

  create_table "sistems", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "sistem_id"
  end

  add_index "sistems", ["sistem_id"], name: "index_sistems_on_sistem_id"

  create_table "sprints", force: :cascade do |t|
    t.datetime "start"
    t.datetime "done"
    t.string   "meta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "talks", force: :cascade do |t|
    t.string   "who"
    t.text     "said"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tecnologies", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string   "part"
    t.text     "description"
    t.integer  "row_order"
    t.text     "settings"
    t.string   "file"
    t.text     "expected_result"
    t.integer  "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "category_id"
  end

  add_index "tests", ["category_id"], name: "index_tests_on_category_id"

  create_table "version_tests", force: :cascade do |t|
    t.text     "obtained_result"
    t.text     "impact"
    t.boolean  "check",           default: false
    t.integer  "version_id"
    t.integer  "test_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "version_tests", ["test_id"], name: "index_version_tests_on_test_id"
  add_index "version_tests", ["version_id"], name: "index_version_tests_on_version_id"

  create_table "versions", force: :cascade do |t|
    t.string   "responsable"
    t.string   "used_user"
    t.string   "system"
    t.text     "observation"
    t.text     "impediment"
    t.date     "start"
    t.date     "finish"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "sistem_id"
  end

  add_index "versions", ["sistem_id"], name: "index_versions_on_sistem_id"

end
