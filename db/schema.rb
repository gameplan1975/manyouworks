ActiveRecord::Schema.define(version: 2020_05_18_033736) do

  enable_extension "plpgsql"

  create_table "labelings", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_labelings_on_label_id"
    t.index ["task_id"], name: "index_labelings_on_task_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name", null: false
    t.string "status"
    t.string "label"
    t.date "task_limit"
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
    t.string "email", null: false
  end

  add_foreign_key "labelings", "labels"
  add_foreign_key "labelings", "tasks"
  add_foreign_key "tasks", "users"
end
